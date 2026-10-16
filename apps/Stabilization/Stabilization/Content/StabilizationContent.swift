import Foundation

/// 흥분환자 안정화치료 — 정신보건전문가 교육 매뉴얼 (천주의성요한병원).
/// A group-discussion training manual: each chapter pairs short teaching
/// content with reflection/discussion questions, anchored to a shared virtual
/// case (당사자 B). Transcribed from the printed manual.
enum StabilizationContent {

    static let tool = Tool(
        id: "stabilization",
        name: "흥분환자 안정화치료",
        englishName: "고조완화기법 (De-escalation)",
        subtitle: "흥분과 공격성에 대한 올바른 이해와, 강압을 최소화하는 비강압적 진정과정. 사례(당사자 B)를 중심으로 토론합니다.",
        systemImage: "waveform.path.ecg",
        accent: Theme.stabilization,
        leadAuthor: "이요한",
        institution: "천주의성요한병원",
        chapters: [c01, c02, c03, c04, c05, c06, c07, c08, c09, c10, c11, c12, c13, c14, c15, c16, caseStudy]
    )

    // 01
    private static let c01 = Chapter(
        id: "st_c01", number: "01", title: "흥분이란?",
        systemImage: "exclamationmark.bubble",
        elements: [
            .subheading("1) 흥분에는 의미가 있다"),
            .bullets([
                "흥분환자가 공격적으로 될 수 있으나, 흥분환자가 곧 공격적인 환자는 아니다.",
                "흥분은 강압적 환경에서 할 수 있는, 서툴지만 유일한 자기 주장이자 자기 표현이다.",
                "흥분은 문제해결을 위한 최선일 수 있다.",
                "흥분은 회복과 성장 과정에서 반드시 거쳐야 할 ‘치료과정의 사춘기’ 같은 것일 수 있다.",
                "흥분과 갈등은 치료과정·치료적 관계·병동에 문제가 있다는 신호다."
            ]),
            .prompt(id: "st_c01_q1", label: "위 내용에 동의가 되시나요? 개인적 경험이나 사례를 통해 어떤 점에서 그러한가요?", lines: 3),
            .subheading("2) 흥분은 단순한 감정의 문제만은 아니다"),
            .bullets([
                "지각(Perception): 위험과 관련된 특정 자극에 과하게 민감",
                "정서(Emotion): 불안정하여 불안과 분노에 휩싸이기 쉬움",
                "인지(Cognition): 집중·기억·이해·논리·유연성 부족, 자신의 문제를 객관적으로 보기 어려움",
                "신체(Body): 거친 호흡, 심계항진, 손떨림",
                "행동(Behavior): 목적 없고 반복적인 행동(발구르기, 손 만지작거리기 등)"
            ]),
            .prompt(id: "st_c01_q2", label: "여러분은 흥분 시 어떤 특징(지각·정서·인지·신체·행동)을 보이시나요?", lines: 3),
            .subheading("3) 흥분은 단순하고 급작스럽지 않다"),
            .paragraph("흥분은 점진적으로 진행하며(긴장→상승→정점→하강→위기 후 소진), 하나의 스트레스가 아니라 환자 위험요인·환경 자극요인·진정과정에 개입한 치료진 요인 등 여러 요인이 조금씩 쌓여 진행합니다."),
            .subheading("4) 흥분은 갈등 속에서 악화된다"),
            .paragraph("정신과 병동 내 갈등은 쉽게 타협하기 어렵습니다. 흥분이 진행될수록 환자의 요구(현실적 요구·정서적 요구)와 치료자와의 갈등은 커지고, 환자의 조절능력은 줄어들며 치료적 관계는 약화됩니다."),
            .prompt(id: "st_c01_q3", label: "정신보건전문가로서 여러분은 당사자와 어떤 현실적 갈등을 경험하나요?", lines: 3)
        ])

