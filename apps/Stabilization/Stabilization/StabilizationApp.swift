import SwiftUI

@main
struct StabilizationApp: App {
    @StateObject private var store = ResponseStore.shared

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
                .tint(Theme.accent)
        }
    }
}
