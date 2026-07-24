import Foundation

/// 회복·퇴원계획수립 — 퀄리티라이츠 리커버리 프로그램 가이드북 (아주대 조용혁 외).
/// A 12-topic group program for 당사자·보호자·종사자 together, aimed at the
/// recovery of ‘자기감(나다움)’ beyond symptom remission. Transcribed from the
/// printed facilitator guidebook (핵심목표 · 핵심질문 · 핵심내용 per topic).
enum RecoveryContent {

    static let tool = Tool(
        id: "recovery",
        name: "퀄리티라이츠 리커버리",
        englishName: "회복·퇴원계획수립 프로그램",
        subtitle: "증상의 관해를 넘어 ‘나다움(자기감)’의 회복을 목표로, 당사자·보호자·종사자가 수평적으로 함께하는 12주제 그룹 프로그램.",
        systemImage: "sparkle.magnifyingglass",
        accent: Theme.recovery,
        leadAuthor: "조용혁",
        institution: "아주대학교 정신건강의학과 · 수원시성인정신건강복지센터",
        chapters: [c00, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12]
    )

    // Helper to build a standard topic chapter.
    private static func topic(_ id: String, _ number: String, _ title: String, _ image: String,
                              goal: String, questions: [String], content: [String],
                              promptLabel: String) -> Chapter {
        Chapter(id: id, number: number, title: title, systemImage: image, elements: [
            .definition(term: "핵심목표", body: goal),
            .subheading("핵심질문"),
            .bullets(questions),
            .subheading("핵심내용"),
            .bullets(content),
            .prompt(id: id + "_q", label: promptLabel, lines: 3)
        ])
    }

    private static let c00 = Chapter(
        id: "rc_c00", number: "소개", title: "프로그램의 구성과 철학",
        systemImage: "hand.wave",
        elements: [
            .paragraph("퀄리티라이츠 리커버리 프로그램은 총 12개의 주제(Topic)로 구성되며, 각 Topic은 1회기 단위입니다. 각 Topic은 도입–전개–정리의 세 단계로 진행되고, 시작 부분에 ‘핵심목표·핵심질문·핵심내용’이 정리되어 있습니다."),
            .subheading("핵심 철학"),
            .bullets([
                "‘증상의 관해’를 넘어 ‘나다움’의 회복, 즉 자기감(Sense of self) 회복을 목표로 합니다.",
                "참여자(당사자)·보호자·종사자가 수평적인 관계에서 서로를 이해하고 존중하는 것이 회복의 출발점입니다.",
                "정답을 배우는 것이 아니라, 각자의 목소리가 ‘하나의 의견’으로 경청되고 존중되도록 진행자가 촉진합니다."
            ]),
            .caption("진행 시: 참여자의 발언을 경청하고 교정하거나 정답을 유도하지 않습니다. 조장·서기·발표자 역할은 매 회기 새롭게 선출하며 자발성을 존중합니다.")
        ])

    private static let t1 = topic("rc_t1", "Topic 1", "회복이란 무엇인가?", "leaf",
        goal: "자신이 생각하는 회복을 이야기하고 다른 사람들의 의견을 들을 수 있다.",
        questions: ["회복이란? 서로의 생각을 공유한다.", "다차원적인 회복 개념과 회복의 핵심 요소는?", "회복에 대한 문화적 다양성과 오해들은?"],
        content: ["회복은 단순한 증상의 관해를 넘어서는, 다차원적이고 다양한 요소로 구성된 개념입니다.",
                  "본 프로그램에서는 정신질환에서의 회복을 ‘자기감(Sense of self)’의 회복 — 익숙한 표현으로 ‘나다움’의 회복 — 으로 이해합니다."],
        promptLabel: "나에게 ‘회복’이란 무엇인가요? 나다움을 느끼는 순간은 언제인가요?")

    private static let t2 = topic("rc_t2", "Topic 2", "회복 지향적 접근", "arrow.up.forward",
        goal: "내가 가진 장점을 1개 이상 다른 사람 앞에서 말할 수 있다.",
        questions: ["당사자를 바라보는 관점에 따라 치료의 지향점이 달라질까?", "자산/강점 기반 접근과 결손 기반 접근이란?", "회복을 촉진하거나 방해하는 요인은?", "스스로 자신을 정의한다면?"],
        content: ["결손 기반 접근과 자산/강점 기반 접근 모두 중요하지만, 익숙한 결손 기반에서 자산/강점 기반으로 시선을 옮기는 것이 중요합니다.",
                  "스스로를 자산/강점 기반으로 정의하는 것이 회복 지향적 접근의 시작입니다."],
        promptLabel: "다른 사람 앞에서 말할 수 있는 나의 장점을 하나 이상 적어보세요.")