    // 02
    private static let c02 = Chapter(
        id: "st_c02", number: "02", title: "갈등은 환자를, 흥분사건은 치료자를 변화시킨다",
        systemImage: "arrow.2.squarepath",
        elements: [
            .subheading("가. 갈등 속 변화"),
            .bullets([
                "환자–치료자 관계: 경쟁적·적대적 관계로 변화 / 불신 / 적(敵) 이미지 / 개인 신상 비난 / 탈개인화",
                "사고의 변화: 단순한 사고 / 융통성 부족 / 흑백논리 / 탓하기 / 피해의식 / 부정적·재앙적 예상",
                "갈등·경쟁에 대한 집착: 승리에 대한 집착 / 집요한 요구와 설득 / 제로섬 게임 / 극한의 행동"
            ]),
            .subheading("나. 진정과정 중 치료자의 심리변화 (① ~ ⑭)"),
            .paragraph("트라우마 재경험(‘또 맞을 것 같아’), 실패에 대한 두려움, 면담 유지의 부담감, 거절·무시·모독에 대한 두려움, 많은 정신적 에너지 소모, 이해·경청·공감의 어려움, 요구 대처의 곤란, 시간 조절의 어려움, ‘추가 업무’ 인식, 지지적 태도 유지의 부담, 자신도 흥분할까 봐의 두려움, 흥분사건에 대한 책임감, 시간적 압박감, 주변 동료의 평가 시선."),
            .prompt(id: "st_c02_q1", label: "근무 현장에서 흥분환자를 만나는 선생님의 심리는 어떠한가요? 위 항목 중 해당되는 것을 적어보세요.", lines: 3)
        ])

    // 03
    private static let c03 = Chapter(
        id: "st_c03", number: "03", title: "진정과정의 다양한 단계와 개입방법",
        systemImage: "chart.line.uptrend.xyaxis",
        elements: [
            .paragraph("진정과정은 개입 시점에 따라 흥분 前 단계 개입(치료환경·조기개입·집중관리·개별위기관리), 흥분 단계 개입(의사소통을 통한 개입·갈등해결전략·약물·억제/격리), 흥분 後 단계 개입(디브리핑)으로 나뉩니다."),
            .bullets([
                "개입의 강압성 여부에 따라: 비강압치료 vs 강압치료",
                "개입하는 문제에 따라: 정서조절 / 갈등해결 / 치료적 관계 강화 / 의사소통 등"
            ]),
            .prompt(id: "st_c03_q1", label: "입원 당일~3일째 흥분사건 전까지 B에게 어떤 흥분 前 단계 개입이 있었으면 좋았을까요?", lines: 3)
        ])

    // 04
    private static let c04 = Chapter(
        id: "st_c04", number: "04", title: "잘못된 근거에 기반한 강압치료 선택",
        systemImage: "hand.raised.slash",
        elements: [
            .paragraph("강압치료를 선택하는 흔한 근거들은 대부분 잘못된 전제에 기반합니다."),
            .bullets([
                "‘강압치료가 빠르다’ → 억제·격리·해제까지의 총 시간을 보면 빠르지 않다.",
                "‘확실한 방법이다’ → 흥분을 잠시 덮을 뿐이다.",
                "‘어렵지 않다’ → 안전하고 신속하게 하려면 오히려 교육이 필요하다.",
                "‘편하다’ → 갈수록 몸과 마음이 부담스럽다."
            ]),
            .prompt(id: "st_c04_q1", label: "B가 받은 강압치료는 시간·효율성 측면에서 실제로 어떠했나요? (개시~종료 시간, 총 소요인력)", lines: 2),
            .prompt(id: "st_c04_q2", label: "B는 총 3차례 강압치료를 받았습니다. 흥분사건 재발·정서적 안정·치료 협조 측면에서 효과성은 어떠했나요?", lines: 3)
        ])

    // 05
    private static let c05 = Chapter(
        id: "st_c05", number: "05", title: "강압치료로 인한 부정적 영향",
        systemImage: "bandage",
        elements: [
            .bullets([
                "환자의 신체적 손상: 찰과상, 피하출혈, 근육·뼈·관절·치아·뇌 손상 등",
                "환자의 심리적 손상: 두려움·무력감·모멸감·불신·분노 / 트라우마 발생·재경험",
                "치료·회복에 미치는 영향: 증상 악화 / 치료적 관계 손상·치료 거부 / 자발적 감정조절 학습 기회 박탈 / 회복 지연",
                "다른 환자·병동에 미치는 영향: 지켜보는 환자들의 정서, 연쇄적 흥분사건, 긴장·경계심 강화",
                "치료자에게 미치는 영향: 신체·심리적 손상, 업무 스트레스 증가·만족도 저하(잦은 이직)"
            ]),
            .prompt(id: "st_c05_q1", label: "3차례의 강압치료가 B에게 미친 영향은 어떠했을까요? (신체·심리·치료와 회복) 여러분의 경험도 나눠보세요.", lines: 3),
            .prompt(id: "st_c05_q2", label: "강압치료 과정에서 경험한 여러분 자신의 트라우마가 있다면 이야기해보세요.", lines: 3)
        ])

