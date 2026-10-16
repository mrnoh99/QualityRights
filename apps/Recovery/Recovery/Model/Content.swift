import SwiftUI

/// A single line of a verbatim dialogue transcript (예시 / 가상사례).
/// These are read-only excerpts from the printed manuals, shown so the
/// reader can study how a real dialogic exchange unfolds.
struct TranscriptLine: Identifiable {
    let id = UUID()
    let speaker: String   // e.g. "치료진", "당사자", "어머니", ">>" for narration
    let text: String

    /// A stage-direction / narration line (rendered in a quieter style).
    var isNarration: Bool { speaker == ">>" || speaker.isEmpty }
}

/// One interactive or informational element on a chapter page.
///
/// The three source manuals mix教育 content (headings, paragraphs, lists,
/// worked examples) with group-discussion questions. Elements that capture
/// the reader's own answer carry a stable `id` used as the persistence key
/// in `ResponseStore`; purely informational elements do not.
enum ContentElement: Identifiable {
    /// Section heading rendered in a bold, larger font.
    case heading(String)
    /// A smaller sub-heading (가. 나. 다. style sub-sections).
    case subheading(String)
    /// Explanatory body text.
    case paragraph(String)
    /// A small caption / hint under a heading or field.
    case caption(String)
    /// A bulleted list (·).
    case bullets([String])
    /// A numbered list (①②③ …).
    case numbered([String])
    /// A key term with its definition, shown in a tinted card.
    case definition(term: String, body: String)
    /// A worked example / case shown in a tinted card (예시 / 사례).
    case example(title: String, body: String)
    /// A read-only verbatim dialogue transcript (예시 대화 / 가상사례).
    case transcript(id: String, title: String?, note: String?, lines: [TranscriptLine])
    /// A free-text answer field for a discussion / reflection question.
    /// `lines` controls the minimum height.
    case prompt(id: String, label: String, lines: Int)
    /// A multi-select checklist. Selection is stored as a set of indices.
    case checklist(id: String, title: String?, items: [String])
    /// A 1–10 or 0–100 rating rendered as a slider.
    case scale(id: String, label: String, low: String, high: String, range: ClosedRange<Double>)
    /// A labeled table where each row is its own free-text field.
    case fieldRows(id: String, title: String?, rows: [String])

    var id: String {
        switch self {
        case .heading(let s): return "h:" + s
        case .subheading(let s): return "sh:" + s
        case .paragraph(let s): return "p:" + String(s.prefix(24))
        case .caption(let s): return "c:" + String(s.prefix(24))
        case .bullets(let items): return "b:" + String((items.first ?? "").prefix(20))
        case .numbered(let items): return "n:" + String((items.first ?? "").prefix(20))
        case .definition(let t, _): return "def:" + t
        case .example(let t, _): return "ex:" + t
        case .transcript(let id, _, _, _): return id
        case .prompt(let id, _, _): return id
        case .checklist(let id, _, _): return id
        case .scale(let id, _, _, _, _): return id
        case .fieldRows(let id, _, _): return id
        }
    }

    /// Whether this element records an answer that counts toward progress.
    var isInteractive: Bool {
        switch self {
        case .prompt, .checklist, .scale, .fieldRows: return true
        default: return false
        }
    }
}

/// A chapter of a training manual (the "01", "02" … 장 in the printed PDF).
struct Chapter: Identifiable {
    let id: String
    let number: String        // e.g. "01" or "부록"
    let title: String
    let systemImage: String
    let elements: [ContentElement]
}

/// One of the human-rights intervention training tools. Each tool corresponds
/// to one printed manual in the 인권중심 중재기술 5종 series.
struct Tool: Identifiable {
    let id: String
    let name: String          // 흥분환자 안정화치료 …
    let englishName: String?  // Dialogue of Treatment Plan …
    let subtitle: String
    let systemImage: String
    let accent: Color
    let leadAuthor: String
    let institution: String
    let chapters: [Chapter]
}