    private static let t3 = topic("rc_t3", "Topic 3", "회복 지향 서비스와 희망의 증진", "sun.max",
        goal: "나에게 ‘희망이 있다’고 소리내 볼 수 있다.",
        questions: ["증상의 관해와 회복의 관계는?", "두 가지 정신건강서비스 모델의 특징과 차이점은?", "회복에서 희망의 중요성이란?"],
        content: ["증상의 관해만으로 회복을 단정지을 수 없습니다.",
                  "증상의 관해에만 초점을 맞추면 치료를 통해 오히려 희망을 잃을 위험이 있습니다.",
                  "회복 지향 정신건강 서비스는 희망을 증진시키는 서비스입니다."],
        promptLabel: "지금 나에게 있는 ‘희망’은 무엇인가요? 소리내어 말해보고 적어보세요.")

    private static let t4 = topic("rc_t4", "Topic 4", "회복의 여정에 함께 한다는 것", "figure.2",
        goal: "나의 회복의 여정에 어떤 사람이 함께 하고 있는지 적을 수 있다.",
        questions: ["‘함께’한다는 것은 무엇일까?", "함께 하는 것과 함께 한다고 오해하는 것은?", "회복의 여정에서 주인공·지지자·조력자의 역할은?"],
        content: ["치료 목표가 같고 당사자를 위하는 마음만으로는 회복의 여정에 ‘함께’ 한다고 말할 수 없습니다.",
                  "함께 하기 위해선 회복의 주인공·조력자·지지자의 역할을 이해하는 것이 중요합니다."],
        promptLabel: "나의 회복의 여정에 함께 하고 있는 사람은 누구인가요? 각자 어떤 역할인가요?")

    private static let t5 = topic("rc_t5", "Topic 5", "회복의 여정에서의 경계", "circle.dashed",
        goal: "회복의 여정에서 경계를 잘 지키고 있는지 스스로 답해볼 수 있다.",
        questions: ["회복의 여정에서 경계란? (과도 관여와 과소 관여)", "경계에 대해 생기는 오해는?"],
        content: ["회복은 함께 가는 여정이며, 그 여정을 함께하기 위해 서로의 온전함을 지켜주는 ‘경계’가 중요합니다.",
                  "경계에 문제가 생기면 건강한 관계 형성이 어려워지고 과도 관여나 과소 관여로 이어질 수 있습니다."],
        promptLabel: "나는 회복의 여정에서 경계를 잘 지키고 있나요? 과도 관여나 과소 관여의 경험이 있나요?")

    private static let t6 = topic("rc_t6", "Topic 6", "회복을 위한 긍정적 위험감수", "figure.climbing",
        goal: "어떠한 긍정적 위험감수를 할 지 한 가지 이상 말할 수 있다.",
        questions: ["위험감수는 피해야 할까요?", "긍정적 위험감수를 위해서 필요한 것은?"],
        content: ["긍정적 위험 감수는 특별한 사건이 아니라 우리 삶의 일상이며, ‘나다움’의 회복을 위해 필요합니다.",
                  "위험 감수를 단순히 ‘선택의 결과’로 오해해서는 안 되며, 회복의 주인공인 당사자에게 초점을 맞추어 가는 ‘과정 전체’를 의미합니다."],
        promptLabel: "내가 시도해보고 싶은 ‘긍정적 위험감수’ 한 가지는 무엇인가요?")

    private static let t7 = topic("rc_t7", "Topic 7", "공동체로의 재연결", "person.3",
        goal: "내가 원하는 공동체를 한 가지 이상 고민하여 말할 수 있다.",
        questions: ["공동체란? 당사자가 공동체와의 연결을 잃게 되는 원인은?", "자기감의 회복을 위해 왜 공동체로의 재연결이 필요한가?"],
        content: ["자기감의 회복을 위해 공동체로의 재연결은 필수적입니다.",
                  "다만 외부적·내부적 장애물과 과거 대인관계의 상처로 인해 매우 조심스럽게 접근해야 하는 주제입니다.",
                  "어떤 방식이 실제로 도움이 되는 재연결일지 당사자·지지자·종사자가 함께 고민합니다."],
        promptLabel: "내가 다시 연결되고 싶은 공동체는 무엇인가요? 무엇이 그 연결을 돕거나 방해하나요?")

