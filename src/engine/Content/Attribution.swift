import Foundation

/// Original-work attribution. This app is a derivative digital edition of the
/// printed 인권중심 중재기술 훈련도구 manuals and is used on condition that the
/// original authors and funders are credited, so these facts are surfaced on
/// the home screen and the 정보 tab.
enum Attribution {
    static let project = "세계보건기구 퀄리티라이츠에 기반한 치료친화적 환경조성을 위한 인권중심 중재기술개발"
    static let leadInstitutions = "아주대학교병원 · 이음병원"
    static let researchLeads = "노재성(아주대학교) · 정성권(이음병원) · 김성수(연구 코디네이터, 다원정신건강의학과)"
    static let publisher = "한국보건산업진흥원 · 아주대학교병원 · 이음병원"
    static let published = "2025년 3월 28일"
    static let grant = "보건복지부 보건의료기술 연구개발사업 (과제고유번호 RS-2022-KH126432)"
    static let grantEnglish =
    "This research was supported by a grant of the Korea Health Technology R&D Project " +
    "through the Korea Health Industry Development Institute (KHIDI), funded by the " +
    "Ministry of Health & Welfare, Republic of Korea (grant number: RS-2022-KH126432)."
    static let homepage = "https://blog.naver.com/opendialoguekorea"
    static let contactMail = "mindtrek@hanmail.net"

    /// One-line credit shown persistently (home screen footer).
    static let shortCredit =
    "원저작 · 아주대학교병원 / 이음병원 · 발행 · 한국보건산업진흥원 (2025)"

    /// Full notice shown on the 정보 tab.
    static let notice =
    "이 앱은 위 원저작물(인쇄 매뉴얼)의 내용을 학습 편의를 위해 디지털로 옮긴 2차적 저작물이며, " +
    "원저작자 표시를 조건으로 사용됩니다. 모든 콘텐츠의 저작권은 원저작자에게 있습니다. " +
    "본 앱은 임상·교육의 보조 도구이며, 전문적 훈련·수퍼비전을 대체하지 않습니다."
}