    // 06
    private static let c06 = Chapter(
        id: "st_c06", number: "06", title: "환자와 치료에 대한 올바른 이해",
        systemImage: "eyeglasses",
        elements: [
            .bullets([
                "‘흥분환자 B’가 아니라 ‘B씨가 흥분했다’, ‘B씨가 망상적 사고를 한다’로 이해하기 — 사람과 상태를 분리",
                "치료의 목표: 증상·문제행동 소실 → 회복·성장으로",
                "병동운영: 관리·통제·집단 중심 → 개인·회복·자율 중심으로"
            ]),
            .checklist(id: "st_c06_check", title: "사례에서 치료진은 B를 어떻게 대했을까요? 평소 나의 태도에 가까운 쪽을 골라보세요.",
                       items: [
                        "‘저 행동에는 다 이유가 있겠지’ (회복지향)",
                        "‘환청과 망상을 보이고 있구만’ (증상중심)",
                        "‘스스로 진정할 수 있도록 옆에서 잘 도와줘야 해’ (자율지향)",
                        "‘수단 방법 가리지 않고 당장 흥분을 없애는 것이 중요해’ (통제중심)",
                        "‘자세히 들어보고 도와주자’ (경청지향)"
                       ]),
            .prompt(id: "st_c06_q1", label: "병동운영에 대한 두 태도(개인·회복·자율 vs 집단·관리·통제)가 상충할 때 선생님은 어떻게 하시나요?", lines: 3)
        ])

    // 07
    private static let c07 = Chapter(
        id: "st_c07", number: "07", title: "좋은 치료환경(분위기)을 위한 구체적인 노력",
        systemImage: "leaf",
        elements: [
            .bullets([
                "환대(Hospitality): 먼저 인사·자기소개, 이름 불러주기, 병동 안내, 편하게 요청하도록 분위기 만들기",
                "개별적인 서비스: 약물·간호행위·공간의 개별화",
                "트라우마 기반의 치료 / 함께 결정하기 / 선택권 주기(시간·순서·방법·시행자·장소·정도·시행 여부)"
            ]),
            .definition(term: "Yes & Can Culture — 요청에 긍정적으로 임하기",
                        body: "① 요청을 자세히 들었는가?(Listen) ② 너무 쉽게 ‘No’하지 않았는가?(Easy No) ③ ‘Yes’하기 위해 최선을 다하고 창조적 대안을 모색했는가?(Best & Creative) ④ ‘No’의 이유를 충분히 설명하고 그 마음을 헤아렸는가?(Why No & How feel)"),
            .prompt(id: "st_c07_q1", label: "입원 3일째 새벽 B의 전화 요청에 ‘Yes & Can’ 입장에서 반응한다면, 어떤 태도와 말이 좋을까요? 구체적으로 적어보세요.", lines: 3),
            .prompt(id: "st_c07_q2", label: "B의 입원·치료 과정 중 어떤 점들이 트라우마로 다가올까요? 구체적으로 적어봅시다.", lines: 3),
            .prompt(id: "st_c07_q3", label: "선생님이 실천하고 있는 ‘환대’와 ‘함께 결정하기’에는 어떤 것이 있나요? 잘 되지 않는 이유는 무엇인가요?", lines: 3)
        ])

