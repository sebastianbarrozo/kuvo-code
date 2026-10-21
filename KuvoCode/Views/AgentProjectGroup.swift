import SwiftUI

/// A visual section for the agents assigned to the same project. Projects themselves remain
/// groups of folders; this only gives their agents a clear home in the Bots sidebar.
struct AgentProjectGroup<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 6) {
                Image(systemName: "folder.fill")
                    .font(.system(size: 10, weight: .medium))
                Text(title)
                    .lineLimit(1)
            }
            .font(.system(size: 11, weight: .semibold))
            .foregroundStyle(.secondary)
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .padding(.bottom, 3)
            content
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Agents for \(title)")
    }
}

/// The visual level above projects. It is set on each project, so its folders and agents stay
/// organized together without introducing a second kind of project.
struct AgentScopeGroup<Content: View>: View {
    let title: String
    let isOpen: Bool
    let toggle: () -> Void
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: toggle) {
                HStack(spacing: 6) {
                    Image(systemName: isOpen ? "chevron.down" : "chevron.right")
                        .font(.system(size: 9, weight: .bold))
                        .frame(width: 10)
                    Image(systemName: "square.3.layers.3d.fill")
                        .font(.system(size: 11, weight: .semibold))
                    Text(title)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                }
                .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .clickablePointer()
            .font(.system(size: 12, weight: .bold))
            .foregroundStyle(.primary)
            .padding(.horizontal, 10)
            .padding(.top, 12)
            .padding(.bottom, 1)
            if isOpen { content }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Agent scope \(title)")
    }
}
