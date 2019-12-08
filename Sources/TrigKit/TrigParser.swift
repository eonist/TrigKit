import Foundation
import QuartzCore

public class TrigParser {
   /**
    * Returns an angle in radian between -3.14 and 3.14 (-180 and 180 converted to degress)
    * - Parameters:
    *   - a: is the pivot point
    *   - b: is the polar point
    * - Note: use this formula to find the angle in a (0,0) point-space Math.atan2(pointB.y, pointB.x)
    * - Note: formula in standard form: Tan Ɵ = y/x (then use inverse tan to find the angle)
    */
   public static func angle(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
      return atan2(b.y - a.y, b.x - a.x)
   }
   /**
    * Returns a radian to be between 0 and Math.PI*2 Radian (0 - 6.28)
    * - Parameter: theta: An radian in degrees typically 0 - Math.PI*2
    * - Note: we use "while" function type here because angle could be very low at which point Math.PI*2 needs to be contrinuasly added until its above 0 )
    * - Fixme: ⚠️️ Use modulo like normalize2 does, is that faster ? do an optimization test.
    */
   public static func normalize(_ angle: CGFloat) -> CGFloat {
      var angle = angle
      while angle < 0 {angle += π * 2}
      while angle >= π * 2 {angle -= π * 2}
      return angle
   }
   /**
    * Returns a x value on the circle circumference correlating to the intersecting x axis derrived from the PARAM: y
    * - Note: Based on the Circle formula: (x-h)^2+(y-k)^2 = r^2 (where h and k are the center of the circle)
    * - Parameters:
    *   - y: the y value
    *   - r: the radius of the sphere
    *   - p: the position of the sphere
    */
   public static func x(_ y: CGFloat, _ r: CGFloat, _ p: CGPoint) -> CGFloat {
      return sqrt(pow(r, 2) - pow(y - p.y, 2)) + p.x
   }
   /**
    * Returns a y value on the circle circumference correlating to the intersecting x axis derrived from the PARAM: x value
    * - Note: Based on the Circle formula: (x-h)^2+(y-k)^2 = r^2 (where h and k are the center of the circle)
    * - Note: this method works as it is suppose to
    * - Parameter: x the x value
    * - Parameter: r the radius of the sphere
    * - Parameter: p the position of the sphere
    */
   public static func y(_ x: CGFloat, _ r: CGFloat, _ p: CGPoint) -> CGFloat {
      return sqrt(pow(r, 2) - pow(x - p.x, 2)) + p.y
   }
   /**
    * Returns an radian to be between -Math.PI(-3.14) and Math.PI(3.14)
    * - Parameter: theta: An radian in degrees typically 0 - Math.PI*2
    */
   public static func normalize2(_ angle: CGFloat) -> CGFloat {
      if angle < -π { return π + (angle.truncatingRemainder(dividingBy: π))}
      if angle > π { return -π + (angle.truncatingRemainder(dividingBy: π))}
      return angle
   }
   /**
    * Returns the difference between two angles, positive or negative
    * - Parameter: startAngle (in radian)
    * - Parameter: endAngle (in radian)
    */
   public static func difference(_ startAngle: CGFloat, _ endAngle: CGFloat) -> CGFloat {
      return atan2(sin(endAngle - startAngle), cos(endAngle - startAngle))
   }
   /**
    * - Note: you need to abs() the result if you want only posetive angleSpan
    */
   public static func difference(_ pivot: CGPoint, _ p1: CGPoint, _ p2: CGPoint) -> CGFloat{
      let a:CGFloat = Trig.angle(pivot, p1)
      let b:CGFloat = Trig.angle(pivot, p2)
      return difference(a, b)
   }
   /**
    * - Note: this is the same as the above but works with a boolean which makes more sence, deprecate pointSpan
    */
   public static func pointSpan2(_ p1: CGPoint, _ p2: CGPoint, _ pivot: CGPoint, _ isClockWise: Bool = true) -> CGFloat {
      let a: CGFloat = Trig.angle(pivot, p1)
      let b: CGFloat = Trig.angle(pivot, p2)
      return TrigParser.angleSpan2(a, b, isClockWise)
   }
   /**
    * Returns the span in a clockwise or counterclockwise direction (radian between 0 and Math.PI*2)
    * PARAM: direction is of the Direction.CLOCK_WISE or Direction.COUNTER_CLOCK_WISE type
    * PARAM: a (-Math.PI to Math.PI)
    * PARAM: b (-Math.PI to Math.PI)
    * NOTE: This method works great when finding angles in a triangle
    * NOTE: Using NumberParser.distance(a,b) to find an angle span doesnt work
    * NOTE: if you know that the anglespan is under π then you can also use: abs(Trig.difference(angle1, angle2))
    * EXAMPLE:
    * angleSpan(Math.PI*-0.5, Math.PI,Direction.COUNTER_CLOCK_WISE);//Math.PI*-0.5 to Math.PI = 4.71
    * angleSpan(Math.PI, Math.PI*0.5,Direction.COUNTER_CLOCK_WISE);//Math.PI to Math.PI*0.5 = 4.71
    * - TODO: ⚠️️ replace direction with boolean: isClockWise
    */
   public static func angleSpan(_ a: CGFloat, _ b: CGFloat, _ direction: String = Trig.clockWise) -> CGFloat{
      if direction == Trig.clockWise { return Trig.normalize(b + (Trig.pi * 2 - a)) }
      return Trig.normalize(a + (Trig.pi * 2 - b))/*Direction.COUNTER_CLOCK_WISE*/
   }
   /**
    * NOTE: this is the same as the above but works with a boolean which makes more sence, deprecate angleSpan1
    */
   public static func angleSpan2(_ a: CGFloat, _ b: CGFloat, _ isClockWise: Bool = true) -> CGFloat {
      return angleSpan(a, b, isClockWise ? Trig.clockWise : Trig.counterClockWise)
   }
   /**
    * Angle span
    */
   public static func angleSpan3(pivot: CGPoint, a: CGPoint, b: CGPoint) -> CGFloat {
      let angle1 = Trig.angle(pivot, a)
      let angle2 = Trig.angle(pivot, b)
      let A = abs(Trig.difference(angle1, angle2))
      return A
   }
   /**
    * Returns a flipped angle between -3.14 and 3.14 (an angle that is flipped in the x or y axis)
    * - Parameters:
    *   - angle: between -3.14 and +3.14 (if you want to use angles from 0 to 6.28 use Angle.normalize2 on the PARAM: angle first)
    *   - horizontalAxis: horizontal axis multiplier
    *   - verticalAxis: vertical axis multiplier
    * - Note: if you want to flip an angle vertically you can also do this: angle *= -1;
    * - Note: if you want to flip an angle horizontally you can also do this: angle = (angle + Math.PI/2 * -1)-Math.PI/2;
    * - Note: if you want to flip an angle that is rotated, just rotate it back to 0 rotation and then flip the angle and then rotated it back to original rotation // TODO: maybe make a funciton that does this?
    * - Note: To find xAxisMultiplier its smart to use if shorthand like so: (_arcMinor > 0)? 1 : -1
    * - Note: This function used to be named Angle.inverse but because of ambiguity it was renmaed to Angle.flip
    * ## Examples: Angle.flip(Angle.polarAngle(20, 20), 1, 1);//Output: 0.7853981633974483
    * ## Examples: Angle.flip(Angle.polarAngle(20, 20), -1, 1);//Output: 2.356194490192345 (the result is now flipped in the x axis)
    * ## Examples: Angle.flip(Angle.polarAngle(20, 20), -1, -1);//Output: -2.356194490192345 (the result is now flipped in the x and y axis)
    * ## Examples: Angle.flip(Angle.polarAngle(20, 20), 1, -1);//Output: -0.7853981633974483 (the result is now flipped in the y axis)
    * ## Examples: Angle.flip(Angle.polarAngle(20, -20), -1, 1);//Output: -2.356194490192345 (the result is now flipped in the x axis)
    * - Note: ⚠️️ this should ultimatly use yAxisMultplier and xAxisMultiplier as two seperate variables or?
    * - Note: ⚠️️ this can be optimized, see the proto site
    * - Note: ⚠️️ should use yMultiplier:int xMultiplier:int
    * - Note: ⚠️️ if you flip with -1,-1 you could also just do normalize2(angle - PI), this could be an optimization
    */
   public static func flip(_ angle: CGFloat, _ axisMultiplier:CGPoint) -> CGFloat {
      let verticalAngle: CGFloat = angle * axisMultiplier.y
      var horisontalAngle: CGFloat = Trig.normalize2(verticalAngle - Trig.hpi) * axisMultiplier.x // Rotate to vertical alignment
      horisontalAngle = Trig.normalize2(horisontalAngle + Trig.hpi)/*rotate back to original alignment*/
      return horisontalAngle
   }
   /**
    * Returns the angle between angles PARAM: a and PARAM: b
    * - Parameters:
    *   - a: The first angle (between 0 and 2PI)
    *   - b: The second angle (between 0 and 2PI)
    * - Note: you need to normalize PARAM: a and PARAM: b before using this method, between 0 and 2PI or? (or else negative values may not work, 2 and -2 wont yield -PI)
    * - Note: this does not return the average between two angles, the average is just (angleA+angleB)/2
    * - Note: think of the angle bisector as a trajactory that splits two angle points, where this trajectory hits is the angleBisector
    * - Note: the symbole for bisector is sometimes "s"
    * - Note: you can use TriangleMath.bisectorPoint(pt1, pt2, pt3) and calc the angle between anchor and this point as an alternative to this method
    * - Note: you can also use: TriangleMath.bisectorPT() which uses this method but accepts points
    * - Note: see TriangleMath for other bisector methods
    * ## EXAMPLES:
    * Trig.angleBisector(Trig.QPI,  Trig.HPI+Trig.HPI));//1.9634954084936207
    */
   public static func angleBisector(_ a: CGFloat, _ b: CGFloat) -> CGFloat { // TODO: rename to just bisector, bisectorAngle
      return a + ((b - a) / 2)
   }
}

