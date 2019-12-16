import XCTest
@testable import TrigKitIOS

class TrigKitIOSTests: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      TrigKitIOSTests.assertTests()
      TrigKitIOSTests.parserTests()
      TrigKitIOSTests.trigTests()
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
/**
 * Tests
 */
extension TrigKitIOSTests {
   /**
    * assert tests
    */
   private static func assertTests() {
      XCTAssertTrue(TrigAsserter.isContraDirectional(Trig.pi, 0))//true, contra-dir
      XCTAssertTrue(TrigAsserter.isContraDirectional(0, Trig.pi));//true, contra-dir
      XCTAssertTrue(TrigAsserter.isContraDirectional(Trig.hpi, -Trig.hpi));//true, contra-dir
      XCTAssertFalse(TrigAsserter.isContraDirectional(Trig.pi, -Trig.pi));//false, its co-dir
      XCTAssertFalse(TrigAsserter.isContraDirectional(-Trig.pi, Trig.pi));//false, its co-dir
   }
   /**
    * Parser tests
    */
   private static func parserTests() {
      XCTAssertEqual(TrigParser.angleBisector(Trig.qpi,  Trig.hpi + Trig.hpi), 1.9634954084936207)
   }
   /**
    * Trig tests
    */
   private static func trigTests() {
      XCTAssertEqual(90 * Trig.rad, π/4)
      XCTAssertEqual(Trig.pi / 4 * Trig.deg, 90)
   }
}
