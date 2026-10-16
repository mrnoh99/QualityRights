import SwiftUI

/// Top-level tabs: the training tools, a resources/helpline tab, and 정보.
struct RootTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ToolListView()
            }
            .tabItem { Label("훈련도구", systemImage: "square.stack.3d.up") }

            NavigationStack {
                ResourcesView()
            }
            .tabItem { Label("자원", systemImage: "phone.bubble") }

            NavigationStack {
                AboutView()
            }
            .tabItem { Label("정보", systemImage: "info.circle") }
        }
    }
}

/// Home screen: the intervention tools (도입 가이드라인 + 3 manuals).
struct ToolListView: View {
    @EnvironmentObject private var store: ResponseStore

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 6) {
                    Text("세계보건기구 퀄리티라이츠에 기반한")
                        .font(.subheadline).foregroundStyle(.secondary)
                    Text("치료친화적 환경조성을 위한\n인권중심 중재기술")
                        .font(.title2.bold())
                        .fixedSize(horizontal: false, vertical: true)
                    Text("정신건강 서비스를 사람중심·권리기반·회복지향으로 바꾸기 위한 훈련도구입니다. 각 장의 토론·성찰 질문에 적은 내용은 이 기기에만 저장됩니다.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            } footer: {
                Text(Attribution.shortCredit)
            }

            Section("훈련도구") {
                ForEach(AppContent.tools) { tool in
                    NavigationLink(value: tool.id) {
                        ToolRow(tool: tool)
                    }
                }
            }
        }
        .navigationTitle("인권중심 중재기술")
        .navigationDestination(for: String.self) { id in
            if let tool = AppContent.tools.first(where: { $0.id == id }) {
                ChapterListView(tool: tool)
            }
        }
    }
}

private struct ToolRow: View {
    let tool: Tool
    @EnvironmentObject private var store: ResponseStore

    private var progress: (done: Int, total: Int) {
        var total = 0, done = 0
        for chapter in tool.chapters {
            let interactive = chapter.elements.filter { $0.isInteractive }
            guard !interactive.isEmpty else { continue }
            total += 1
            if interactive.contains(where: { store.hasEntry(for: $0.id) }) { done += 1 }
        }
        return (done, total)
    }

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle().fill(tool.accent.opacity(0.15))
                Image(systemName: tool.systemImage)
                    .foregroundStyle(tool.accent)
                    .font(.title3)
            }
            .frame(width: 46, height: 46)

            VStack(alignment: .leading, spacing: 3) {
                Text(tool.name).font(.headline)
                Text(tool.subtitle)
                    .font(.caption).foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            Spacer()
            let p = progress
            if p.total > 0 {
                Text("\(p.done)/\(p.total)")
                    .font(.caption.monospacedDigit())
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
