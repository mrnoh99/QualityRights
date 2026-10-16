import SwiftUI

@main
struct SupportedDecisionApp: App {
    @StateObject private var store = ResponseStore.shared

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
                .tint(Theme.accent)
        }
    }
}
