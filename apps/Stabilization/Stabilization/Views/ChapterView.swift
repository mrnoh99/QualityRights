import SwiftUI

/// Generic renderer that turns a `Chapter`'s elements into a readable,
/// partly interactive page.
struct ChapterView: View {
    let tool: Tool
    let chapter: Chapter

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                ForEach(Array(chapter.elements.enumerated()), id: \.offset) { _, element in
                    ElementView(element: element, tint: tool.accent)
                }
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(chapter.number)
        .navigationBarTitleDisplayMode(.inline)
        .scrollDismissesKeyboard(.interactively)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(tool.name)
                .font(.caption).foregroundStyle(tool.accent)
            Text(chapter.title)
                .font(.title2.bold())
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

/// Renders a single content element. Split out so the switch stays readable.
private struct ElementView: View {
    let element: ContentElement
    let tint: Color

    var body: some View {
        switch element {
        case .heading(let text):
            Text(text)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)

        case .subheading(let text):
            Text(text)
                .font(.subheadline.bold())
                .foregroundStyle(tint)
                .fixedSize(horizontal: false, vertical: true)

        case .paragraph(let text):
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

        case .caption(let text):
            Text(text)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)

        case .bullets(let items):
            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    HStack(alignment: .top, spacing: 8) {
                        Text("·").font(.subheadline.bold()).foregroundStyle(tint)
                        Text(item)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

        case .numbered(let items):
            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\(index + 1).")
                            .font(.subheadline.bold().monospacedDigit())
                            .foregroundStyle(tint)
                            .frame(minWidth: 22, alignment: .leading)
                        Text(item)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

        case .definition(let term, let body):
            VStack(alignment: .leading, spacing: 6) {
                Label(term, systemImage: "book.closed")
                    .font(.subheadline.bold())
                    .foregroundStyle(tint)
                Text(body)
                    .font(.footnote)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(tint.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

        case .example(let title, let body):
            VStack(alignment: .leading, spacing: 6) {
                Label(title, systemImage: "doc.text")
                    .font(.subheadline.bold())
                    .foregroundStyle(.orange)
                Text(body)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Theme.exampleBackground.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

        case .transcript(_, let title, let note, let lines):
            TranscriptView(title: title, note: note, lines: lines, tint: tint)

        case .prompt(let id, let label, let lines):
            PromptField(id: id, label: label, lines: lines, tint: tint)

        case .checklist(let id, let title, let items):
            ChecklistView(id: id, title: title, items: items, tint: tint)

        case .scale(let id, let label, let low, let high, let range):
            ScaleView(id: id, label: label, low: low, high: high, range: range, tint: tint)

        case .fieldRows(let id, let title, let rows):
            FieldRowsView(id: id, title: title, rows: rows, tint: tint)
        }
    }
}