    // 08
    private static let c08 = Chapter(
        id: "st_c08", number: "08", title: "어떻게 개입해야 하는가?",
        systemImage: "target",
        elements: [
            .subheading("1) 위험요인/자극요인을 파악하고 개입한다"),
            .bullets([
                "환자 내부 위험요인: 심리적 특징(트라우마·기질), 정신과적 증상(망상·환청·불안·불면), 신체 증상(통증·섬망·금단·부작용), 인지 문제",
                "환자 외부 자극요인: 환경 요인(주변 환자·물리적 환경·병동 분위기) / 치료·치료진 요인(경청하지 않는 태도, 어려운 용어, 요구의 좌절, 강압적 분위기, 강제입원, 일관적이지 못한 언행, 잦은 교체, 부족한 인력 등)"
            ]),
            .prompt(id: "st_c08_q1", label: "B의 흥분과 관련된 ‘치료 요인과 치료진 요인’으로는 어떤 것들이 있었을까요?", lines: 3),
            .subheading("2) 가급적 빨리 개입한다"),
            .bullets([
                "위험요인/자극요인 제거, 일반적 대처법",
                "comfort room(다양한 자극을 통한 진정)",
                "개별위기관리계획: 자극 요인 / 초기 신호 / 대처방법 / 작성 날짜와 서명(환자·치료자)"
            ]),
            .fieldRows(id: "st_c08_crisis", title: "입원 3일째 오후, B와 함께 개별위기관리계획을 세운다면?",
                       rows: ["자극 요인", "초기 신호", "대처 방법"]),
            .prompt(id: "st_c08_q2", label: "환자 혼자 스스로 진정할 수 있는 comfort room을 만든다면, 어떤 물건이나 장치를 두시겠습니까?", lines: 2)
        ])

    // 09
    private static let c09 = Chapter(
        id: "st_c09", number: "09", title: "흥분환자를 만나러 가기 전에 할 일",
        systemImage: "figure.walk.arrival",
        elements: [
            .bullets([
                "흥분환자의 분리 — 흥분 현장을 병동의 다른 환자들로부터 분리",
                "‘안정적 대화 공간’ 창조",
                "위험/자극요인 제거",
                "다수의 치료자(manpower, show of force)"
            ]),
            .prompt(id: "st_c09_q1", label: "입원 3일째 새벽 B가 흥분하기 시작할 때 ‘안정적 대화 공간’은 마련되었나요? 어떻게 마련하면 좋을까요?", lines: 3),
            .prompt(id: "st_c09_q2", label: "충분한 치료자가 없는 가운데 시행된 강압치료(보호사 N 혼자 시도)는 어떤 문제를 낳을까요?", lines: 2)
        ])

    // 10
    private static let c10 = Chapter(
        id: "st_c10", number: "10", title: "치료자가 곧 안정화치료",
        systemImage: "person.fill.checkmark",
        elements: [
            .paragraph("흥분환자를 진정시키는 유일하고 가장 좋은 치료제는 치료자 자신입니다. ‘진압군 모드’(오직 빠른 진정 → 방어적으로 물러나는 환자)가 아니라 ‘지원군 모드’(오직 이해 → 스스로 진정하며 다가서는 환자)로 다가갑니다."),
            .bullets([
                "긍정적인 치료적 관계 형성을 위해 끊임없이 노력하라",
                "성급하지 말라, 견뎌라 / 흥분환자를 존중하라(협박·하대 금지, 이유 인정)",
                "치료자 자신의 실수를 인정하라 (‘제가 실수했습니다’)",
                "개인 공간(personal space)을 존중하라",
                "치료자 자신을 진정시키라(De-escalate yourself) — 천천히 생각·말하기, 모든 말에 맞대응하지 않기, 치료 목표에 집중",
                "도망가지 말라, 자신감을 가지라"
            ]),
            .example(title: "치료자 자기 진정을 위한 혼잣말",
                     body: "‘지금 나는 흥분을 가라앉히는 치료적 작업을 하고 있어.’ ‘말싸움에서 이기려 집착하는 것은 좋지 않아.’ ‘이 과정은 원래 힘들어. 인내가 필요하지.’ ‘환자도 나와 같은 사람이야.’ ‘팀원들이 함께 하고 있어.’"),
            .prompt(id: "st_c10_q1", label: "흥분한 B를 만나는 나이트 치료자들은 ‘진압군 모드’였나요, ‘지원군 모드’였나요? 어떤 점에서 그렇게 생각하셨나요?", lines: 3),
            .prompt(id: "st_c10_q2", label: "선생님은 어떤 방법으로 감정을 조절하며 ‘건강한 치료자의 자리’를 지키려 하시나요?", lines: 3)
        ])

