import Foundation

/// A training-inquiry contact for one of the five intervention tools.
struct TrainingContact: Identifiable {
    let id = UUID()
    let tool: String
    let institution: String
    let email: String
}

/// A crisis / support helpline shown on the 자원 tab.
struct Helpline: Identifiable {
    let id = UUID()
    let name: String
    let number: String       // dialable digits
    let display: String      // human-friendly form
    let note: String
}

enum Resources {
    /// 교육 문의처 — the five 인권중심 중재기술 tools and where to train in them.
    /// (도입 가이드라인 · 실행 기관 표)
    static let trainingContacts: [TrainingContact] = [
        TrainingContact(tool: "지역기반 네트워크 미팅 (오픈 다이얼로그)",
                        institution: "한국 오픈 다이얼로그 학회", email: "mindtrek@hanmail.net"),
        TrainingContact(tool: "병원기반 네트워크 미팅 (필요맞춤치료; DOTP)",
                        institution: "이음병원", email: "eumhospital@naver.com"),
        TrainingContact(tool: "퀄리티라이츠 리커버리 회복/퇴원계획",
                        institution: "아주대학교병원", email: "brainist.cho@gmail.com"),
        TrainingContact(tool: "고조완화기법 (안정화치료)",
                        institution: "천주의성요한병원", email: "nearlord1209@gmail.com"),
        TrainingContact(tool: "동료지원 지원의사결정",
                        institution: "사회적협동조합 우리다움 절차조력사업단", email: "hayosa@naver.com")
    ]

    /// Korean nationwide helplines (verified public numbers).
    static let helplines: [Helpline] = [
        Helpline(name: "자살예방 상담전화", number: "109", display: "109",
                 note: "24시간 자살·정신건강 위기 상담 (전화·문자)"),
        Helpline(name: "정신건강 위기 상담전화", number: "15770199", display: "1577-0199",
                 note: "정신건강 위기 상담 · 지역 정신건강복지센터 연결"),
        Helpline(name: "한국 생명의 전화", number: "15889191", display: "1588-9191",
                 note: "24시간 위기 상담"),
        Helpline(name: "보건복지상담센터", number: "129", display: "129",
                 note: "보건복지 위기 대응 상담"),
        Helpline(name: "국가인권위원회", number: "1331", display: "1331",
                 note: "인권 침해·차별 상담 및 진정"),
        Helpline(name: "긴급 신고 (경찰)", number: "112", display: "112",
                 note: "생명이 위급한 응급 상황"),
        Helpline(name: "응급 의료 (구급)", number: "119", display: "119",
                 note: "응급 처치가 필요한 신체 위급 상황")
    ]

    static let note =
    "이 훈련도구가 지향하는 서비스는 여러 서비스가 동시에 서로 연동하여 실천되고, 당사자·가족·전문가가 " +
    "여럿이 함께 익히고 협력할 때 제 기능을 합니다. 위 기관들은 각 도구의 교육을 문의할 수 있는 곳입니다."
}
