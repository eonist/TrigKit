import Foundation
import QuartzCore
/**
 * Legacy-support / convenience
 */
extension Trig {
   /**
    * Parsers
    */
   public static func angle(_ a: CGPoint, _ b: CGPoint) -> CGFloat { TrigParser.angle(a, b) }
   public static func angleType(_ angleType: String) -> CGFloat { TrigUtils.angleType(angleType) }
   public static func normalize(_ angle: CGFloat) -> CGFloat { TrigParser.normalize(angle) }
   public static func normalize2(_ angle: CGFloat) -> CGFloat { TrigParser.normalize2(angle) }
   public static func degrees(_ radians: CGFloat) -> CGFloat { TrigConverter.degrees(radians) }
   public static func radians(_ degrees: CGFloat) -> CGFloat { TrigConverter.radians(degrees) }
   public static func difference(_ startAngle: CGFloat, _ endAngle: CGFloat) -> CGFloat { TrigParser.difference(startAngle, endAngle) }
   public static func difference(_ pivot: CGPoint, _ p1: CGPoint, _ p2: CGPoint) -> CGFloat { TrigParser.difference(pivot, p1, p2) }
   public static func flip(_ angle: CGFloat, _ axisMultiplier: CGPoint) -> CGFloat { TrigParser.flip(angle, axisMultiplier) }
   public static func angleSpan(_ a: CGFloat, _ b: CGFloat, _ direction: String = Trig.clockWise) -> CGFloat { TrigParser.angleSpan(a, b, direction) }
   public static func angleSpan2(_ a: CGFloat, _ b: CGFloat, _ isClockWise: Bool = true) -> CGFloat { TrigParser.angleSpan2(a, b, isClockWise) }
   public static func pointSpan2(_ p1: CGPoint, _ p2: CGPoint, _ pivot: CGPoint, _ isClockWise: Bool = true) -> CGFloat { TrigParser.pointSpan2(p1, p2, pivot, isClockWise) }
   public static func angleBisector(_ a: CGFloat, _ b: CGFloat) -> CGFloat { TrigParser.angleBisector(a, b) }
   /**
    * Asserters
    */
   public static func isClockWise(_ center: CGPoint, _ p1: CGPoint, _ p2: CGPoint) -> Bool { TrigAsserter.isClockWise(center, p1, p2) }
   public static func isClockWiseByAngle(_ a: CGFloat, _ b: CGFloat) -> Bool { TrigAsserter.isClockWiseByAngle(a, b) }
   public static func isOppositeDirectional(_ bisectorAngle: CGFloat, _ angleA: CGFloat, _ angleB: CGFloat) -> Bool { TrigAsserter.isOppositeDirectional(bisectorAngle, angleA, angleB) }
   public static func isContraDirectional(_ a: CGFloat, _ b: CGFloat) -> Bool { TrigAsserter.isContraDirectional(a, b) }
   public static func isParallel(_ a: CGFloat, _ b: CGFloat) -> Bool { TrigAsserter.isParallel(a, b) }
   public static func isCodirectional(_ a: CGFloat, _ b: CGFloat) -> Bool { TrigAsserter.isCodirectional(a, b) }
   public static func isNormal(_ angle1: CGFloat, _ angle2: CGFloat) -> Bool { TrigAsserter.isNormal(angle1, angle2) }
   public static func isCollinearNormal(_ p1: CGPoint, _ p2: CGPoint, _ angle1: CGFloat, _ angle2: CGFloat) -> Bool { TrigAsserter.isCollinearNormal(p1, p2, angle1, angle2) }
   public static func isCoDir(_ a: CGFloat, _ b: CGFloat) -> Bool { TrigAsserter.isCoDir(a, b) }
}
