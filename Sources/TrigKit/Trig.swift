import Foundation
import QuartzCore
/**
 * Globals
 */
public let π = CGFloat(Double.pi)/*Global variable*/
public let π2 = CGFloat(Double.pi / 2)/*Global variable,pi/2*/
public let π4 = CGFloat(Double.pi / 4)/*Global variable,pi/4*/
public let ㎭ = π / 180/*Global variable*/
/**
 * Constants
 */
public class Trig {
    public static let clockWise: String = "clockWise"
    public static let cw: String = Trig.clockWise
    public static let counterClockWise: String = "counterClockWise"
    public static let ccw: String = Trig.counterClockWise
    public static let left: CGFloat = 180
    public static let right: CGFloat = 0
    public static let bottom: CGFloat = 90
    public static let top: CGFloat = 270 //-90
    public static let rad: CGFloat = π / 180 //㎭, EXAMPLE: 90*Trig.rad//Output:π/4
    public static let deg: CGFloat = 180 / π //°, EXAMPLE: Trig.pi/4*Trig.deg//Output: 90
    public static let qpi: CGFloat = π / 4 //quarter pi (0.785)
    public static let epi: CGFloat = π / 8 //eighth pi (0.785/2)
    public static let spi: CGFloat = π / 16 //sixteenth pi (0.785/4)
    public static let hpi: CGFloat = π / 2 //half pi(1.57)
    public static let dpi: CGFloat = π * 2 //dubble pi (6.28)
    public static let pi: CGFloat = π // pi (3.14)
    public static let tpi: CGFloat = π / 6 // 30 deg in radians, twelft
    public static let dtpi: CGFloat = π / 3 // 60 deg in radians, dubble twelft
    public static let t: (CGFloat, CGFloat) = (-π / 4, -π * 0.75)
    public static let b: (CGFloat, CGFloat) = (π / 4, π * 0.75)
    public static let l: (CGFloat, CGFloat) = (Trig.normalize(π * 0.75), Trig.normalize(-π * 0.75))/*remember to normalize the angle to test against this value to be between 0 - PI*2*/
    public static let r: (CGFloat, CGFloat) = (-π / 4, π / 4)
    public static let tl: (CGFloat, CGFloat) = (-π, -π / 2) //(-180*㎭,-90*㎭)
    public static let tr: (CGFloat, CGFloat) = (-π / 2, 0) //(-90*㎭,0)
    public static let br: (CGFloat, CGFloat) = (0, π / 2) //(0,90*㎭)
    public static let bl: (CGFloat, CGFloat) = (π / 2, π) //(90*㎭,180*㎭)
}
