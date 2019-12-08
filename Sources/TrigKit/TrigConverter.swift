import Foundation
import QuartzCore

public class TrigConverter {
    /**
     * - Fixme: ⚠️️ Needs doc
     */
    public static func cartesianToPolar(_ point: CGPoint) -> (radius: CGFloat, angle: CGFloat) {
        // Fixme: ⚠️️ do some math here to get radius and angle
        let radius = CGFloat(0.0)
        let angle = CGFloat(0.0)
        return (radius, angle)
    }
    /**
     * Converts an angle in degrees to radians.
     * - NOTE: its easier to just do: 45*㎭
     * - NOTE: can also be defined: rad * (180 / π)
     */
    public static func degrees(_ radians: CGFloat) -> CGFloat {
        return π * radians / 180.0
    }
    /**
     * Converts an angle in radians to degrees.
     * - NOTE: can also be defined degrees * (π / 180)
     */
    public static func radians(_ degrees: CGFloat) -> CGFloat {
        return degrees / 180.0 * π
    }
}