    // 11
    private static let c11 = Chapter(
        id: "st_c11", number: "11", title: "대화를 통해 진정시키는 것이 안정화치료의 꽃",
        systemImage: "bubble.left.and.bubble.right",
        elements: [
            .subheading("소통의 장으로 초대하기"),
            .paragraph("대화에 초대할 때 다음을 전달합니다 — 대화로 문제를 해결할 수 있다 / 치료자는 기꺼이 돕고 싶다 / 대화가 가장 효과적이고 때론 유일한 방법이다 / 대화의 주도권은 당신에게 있다."),
            .prompt(id: "st_c11_q1", label: "더욱 흥분한 B에게 간호사 N이 개입하러 나갑니다. 어떤 식으로 ‘대화의 장’으로 초대하면 좋을까요? 구체적인 멘트를 적어봅시다.", lines: 3),
            .subheading("경청 · 공감 · 타당화"),
            .definition(term: "공감(Empathy)과 타당화(Validation)",
                        body: "공감은 환자의 생각·감정·행동에 대한 이해와 그 표현이며, 타당화는 그 상황에서 그렇게 생각·행동할 수 있음에 대한 인정입니다. 공감은 전적인 동의(agree)가 아니라, 진실된 환자의 ‘일부’에 대한 인정입니다. 억울함·좌절감 등 감정과 자유·권리에 대한 주장 중 타당한 부분을 인정하고, 동의되지 않는 부분은 솔직하게 말합니다. 공감이 있을 때 직면은 빛이 납니다."),
            .fieldRows(id: "st_c11_empathy", title: "입원 2·3일째 B에게 어떤 공감의 멘트를 하면 좋을까요?",
                       rows: ["음식을 거절할 때", "약을 거절할 때", "전화를 요청할 때"]),
            .prompt(id: "st_c11_q2", label: "치료진이 B에게 충분한 공감을 보이지 못한 이면에는 어떤 ‘흥분환자 공감에 대한 오해’가 있었을까요?", lines: 3),
            .subheading("전략적으로 말하기"),
            .paragraph("단순하고 쉬운 대화, 반복하기, 때론 침묵하기, 전략적으로 말 배치하기(반사적으로 말하지 않기, 한 템포 쉬기, 환자의 진정에 도움이 되는지 생각하고 말하기)."),
            .prompt(id: "st_c11_q3", label: "선생님이 간호사 N이라면 어떤 대화 전략(경청·공감·전략적 배치·반복)을 세우시겠습니까? 어떤 멘트로 시작하시겠어요?", lines: 3)
        ])

    // 12
    private static let c12 = Chapter(
        id: "st_c12", number: "12", title: "마음은 몸으로 말한다 — 비언어적 소통",
        systemImage: "figure.stand",
        elements: [
            .paragraph("전체 정보의 50% 이상, 감정 정보의 대부분을 비언어적 의사소통이 담당합니다. 흥분상태의 환자는 언어적 소통이 원활치 못하고 비언어적 소통에 특히 민감합니다."),
            .definition(term: "3V / 2T / 1S",
                        body: "3V: verbal(언어 내용) · vocal(음성) · visual(시각) / 2T: time(시간) · touch(신체접촉) / 1S: space(공간). 조용하고 부드러운 말투, 편한 시선(지나친 응시 조심), 표정 관리, 절제된 자세, 신체접촉 제한, 2보 면담거리·동등한 시선높이·비스듬히 서기 등."),
            .prompt(id: "st_c12_q1", label: "입원 3일째 새벽, 간호사 N과 보호사 N의 비언어적 소통(음성·시선·표정·자세·시간·신체접촉·공간)을 평가해봅시다.", lines: 3),
            .prompt(id: "st_c12_q2", label: "B의 입장에서 치료진의 비언어적 신호는 어떻게 해석될까요? 구체적으로 어떤 부분이 어떻게 해석될까요?", lines: 3)
        ])

    // 13
    private static let c13 = Chapter(
        id: "st_c13", number: "13", title: "환자의 요구에 대해 함께 답을 찾아가야 한다",
        systemImage: "arrow.triangle.2.circlepath",
        elements: [
            .bullets([
                "환자의 요구를 대화 주제로 전환하기 — ‘된다/안된다’식 답변은 흥분을 악화시킴",
                "환자와 치료자의 목표가 같음을 인식시키기(공통의 목표 찾기) — 예: ‘빨리 퇴원할 수 있는 방법을 함께 이야기할까요?’",
                "환자의 건강한 자아와 협력하기 / 논쟁을 멈추고 정서적 요구에 집중하기",
                "희망 주기 — 부정적 메시지도 긍정적으로 전달, 실리도 자존심도 다 뺏지 않기",
                "‘틀렸다·잘못했다·당신 탓이다’ 등의 표현 삼가기, 열린 마음으로 대화 시작하기"
            ]),
            .prompt(id: "st_c13_q1", label: "전화를 요구하는 B에게 ‘요구를 대화 주제로 전환하기’를 시도한다면 어떤 멘트가 좋을까요?", lines: 2),
            .prompt(id: "st_c13_q2", label: "성추행에 대한 불편한 마음을 가진 B의 ‘정서적 요구’에 집중한다면 어떤 멘트가 좋을까요?", lines: 2),
            .prompt(id: "st_c13_q3", label: "퇴원을 요구하는 B에게 ‘희망 주기’를 한다면 어떤 멘트가 좋을까요?", lines: 2)
        ])

