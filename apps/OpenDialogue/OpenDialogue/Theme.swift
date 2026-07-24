import SwiftUI

/// Shared visual language for the app. Kept calm and warm — this content is
/// about human dignity in emotionally heavy clinical situations, so the
/// palette avoids alarming reds except for the dedicated helpline card.
///
/// Each training tool carries its own accent (defined in `Content`), so a
/// reader can tell at a glance which manual they are inside.
enum Theme {
    static let accent = Color(red: 0.24, green: 0.45, blue: 0.62)        // WHO-ish teal-blue
    static let cardBackground = Color(.secondarySystemBackground)
    static let exampleBackground = Color(red: 0.98, green: 0.95, blue: 0.86)
    static let helpline = Color(red: 0.82, green: 0.33, blue: 0.30)

    // Per-tool accents, referenced from the content definitions.
    static let guideline = Color(red: 0.30, green: 0.42, blue: 0.55)     // slate
    static let dotp = Color(red: 0.24, green: 0.52, blue: 0.58)          // teal
    static let stabilization = Color(red: 0.78, green: 0.52, blue: 0.24) // amber
    static let recovery = Color(red: 0.30, green: 0.56, blue: 0.42)      // green
    static let supportedDecision = Color(red: 0.42, green: 0.40, blue: 0.66) // violet
}

extension View {
    /// Card container used throughout the chapter renderer.
    func qrCard() -> some View {
        self
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Theme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}
