import Foundation
import Combine

/// Central store for every answer the reader types into a discussion question,
/// checklist, or rating.
///
/// All entries are keyed by the stable element ids defined in the content and
/// persisted as a single JSON blob in `UserDefaults`, so a participant can
/// close the app and return to a fully restored set of notes. Nothing ever
/// leaves the device.
final class ResponseStore: ObservableObject {
    static let shared = ResponseStore()

    @Published private(set) var text: [String: String]
    @Published private(set) var checks: [String: Set<Int>]
    @Published private(set) var scales: [String: Double]

    private let defaultsKey = "qr.responses.v1"
    private var saveCancellable: AnyCancellable?

    private struct Snapshot: Codable {
        var text: [String: String]
        var checks: [String: [Int]]
        var scales: [String: Double]
    }

    private init() {
        if let data = UserDefaults.standard.data(forKey: defaultsKey),
           let snap = try? JSONDecoder().decode(Snapshot.self, from: data) {
            text = snap.text
            checks = snap.checks.mapValues { Set($0) }
            scales = snap.scales
        } else {
            text = [:]; checks = [:]; scales = [:]
        }

        // Debounced autosave whenever any published value changes.
        saveCancellable = objectWillChange
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .sink { [weak self] in self?.persist() }
    }

    // MARK: - Text

    func text(for id: String) -> String { text[id] ?? "" }

    func setText(_ value: String, for id: String) {
        if value.isEmpty { text.removeValue(forKey: id) } else { text[id] = value }
    }

    // MARK: - Checklists

    func isChecked(_ id: String, index: Int) -> Bool {
        checks[id]?.contains(index) ?? false
    }

    func toggleCheck(_ id: String, index: Int) {
        var set = checks[id] ?? []
        if set.contains(index) { set.remove(index) } else { set.insert(index) }
        if set.isEmpty { checks.removeValue(forKey: id) } else { checks[id] = set }
    }

    // MARK: - Scale

    func scale(for id: String, default def: Double) -> Double {
        scales[id] ?? def
    }

    func setScale(_ value: Double, for id: String) { scales[id] = value }

    // MARK: - Persistence & progress

    private func persist() {
        let snap = Snapshot(
            text: text,
            checks: checks.mapValues { Array($0).sorted() },
            scales: scales
        )
        if let data = try? JSONEncoder().encode(snap) {
            UserDefaults.standard.set(data, forKey: defaultsKey)
        }
    }

    /// True if the reader has entered anything for the given element id.
    func hasEntry(for id: String) -> Bool {
        !(text[id]?.isEmpty ?? true) || checks[id] != nil || scales[id] != nil
    }

    /// Reset every answer (used by the "전체 초기화" action).
    func resetAll() {
        text = [:]; checks = [:]; scales = [:]
        UserDefaults.standard.removeObject(forKey: defaultsKey)
    }
}
