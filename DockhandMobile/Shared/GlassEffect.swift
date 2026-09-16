import SwiftUI

public struct GlassStyle: Sendable {
    public var tintColor: Color? = nil
    public var isInteractive: Bool = false
    
    public static var regular: GlassStyle { GlassStyle() }
    
    public func tint(_ color: Color) -> GlassStyle {
        var copy = self
        copy.tintColor = color
        return copy
    }
    
    public func interactive(_ enabled: Bool = true) -> GlassStyle {
        var copy = self
        copy.isInteractive = enabled
        return copy
    }
}

extension View {
    @ViewBuilder
    public func glassEffect(_ style: GlassStyle = .regular, in shape: some Shape = RoundedRectangle(cornerRadius: 24)) -> some View {
        self.background {
            shape
                .fill(.ultraThinMaterial)
                .overlay {
                    if let tint = style.tintColor {
                        shape.fill(tint)
                    }
                }
                .overlay {
                    shape.stroke(Color.white.opacity(0.12), lineWidth: 0.5)
                }
        }
    }
}

public struct GlassButtonStyle: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
            }
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

public struct GlassProminentButtonStyle: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(Color.accentColor.opacity(0.85), in: RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
            }
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension ButtonStyle where Self == GlassButtonStyle {
    public static var glass: GlassButtonStyle { GlassButtonStyle() }
}

extension ButtonStyle where Self == GlassProminentButtonStyle {
    public static var glassProminent: GlassProminentButtonStyle { GlassProminentButtonStyle() }
}
