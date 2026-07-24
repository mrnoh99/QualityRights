import SwiftUI

@main
struct OpenDialogueApp: App {
    @StateObject private var store = ResponseStore.shared

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
                .tint(Theme.accent)
        }
    }
}
