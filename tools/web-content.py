#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Parse the Swift QualityRights content DSL into JSON for the web app.
Reliable for OUR own constrained DSL (string literals, arrays, nil, ranges,
.caseName(args), Struct(args), Theme.x refs, chapter-name refs)."""
import re, json, sys, os

ACCENT = {  # Theme.swift rgb(0-1) -> hex
    "accent": (0.24,0.45,0.62), "guideline": (0.30,0.42,0.55),
    "dotp": (0.24,0.52,0.58), "stabilization": (0.78,0.52,0.24),
    "recovery": (0.30,0.56,0.42), "supportedDecision": (0.42,0.40,0.66),
}
def hexc(name):
    r,g,b = ACCENT[name]
    return "#%02x%02x%02x" % (round(r*255), round(g*255), round(b*255))

# ---------- tokenizer ----------
def tokenize(s):
    toks=[]; i=0; n=len(s)
    while i<n:
        c=s[i]
        if c in ' \t\r\n': i+=1; continue
        if c=='/' and i+1<n and s[i+1]=='/':          # line comment
            while i<n and s[i]!='\n': i+=1
            continue
        if c=='"':                                     # string literal
            i+=1; buf=[]
            while i<n:
                ch=s[i]
                if ch=='\\' and i+1<n:
                    nx=s[i+1]
                    buf.append({'n':'\n','t':'\t','"':'"','\\':'\\'}.get(nx,nx)); i+=2; continue
                if ch=='"': i+=1; break
                buf.append(ch); i+=1
            toks.append(('STR',''.join(buf))); continue
        if c=='.' and s[i+1:i+3]=='..':                # range ...
            toks.append(('DOTS','...')); i+=3; continue
        if c in '()[]:,.':
            toks.append(('OP',c)); i+=1; continue
        if c.isdigit():
            j=i
            while j<n and s[j].isdigit(): j+=1
            toks.append(('INT',int(s[i:j]))); i=j; continue
        if c.isalpha() or c=='_':
            j=i
            while j<n and (s[j].isalnum() or s[j]=='_'): j+=1
            toks.append(('ID',s[i:j])); i=j; continue
        i+=1
    toks.append(('EOF',None))
    return toks

class P:
    def __init__(self,toks): self.t=toks; self.i=0
    def peek(self,k=0): return self.t[self.i+k]
    def next(self): x=self.t[self.i]; self.i+=1; return x
    def expect(self,ty,v=None):
        x=self.next()
        assert x[0]==ty and (v is None or x[1]==v), f"expected {ty} {v}, got {x}"
        return x
    def value(self):
        ty,v=self.peek()
        if ty=='STR': self.next(); return v
        if ty=='INT':
            self.next()
            if self.peek()[0]=='DOTS':
                self.next(); b=self.expect('INT')[1]; return {'__range__':[v,b]}
            return v
        if ty=='ID' and v=='nil': self.next(); return None
        if ty=='OP' and v=='[':                         # array
            self.next(); items=[]
            while not (self.peek()==('OP',']')):
                items.append(self.value())
                if self.peek()==('OP',','): self.next()
            self.expect('OP',']'); return items
        if ty=='OP' and v=='.':                          # .caseName(...)
            self.next(); name=self.expect('ID')[1]
            if self.peek()==('OP','('):
                return {'__case__':name,'args':self.args()}
            return {'__case__':name,'args':[]}
        if ty=='ID':                                     # Struct(...) or ref or Theme.x
            self.next()
            if self.peek()==('OP','('):
                return {'__call__':v,'args':self.args()}
            if self.peek()==('OP','.'):
                self.next(); sub=self.expect('ID')[1]; return {'__ref__':f"{v}.{sub}"}
            return {'__ident__':v}
        raise AssertionError(f"unexpected {self.peek()}")
    def args(self):
        self.expect('OP','('); out=[]
        while not (self.peek()==('OP',')')):
            label=None
            if self.peek()[0]=='ID' and self.peek(1)==('OP',':'):
                label=self.next()[1]; self.next()
            out.append((label,self.value()))
            if self.peek()==('OP',','): self.next()
        self.expect('OP',')'); return out

def el(case,args):
    """Normalize a .case(args) into a web element dict."""
    pos=[v for (l,v) in args if l is None]
    kw={l:v for (l,v) in args if l is not None}
    def g(i,label,default=None):
        if label in kw: return kw[label]
        return pos[i] if i<len(pos) else default
    c=case
    if c=='heading':    return {'t':'heading','text':pos[0]}
    if c=='subheading': return {'t':'subheading','text':pos[0]}
    if c=='paragraph':  return {'t':'para','text':pos[0]}
    if c=='caption':    return {'t':'caption','text':pos[0]}
    if c=='bullets':    return {'t':'bullets','items':pos[0]}
    if c=='numbered':   return {'t':'numbered','items':pos[0]}
    if c=='definition': return {'t':'definition','term':g(0,'term'),'body':g(1,'body')}
    if c=='example':    return {'t':'example','title':g(0,'title'),'body':g(1,'body')}
    if c=='prompt':     return {'t':'prompt','id':g(0,'id'),'label':g(1,'label'),'lines':g(2,'lines',3)}
    if c=='checklist':  return {'t':'checklist','id':g(0,'id'),'title':g(1,'title'),'items':g(2,'items')}
    if c=='fieldRows':  return {'t':'fieldRows','id':g(0,'id'),'title':g(1,'title'),'rows':g(2,'rows')}
    if c=='scale':
        rng=g(4,'range'); mn,mx=(rng['__range__'] if isinstance(rng,dict) else [0,100])
        return {'t':'scale','id':g(0,'id'),'label':g(1,'label'),'low':g(2,'low'),'high':g(3,'high'),'min':mn,'max':mx}
    if c=='transcript':
        lines=[]
        for ln in (g(3,'lines') or []):
            la={l:v for (l,v) in ln['args']}
            lines.append({'speaker':la['speaker'],'text':la['text']})
        return {'t':'transcript','id':g(0,'id'),'title':g(1,'title'),'note':g(2,'note'),'lines':lines}
    raise AssertionError("unknown element case "+c)

def chapter_from_call(call):
    a={l:v for (l,v) in call['args']}
    els=[el(e['__case__'],e['args']) for e in a['elements']]
    return {'id':a['id'],'number':a['number'],'title':a['title'],'elements':els}

def chapter_from_topic(call):
    pos=[v for (l,v) in call['args'] if l is None]
    kw={l:v for (l,v) in call['args'] if l is not None}
    cid,number,title,_img=pos[0],pos[1],pos[2],pos[3]
    goal=kw['goal']; qs=kw['questions']; cont=kw['content']; plabel=kw['promptLabel']
    return {'id':cid,'number':number,'title':title,'elements':[
        {'t':'definition','term':'핵심목표','body':goal},
        {'t':'subheading','text':'핵심질문'},
        {'t':'bullets','items':qs},
        {'t':'subheading','text':'핵심내용'},
        {'t':'bullets','items':cont},
        {'t':'prompt','id':cid+'_q','label':plabel,'lines':3},
    ]}

def parse_file(path):
    src=open(path,encoding='utf-8').read()
    # collect every  static let NAME = Call(...)
    defs={}; tool=None
    for m in re.finditer(r'static let (\w+)\s*=\s*(Tool|Chapter|topic)\(', src):
        name=m.group(1); i=m.end()-1  # at '('
        p=P(tokenize(src[m.start()+len('static let '):]))
        # re-parse from the call token: simpler to tokenize substring from Kind(
        sub=src[src.index(m.group(2)+'(', m.start()):]
        pp=P(tokenize(sub)); val=pp.value()
        if m.group(2)=='Tool': tool=val
        else: defs[name]=('topic' if m.group(2)=='topic' else 'chapter', val)
    ta={l:v for (l,v) in tool['args']}
    chapter_refs=[c['__ident__'] for c in ta['chapters']]
    chapters=[]
    for ref in chapter_refs:
        kind,val=defs[ref]
        chapters.append(chapter_from_topic(val) if kind=='topic' else chapter_from_call(val))
    accent_ref=ta['accent']['__ref__'].split('.')[-1]
    return {
        'id':ta['id'],'name':ta['name'],'english':ta.get('englishName'),
        'subtitle':ta['subtitle'],'accent':hexc(accent_ref),
        'leadAuthor':ta['leadAuthor'],'institution':ta['institution'],
        'chapters':chapters,
    }

ROOT=sys.argv[1]
files=[
    'engine/Content/GuidelineContent.swift',
    'tools/OpenDialogueContent.swift',
    'tools/DOTPContent.swift',
    'tools/StabilizationContent.swift',
    'tools/RecoveryContent.swift',
    'tools/SupportedDecisionContent.swift',
]
tools=[parse_file(os.path.join(ROOT,f)) for f in files]
out=json.dumps(tools,ensure_ascii=False,indent=1)
print("window.QR_CONTENT = "+out+";")
sys.stderr.write("tools=%d\n"%len(tools))
for t in tools:
    ne=sum(len(c['elements']) for c in t['chapters'])
    sys.stderr.write("  %-22s chapters=%2d elements=%3d\n"%(t['id'],len(t['chapters']),ne))
