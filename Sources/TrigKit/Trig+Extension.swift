import Foundation
import QuartzCore

extension Trig {/*Legacy-support/convenience*/
   /**
    * Parsers
    */
   public static func angle(_ a: CGPoint, _ b: CGPoint) -> CGFloat { return TrigParser.angle(a, b) }
   public static func angleType(_ angleType: String) -> CGFloat { return TrigUtils.angleType(angleType) }
   public static func normalize(_ angle: CGFloat) -> CGFloat { return TrigParser.normalize(angle) }
   public static func normalize2(_ angle: CGFloat) -> CGFloat { return TrigParser.normalize2(angle) }
   public static func degrees(_ radians: CGFloat) -> CGFloat { return TrigConverter.degrees(radians) }
   public static func radians(_ degrees: CGFloat) -> CGFloat { return TrigConverter.radians(degrees) }
   public static func difference(_ startAngle: CGFloat, _ endAngle: CGFloat) -> CGFloat { return TrigParser.difference(startAngle, endAngle) }
   public static func difference(_ pivot: CGPoint, _ p1: CGPoint, _ p2: CGPoint) -> CGFloat { return TrigParser.difference(pivot, p1, p2) }
   public static func flip(_ angle: CGFloat, _ axisMultiplier: CGPoint) -> CGFloat { return TrigParser.flip(angle, axisMultiplier) }
   public static func angleSpan(_ a: CGFloat, _ b: CGFloat, _ direction: String = Trig.clockWise) -> CGFloat { return TrigParser.angleSpan(a, b, direction) }
   public static func angleSpan2(_ a: CGFloat, _ b: CGFloat, _ isClockWise: Bool = true) -> CGFloat { return TrigParser.angleSpan2(a, b, isClockWise) }
   public static func pointSpan2(_ p1: CGPoint, _ p2: CGPoint, _ pivot: CGPoint, _ isClockWise: Bool = true) -> CGFloat { return TrigParser.pointSpan2(p1, p2, pivot, isClockWise) }
   public static func angleBisector(_ a: CGFloat, _ b: CGFloat) -> CGFloat { return TrigParser.angleBisector(a, b) }
   /**
    * Asserters
    */
   public static func isClockWise(_ center: CGPoint, _ p1: CGPoint, _ p2: CGPoint) -> Bool { return TrigAsserter.isClockWise(center, p1, p2) }
   public static func isClockWiseByAngle(_ a: CGFloat, _ b: CGFloat) -> Bool { return TrigAsserter.isClockWiseByAngle(a, b) }
   public static func isOppositeDirectional(_ bisectorAngle: CGFloat, _ angleA: CGFloat, _ angleB: CGFloat) -> Bool { return TrigAsserter.isOppositeDirectional(bisectorAngle, angleA, angleB) }
   public static func isContraDirectional(_ a: CGFloat, _ b: CGFloat) -> Bool { return TrigAsserter.isContraDirectional(a, b) }
   public static func isParallel(_ a: CGFloat, _ b: CGFloat) -> Bool { return TrigAsserter.isParallel(a, b) }
   public static func isCodirectional(_ a: CGFloat, _ b: CGFloat) -> Bool { return TrigAsserter.isCodirectional(a, b) }
   public static func isNormal(_ angle1: CGFloat, _ angle2: CGFloat) -> Bool { return TrigAsserter.isNormal(angle1, angle2) }
   public static func isCollinearNormal(_ p1: CGPoint, _ p2: CGPoint, _ angle1: CGFloat, _ angle2: CGFloat) -> Bool { return TrigAsserter.isCollinearNormal(p1, p2, angle1, angle2) }
   public static func isCoDir(_ a: CGFloat, _ b: CGFloat) -> Bool { return TrigAsserter.isCoDir(a, b) }
}
