import SwiftUI

// MARK: - Free-text prompt (discussion / reflection question)

struct PromptField: View {
    let id: String
    let label: String
    let lines: Int
    let tint: Color
    @EnvironmentObject private var store: ResponseStore

    private var binding: Binding<String> {
        Binding(get: { store.text(for: id) },
                set: { store.setText($0, for: id) })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline.weight(.medium))
                .fixedSize(horizontal: false, vertical: true)
            TextField("여기에 적어보세요", text: binding, axis: .vertical)
                .lineLimit(lines...max(lines, lines + 4))
                .frame(minHeight: CGFloat(lines) * 26 + 10, alignment: .topLeading)
                .padding(10)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(tint.opacity(0.25), lineWidth: 1)
                )
        }
    }
}

// MARK: - Checklist (multi-select)

struct ChecklistView: View {
    let id: String
    let title: String?
    let items: [String]
    let tint: Color
    @EnvironmentObject private var store: ResponseStore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title { Text(title).font(.subheadline.bold()).foregroundStyle(tint) }
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                Button {
                    store.toggleCheck(id, index: index)
                } label: {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: store.isChecked(id, index: index)
                              ? "checkmark.square.fill" : "square")
                            .foregroundStyle(store.isChecked(id, index: index) ? tint : .secondary)
                        Text(item)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer(minLength: 0)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .qrCard()
    }
}

// MARK: - Rating scale

struct ScaleView: View {
    let id: String
    let label: String
    let low: String
    let high: String
    let range: ClosedRange<Double>
    let tint: Color
    @EnvironmentObject private var store: ResponseStore

    private var binding: Binding<Double> {
        Binding(get: { store.scale(for: id, default: range.lowerBound) },
                set: { store.setScale($0, for: id) })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(label).font(.subheadline.weight(.medium))
                Spacer()
                Text("\(Int(binding.wrappedValue))")
                    .font(.title3.bold().monospacedDigit())
                    .foregroundStyle(tint)
            }
            Slider(value: binding, in: range, step: 1).tint(tint)
            HStack { Text(low); Spacer(); Text(high) }
                .font(.caption2).foregroundStyle(.secondary)
        }
        .qrCard()
    }
}

// MARK: - Labeled field rows (①②③ …)

struct FieldRowsView: View {
    let id: String
    let title: String?
    let rows: [String]
    let tint: Color
    @EnvironmentObject private var store: ResponseStore

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title { Text(title).font(.subheadline.bold()).foregroundStyle(tint) }
            ForEach(Array(rows.enumerated()), id: \.offset) { index, label in
                HStack(alignment: .top, spacing: 10) {
                    Text(label)
                        .font(.subheadline.bold())
                        .foregroundStyle(tint)
                        .frame(minWidth: 24, alignment: .leading)
                        .padding(.top, 8)
                    TextField("", text: Binding(
                        get: { store.text(for: "\(id).\(index)") },
                        set: { store.setText($0, for: "\(id).\(index)") }),
                              axis: .vertical)
                        .padding(8)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
        }
        .qrCard()
    }
}

// MARK: - Read-only transcript (예시 대화 / 가상사례)

struct TranscriptView: View {
    let title: String?
    let note: String?
    let lines: [TranscriptLine]
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Label(title, systemImage: "text.bubble")
                    .font(.subheadline.bold())
                    .foregroundStyle(tint)
            }
            ForEach(lines) { line in
                if line.isNarration {
                    Text(line.text)
                        .font(.footnote.italic())
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 1)
                } else {
                    HStack(alignment: .top, spacing: 8) {
                        Text(line.speaker)
                            .font(.caption.bold())
                            .foregroundStyle(tint)
                            .frame(width: 58, alignment: .leading)
                        Text(line.text)
                            .font(.footnote)
                            .foregroundStyle(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            if let note {
                Text(note)
                    .font(.caption)
                    .foregroundStyle(tint)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 2)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(tint.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(tint.opacity(0.15), lineWidth: 1)
        )
    }
}

// MARK: - Manual figure (도판)

/// A diagram cropped from the original printed manual, shown on a white panel
/// (the images carry a baked-in white background) with a caption.
struct FigureCard: View {
    let figure: FigureRef
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("원본 매뉴얼 도판")
                .font(.caption2.weight(.semibold))
                .tracking(0.5)
                .foregroundStyle(.secondary)
            Image(figure.name)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.separator), lineWidth: 1)
                )
            Text(figure.caption)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .qrCard()
    }
}
