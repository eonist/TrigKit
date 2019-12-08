import Foundation
import QuartzCore

public class TrigUtils {
    /**
     * Returns an angle in Degrees
     * - Param: angleType A string describing an angle in numeric value
     * - Return: angle in degrees (0-360)
     */
    public static func angleType(_ angleType: String) -> CGFloat {
        if angleType == "left" { return Trig.left }
        else if angleType == "right" { return Trig.right }
        else if angleType == "top" { return Trig.top }
        else { return Trig.bottom } // bottom
    }
}
