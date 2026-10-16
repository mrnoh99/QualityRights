import SwiftUI

@main
struct DOTPApp: App {
    @StateObject private var store = ResponseStore.shared

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
                .tint(Theme.accent)
        }
    }
}