    // 14
    private static let c14 = Chapter(
        id: "st_c14", number: "14", title: "팀으로 움직여야 한다",
        systemImage: "person.3.sequence",
        elements: [
            .bullets([
                "위기반응팀은 적어도 4~6명으로 구성하고, 강압치료 기술과 팀웍이 좋아야 한다.",
                "각자 역할을 정한 후 진행 — 주치료자가 대화를 이끌고 다른 치료자는 강압치료를 대비",
                "환자와 관계가 형성된 치료자(주치의·수간호사)가 주치료자가 되는 것이 좋다.",
                "강압치료 시작은 반드시 주치료자가 분명히 알리며, 다른 치료자는 주치료자의 결정을 따른다.",
                "강압치료 시작 전까지 환자와의 소통은 주치료자에게 맡긴다."
            ]),
            .prompt(id: "st_c14_q1", label: "여러 치료자가 B에게 동시다발적으로 말을 겁니다. B 입장에서 이것은 어떻게 다가오고, 진정과정에 어떤 영향을 미칠까요?", lines: 3),
            .prompt(id: "st_c14_q2", label: "선생님이 경험한 좋았던 팀웍과 불편했던 팀웍의 구체적 경험을 말씀해보세요.", lines: 3)
        ])

    // 15
    private static let c15 = Chapter(
        id: "st_c15", number: "15", title: "흥분사건의 정리 — 디브리핑",
        systemImage: "checklist",
        elements: [
            .bullets([
                "디브리핑의 목적: 사건 평가·원인 개입, 재발방지 논의, 트라우마 치료적 접근, 치료적 관계 회복, 치료자 손상 평가·회복, 신체기술·팀웍 평가",
                "격리/강박 직후 치료자 간 디브리핑(위기반응팀+병동치료자)",
                "격리/강박 해제 시 환자–치료자 디브리핑: 신체 상태 평가, 진정 정도 파악, 추가 흥분 가능성, 정서적 지지",
                "격리 해제 후 환자–주치료자 디브리핑: 발생 과정 리뷰, 강압치료 과정 리뷰, 재발방지",
                "보고와 정기적인 리뷰"
            ]),
            .prompt(id: "st_c15_q1", label: "격리해제 후 주치의는 B와 어떤 이야기를 하면 좋을까요?", lines: 3),
            .prompt(id: "st_c15_q2", label: "새벽 흥분사건을 지켜보셨다면, 기술적 측면에서 어떤 디브리핑을 하시겠습니까?", lines: 3)
        ])

    // 16
    private static let c16 = Chapter(
        id: "st_c16", number: "16", title: "조직 내 안정화치료 위원회 구성",
        systemImage: "building.columns",
        elements: [
            .paragraph("안정화치료는 한 번의 깨달음으로 끝나지 않으며, 반복 훈련과 병원 리더십·병원 전체의 움직임이 있어야 정착됩니다."),
            .bullets([
                "안정화치료 위원회 구성",
                "치료자 대상 전체 교육(동기부여) 및 정기 교육(연 1~2회): 이론교육, 사례 토론, 호신술, 강압치료 팀기술",
                "위기반응팀 정기 신체기술 훈련, 위원 대상 심화 교육, 안정화체조 훈련"
            ]),
            .prompt(id: "st_c16_q1", label: "선생님이 소속된 병원에서 안정화치료 위원회를 구성한다면 어떤 사람들이 좋을까요?", lines: 2),
            .prompt(id: "st_c16_q2", label: "정기적인 치료자 전체교육을 계획해봅시다 (시기·장소·내용·진행자).", lines: 3)
        ])

