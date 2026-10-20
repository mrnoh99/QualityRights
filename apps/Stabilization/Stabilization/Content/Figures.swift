import Foundation

/// A manual figure shown inside a chapter. The PNG lives in each app's asset
/// catalog under `name` (added by tools/scaffold.sh for the app's own tool).
struct FigureRef {
    let name: String
    let caption: String
}

/// Figures cropped from the original printed manuals, keyed by chapter id —
/// the iOS counterpart of the web app's figures.js. Each app only bundles the
/// images for its own tool, so only those chapter ids resolve to a real image.
enum AppFigures {
    static let byChapter: [String: [FigureRef]] = [
        "od_c01": [FigureRef(name: "od-network",
            caption: "좁은 의미의 오픈 다이얼로그 — 염려의 중심에 놓인 당사자를 중심으로 가족·네트워크와 치료팀(의사·간호사·사회복지사·동료지원가)이 함께 모여 나누는 대화. (원본 매뉴얼 20쪽)")],
        "od_c03": [FigureRef(name: "od-interventions",
            caption: "Table 1. 국제 지침이 권고하는 근거기반 정신사회적 중재 — 여러 국가의 가이드라인에서 ‘가족 중재’가 가장 강력한 근거(+++)로 최우선 권장됨. (원본 매뉴얼 28쪽)")],
        "dotp_c03": [FigureRef(name: "dotp-flow",
            caption: "DOTP 진행 체계도 — 입원 병동(치료공동체)에서 당사자·가족·다학제 치료팀이 NAT 기반 치료계획 미팅에 함께 초대되고, 지역사회 서비스·동료지원과 연동됩니다. 오른쪽은 서비스 의뢰 과정. (원본 매뉴얼 28쪽)")],
        "st_c01": [FigureRef(name: "stab-escalation",
            caption: "흥분은 점진적으로 진행한다 — 긴장(Tension)에서 상승(Escalation), 정점(Peak)을 지나 하강(De-escalation)과 위기 후 소진으로 이어지는 진정 곡선. (원본 매뉴얼 22쪽)")],
        "st_c03": [FigureRef(name: "stab-stages",
            caption: "개입 시점에 따른 진정과정 — 흥분 前 단계, 흥분 단계, 흥분 後 단계로 나누어 개입합니다. (원본 매뉴얼 26쪽)")],
        "rc_t10": [FigureRef(name: "recovery-star",
            caption: "회복의 별 — 자기주도적 치료 참여, 일상생활 기술, 직업과 자립, 건강과 행복, 삶의 의미와 목적, 공동체로의 연결 등 8가지 영역의 중요도를 스스로 표시하는 작성 예시. (원본 매뉴얼 152쪽)")],
        "sd_c03": [FigureRef(name: "sdm-transition",
            caption: "대체의사결정에서 지원의사결정으로의 전환 — 왼쪽(기존 상황)의 전제를 오른쪽(변화 방향)으로 바꾸는 것이 핵심이며, ‘최대 이익’에서 당사자의 ‘의지와 선호’ 기준으로 이동합니다. (원본 매뉴얼 38쪽)")]
    ]
}
