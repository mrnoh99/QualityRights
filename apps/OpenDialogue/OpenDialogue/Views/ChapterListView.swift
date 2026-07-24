import SwiftUI

/// Lists the chapters inside a tool, then pushes into the renderer.
struct ChapterListView: View {
    let tool: Tool
    @EnvironmentObject private var store: ResponseStore

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 6) {
                    if let eng = tool.englishName {
                        Text(eng).font(.footnote.italic()).foregroundStyle(tool.accent)
                    }
                    Text(tool.subtitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Section {
                ForEach(tool.chapters) { chapter in
                    NavigationLink {
                        ChapterView(tool: tool, chapter: chapter)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: chapter.systemImage)
                                .foregroundStyle(tool.accent)
                                .frame(width: 26)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(chapter.number)
                                    .font(.caption.monospaced().bold())
                                    .foregroundStyle(tool.accent)
                                Text(chapter.title).font(.subheadline)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer()
                            if chapter.elements.contains(where: { $0.isInteractive && store.hasEntry(for: $0.id) }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(tool.accent)
                            }
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
        }
        .navigationTitle(tool.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
