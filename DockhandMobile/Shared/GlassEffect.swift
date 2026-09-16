import SwiftUI

public struct GlassStyle: Sendable {
    public var tintColor: Color? = nil
    
    public static var regular: GlassStyle { GlassStyle() }
    
    public func tint(_ color: Color) -> GlassStyle {
        var copy = self
        copy.tintColor = color
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
                    shape.strokeBorder(Color.white.opacity(0.12), lineWidth: 0.5)
                }
        }
    }
}
