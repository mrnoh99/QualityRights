import SwiftUI

/// Program info, the humanistic rationale, attribution, and a guarded reset.
struct AboutView: View {
    @EnvironmentObject private var store: ResponseStore
    @State private var showResetConfirm = false

    var body: some View {
        List {
            Section("퀄리티라이츠란") {
                Text("2012년부터 세계보건기구(WHO)는 정신건강 서비스를 사람중심·권리기반·회복지향적으로 바꾸기 위해 퀄리티라이츠(QualityRights)를 진행해 왔습니다. QR의 핵심 원칙은 질병 상황에서도 인간다움을 지키는 ‘개인의 자유에 대한 최소한의 개입’이며, 당사자·가족·치료진이 서로의 인간다움을 존중하며 적절하게 개입하여 당사자가 일상으로 돌아가도록 돕는 것입니다.")
                    .font(.subheadline)
            }

            Section("이 앱의 훈련도구") {
                ForEach(AppContent.tools) { tool in
                    HStack(spacing: 10) {
                        Image(systemName: tool.systemImage).foregroundStyle(tool.accent).frame(width: 24)
                        VStack(alignment: .leading, spacing: 1) {
                            Text(tool.name).font(.subheadline.weight(.medium))
                            Text("대표저자 \(tool.leadAuthor) · \(tool.institution)")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            Section("사용 안내") {
                Label("이 훈련도구는 여럿이 함께 익히고 협력하도록 만들어졌습니다.", systemImage: "person.2")
                    .font(.subheadline)
                Label("적은 내용은 이 기기에만 저장되고 외부로 전송되지 않습니다.", systemImage: "lock")
                    .font(.subheadline)
                Label("위기·인권 상담은 ‘자원’ 탭에서 바로 연결할 수 있습니다.", systemImage: "phone.bubble")
                    .font(.subheadline)
            }

            Section("원저작자 표시 (출처)") {
                LabeledContent("연구개발", value: Attribution.project)
                LabeledContent("주관·공동 연구기관", value: Attribution.leadInstitutions)
                LabeledContent("연구책임", value: Attribution.researchLeads)
                LabeledContent("발행처", value: Attribution.publisher)
                LabeledContent("발행", value: Attribution.published)
                LabeledContent("연구지원", value: Attribution.grant)
                Link("오픈 다이얼로그 코리아 블로그", destination: URL(string: Attribution.homepage)!)
                    .font(.subheadline)
            }

            Section {
                Text(Attribution.notice)
                    .font(.footnote).foregroundStyle(.secondary)
                Text(Attribution.grantEnglish)
                    .font(.caption).foregroundStyle(.secondary)
            } header: {
                Text("저작권·연구지원 안내")
            }

            Section {
                Button(role: .destructive) {
                    showResetConfirm = true
                } label: {
                    Label("입력한 내용 전체 초기화", systemImage: "trash")
                }
            } footer: {
                Text("모든 토론·성찰 답변이 삭제되며 되돌릴 수 없습니다.")
            }
        }
        .navigationTitle("정보")
        .confirmationDialog("정말 모든 내용을 지울까요?",
                            isPresented: $showResetConfirm, titleVisibility: .visible) {
            Button("전체 초기화", role: .destructive) { store.resetAll() }
            Button("취소", role: .cancel) {}
        }
    }
}