    private static let t8 = topic("rc_t8", "Topic 8", "회복 의사소통 기술 (1)", "bubble.left.and.bubble.right",
        goal: "당사자 혹은 지지자가 회복의 과정에서 어떠한 고민이 있는지 한 개 이상 생각해 볼 수 있다.",
        questions: ["의사소통이란? 일상에서 마주하는 실질적인 어려움은?", "당사자·보호자·종사자 각각의 관점에서 서로의 마음은?", "‘대화(Dialogue)’란?"],
        content: ["효과적인 의사소통은 회복을 돕지만, 당사자·보호자·종사자 간의 회복을 위한 의사소통은 결코 쉽지 않습니다.",
                  "서로의 마음을 헤아리는 것, 그것이 진정한 ‘대화를 위한 대화’의 첫걸음입니다."],
        promptLabel: "회복의 과정에서 내가(혹은 나의 지지자가) 겪는 의사소통의 고민은 무엇인가요?")

    private static let t9 = topic("rc_t9", "Topic 9", "회복 의사소통 기술 (2)", "theatermasks",
        goal: "내 보호자가 회복의 과정에서 가장 듣고 싶은 말을 생각해보고 역할극으로 표현해 볼 수 있다.",
        questions: ["회복 의사소통 기술이란? 보호자가 겪는 심리적 고통은?", "보호자를 위한 회복 의사소통 방안에는 무엇이 있을까?"],
        content: ["보호자에게도 회복이 필요하며, 이를 위해 보호자의 마음을 깊이 헤아리는 의사소통이 중요합니다.",
                  "역할극 속 대화와 소감을 나누는 대화까지, 앞서 다룬 회복 의사소통 기술을 직접 경험해봅니다."],
        promptLabel: "나의 보호자(또는 내가 지지하는 당사자)가 가장 듣고 싶어 하는 말은 무엇일까요?")

    private static let t10 = topic("rc_t10", "Topic 10", "회복의 별", "star",
        goal: "지금 내 상태에 맞춘 회복의 별을 작성해 볼 수 있다.",
        questions: ["회복의 별이란?", "회복의 별을 구성하는 요소의 의미란?", "나의 회복의 별은?"],
        content: ["회복의 별(‘성과의 별’ 개념 차용)은 지금까지의 토론과 이야기를 실제 삶에 적용하는 도구입니다.",
                  "작성 방법을 익혀 추후에도 스스로 자신의 회복 여정을 기록해 나갈 수 있도록 하며, 현실적이고 개인 맞춤형 계획으로 구성하는 것이 중요합니다."],
        promptLabel: "지금 내 상태를 돌아볼 때, 잘 빛나고 있는 영역과 더 돌봐야 할 영역은 각각 무엇인가요?")

    private static let t11 = topic("rc_t11", "Topic 11", "회복 계획 (1)", "map",
        goal: "나의 목표와 실질적인 실천 전략을 담은 회복 계획을 작성해 볼 수 있다.",
        questions: ["회복계획이란? 당사자와 지지자가 함께 무엇을 작성하는가?"],
        content: ["회복 계획은 당사자 중심의 문서로, 현재 상태를 파악하고 나아갈 방향을 제시하는 삶의 이야기가 담긴 계획서입니다.",
                  "두 축은 1) 당사자의 꿈과 목표, 2) ‘건강한 나’를 유지하기 위한 실질적인 실천 전략이며, 당사자의 노력과 지지자의 역할을 함께 담습니다."],
        promptLabel: "나의 꿈과 목표는 무엇인가요? 그것을 향한 첫 번째 실천 전략을 하나 적어보세요.")

    private static let t12 = Chapter(
        id: "rc_t12", number: "Topic 12", title: "회복 계획 (2) · 나의 회복 선언",
        systemImage: "flag.checkered",
        elements: [
            .definition(term: "핵심목표", body: "나에게 있어 회복이 무엇인지 선언할 수 있다."),
            .subheading("핵심질문"),
            .bullets(["당신에게 회복이란? 자신에게 있어 회복이란 무엇인지 사람들과 이야기할 수 있습니다.",
                      "그동안 함께 이야기한 퀄리티라이츠 리커버리 프로그램의 내용을 정리합니다."]),
            .subheading("‘건강한 나’를 유지하기 위한 실천 전략"),
            .fieldRows(id: "rc_t12_plan", title: nil, rows: ["나의 경고신호", "혼자 할 수 있는 것", "도움을 청할 사람"]),
            .prompt(id: "rc_t12_declare", label: "나의 회복 선언 — 나에게 있어 회복이란 ____ 입니다.", lines: 4)
        ])
}
