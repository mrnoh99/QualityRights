import SwiftUI

/// Training-inquiry contacts and always-available helplines.
struct ResourcesView: View {
    var body: some View {
        List {
            Section {
                Text(Resources.note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            } header: {
                Label("함께 익히고, 서로 연동한다", systemImage: "person.3")
            }

            Section("교육 문의처 (인권중심 중재기술 5종)") {
                ForEach(Resources.trainingContacts) { c in
                    VStack(alignment: .leading, spacing: 3) {
                        Text(c.tool).font(.subheadline.weight(.medium))
                        Text(c.institution).font(.caption).foregroundStyle(.secondary)
                        Link(c.email, destination: URL(string: "mailto:\(c.email)")!)
                            .font(.caption.monospaced())
                    }
                    .padding(.vertical, 2)
                }
            }

            Section("위기·인권 상담 전화") {
                ForEach(Resources.helplines) { line in
                    HelplineRow(line: line)
                }
            }

            Section {
                Text("생명이 위급한 상황이라면 즉시 112(경찰) 또는 119(구급)로 연락하세요.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("자원")
    }
}

private struct HelplineRow: View {
    let line: Helpline

    var body: some View {
        Button {
            if let url = URL(string: "tel://\(line.number)"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(Theme.helpline.opacity(0.15))
                    Image(systemName: "phone.fill").foregroundStyle(Theme.helpline)
                }
                .frame(width: 40, height: 40)

                VStack(alignment: .leading, spacing: 2) {
                    Text(line.name).font(.headline).foregroundStyle(.primary)
                    Text(line.note).font(.caption).foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                Text(line.display)
                    .font(.subheadline.bold().monospacedDigit())
                    .foregroundStyle(Theme.helpline)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
    }
}