    // 17 case
    private static let caseStudy = Chapter(
        id: "st_case", number: "가상사례", title: "토론을 위한 가상사례 — 당사자 B",
        systemImage: "person.text.rectangle",
        elements: [
            .caption("아래는 토론을 위한 가상사례입니다. 앞 장들의 질문은 이 사례를 배경으로 합니다. 필요하면 각 기관의 상황에 맞게 사례를 각색해 사용해도 됩니다."),
            .example(title: "당사자 B (25세 여성)",
                     body: "3년째 취업준비생으로 대부분의 시간을 독서실에서 혼자 보냄. 2달 전부터 잠을 못 자고 예민해졌고, 일주일 전부터 식사·외출을 하지 않고 혼잣말·간헐적 고함. 입원 당일 칼을 들고 방에 들어가 나오지 않아 가족이 경찰·119와 함께 강제로 입원시킴. 과거 초·중학교 시절 성폭행과 왕따 경험, 아버지와의 관계 곤란이 있었음."),
            .transcript(id: "st_case_t1", title: "입원 당일 오후 — 입원 직후 격리·주사", note: nil,
                        lines: [
                            TranscriptLine(speaker: ">>", text: "B가 보호사들에 의해 끌려오다시피 입원. 악을 지르고 발로 차며 몸부림친다."),
                            TranscriptLine(speaker: "보호사 1", text: "외래에서 난리를 쳤어요. 깨물고 발로 차고. 어디로 갈까요?"),
                            TranscriptLine(speaker: "간호사 E", text: "(‘한동안 고생하겠구나’) 주치의가 오더를 냈어요. 격리실로 갑시다. 주사 맞히게요."),
                            TranscriptLine(speaker: "B", text: "내가 왜 여기에 있어야 해? 무섭단 말이야. 꺼내달란 말이야. 집에 가고 싶어요."),
                            TranscriptLine(speaker: "간호사 E", text: "(단호하게) 시간이 되면 나오시게 할게요.")
                        ]),
            .transcript(id: "st_case_t2", title: "입원 2일째 — 식사·투약 거절", note: nil,
                        lines: [
                            TranscriptLine(speaker: "B", text: "이상한 냄새가 나잖아요. 밥 안 먹을 거예요. 당신 같으면 이런 밥을 먹겠어요?"),
                            TranscriptLine(speaker: "간호사 D", text: "정말 밥을 안 먹을 거예요? 한 숟가락이라도 먹으세요."),
                            TranscriptLine(speaker: "B", text: "제 핸드폰 어디 있나요? 이번 주 토요일에 친구들과 만나기로 했단 말이에요."),
                            TranscriptLine(speaker: "간호사 D", text: "병동에서 핸드폰 사용은 금지예요. 규칙은 규칙이니까 어쩔 수 없어요."),
                            TranscriptLine(speaker: "B", text: "(약을 거절하며) 저 안 미쳤어요. 혹시 이 약이 독약일 수도 있잖아요.")
                        ]),
            .transcript(id: "st_case_t3", title: "입원 3일째 새벽 — 흥분사건과 강압치료", note: "▷ 계속 저항하는 B에게 주사·강박·격리가 시행됨. 30분 후 잠이 듦. 입원 45일째 퇴원했으나, 1년도 지나지 않아 더욱 거칠어진 B가 재입원함.",
                        lines: [
                            TranscriptLine(speaker: "B", text: "지금 당장 부모님께 전화하게 해주세요. 여기 있으면 안 될 것 같아요."),
                            TranscriptLine(speaker: "보호사 N", text: "(사무적으로) 지금은 너무 늦어 전화를 걸 수 없습니다."),
                            TranscriptLine(speaker: "B", text: "왜 전화를 못하게 하는 거예요? 나에게는 목숨이 걸린 일이란 말이에요. 무섭단 말이에요."),
                            TranscriptLine(speaker: "간호사 N", text: "(빠르고 강경하게) 안 되는 것은 안 되는 거예요. 일단 진정하세요."),
                            TranscriptLine(speaker: "B", text: "(격리실로 끌려가며) 살려주세요. 살려주세요."),
                            TranscriptLine(speaker: ">>", text: "B는 홀로 남은 격리실에서 계속 소리치다 30분 후 잠이 든다.")
                        ]),
            .prompt(id: "st_case_q1", label: "이 사례에서 가장 결정적이었던 ‘개입의 분기점’은 어디였다고 생각하나요? 그 순간 무엇이 달랐다면 결과가 바뀌었을까요?", lines: 4)
        ])
}
