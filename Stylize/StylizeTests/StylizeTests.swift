//
//  StylizeTests.swift
//  StylizeTests
//
//  Created by Alex Fish on 10/01/2015.
//  Copyright (c) 2015 alexefish. All rights reserved.
//

import UIKit
import XCTest
import Stylize

class StylizeTests: XCTestCase {

    var string: NSAttributedString?

    override func setUp() {
        super.setUp()
        string = NSAttributedString(string: "Test String")
    }

    func testUnderlineAttributeIsAdded() {
        let style = Stylize.underline(NSUnderlineStyle.StyleSingle)
        checkAttribute(NSUnderlineStyleAttributeName, style: style)
    }

    func testUnderlineAttibuteIsAddedToARange() {
        let style = Stylize.underline(NSUnderlineStyle.StyleSingle, range: NSMakeRange(0, 1))
        checkAttributeInRange(NSUnderlineStyleAttributeName, style: style)
    }

    func testForegroundColorIsAdded() {
        let style = Stylize.foregroundColor(UIColor.redColor())
        checkAttribute(NSForegroundColorAttributeName, style: style)
    }

    func testForegroundColorIsAddedToARange() {
        let style = Stylize.foregroundColor(UIColor.redColor(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSForegroundColorAttributeName, style: style)
    }

    func testBackgroundColorIsAdded() {
        let style = Stylize.backgroundColor(UIColor.redColor())
        checkAttribute(NSBackgroundColorAttributeName, style: style)
    }

    func testBackgroundColorIsAddedToARange() {
        let style = Stylize.backgroundColor(UIColor.redColor(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSBackgroundColorAttributeName, style: style)
    }

    func testUnderlineColorIsAdded() {
        let style = Stylize.underlineColor(UIColor.redColor())
        checkAttribute(NSUnderlineColorAttributeName, style: style)
    }

    func testUnderlineColorIsAddedToARange() {
        let style = Stylize.underlineColor(UIColor.redColor(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSUnderlineColorAttributeName, style: style)
    }

    func testLinkIsAdded() {
        let style = Stylize.link(NSURL(string: "")!)
        checkAttribute(NSLinkAttributeName, style: style)
    }

    func testLinkIsAddedToARange() {
        let style = Stylize.link(NSURL(string: "")!, range: NSMakeRange(0, 1))
        checkAttributeInRange(NSLinkAttributeName, style: style)
    }

    func testParagraphIsAdded() {
        let style = Stylize.paragraph(NSParagraphStyle())
        checkAttribute(NSParagraphStyleAttributeName, style: style)
    }

    func testParagraphIsAddedToARange() {
        let style = Stylize.paragraph(NSParagraphStyle(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSParagraphStyleAttributeName, style: style)
    }

    func testKernIsAdded() {
        let style = Stylize.kern(1)
        checkAttribute(NSKernAttributeName, style: style)
    }

    func testKernIsAddedToARange() {
        let style = Stylize.kern(1, range: NSMakeRange(0, 1))
        checkAttributeInRange(NSKernAttributeName, style: style)
    }

    func testBaselineIsAdded() {
        let style = Stylize.baseline(1)
        checkAttribute(NSBaselineOffsetAttributeName, style: style)
    }

    func testBaselineIsAddedToARange() {
        let style = Stylize.baseline(1, range: NSMakeRange(0, 1))
        checkAttributeInRange(NSBaselineOffsetAttributeName, style: style)
    }

    func testStrikethroughIsAdded() {
        let style = Stylize.strikethrough(NSUnderlineStyle.PatternDash)
        checkAttribute(NSStrikethroughStyleAttributeName, style: style)
    }

    func testStrikethroughIsAddedToARange() {
        let style = Stylize.strikethrough(NSUnderlineStyle.PatternDash, range: NSMakeRange(0, 1))
        checkAttributeInRange(NSStrikethroughStyleAttributeName, style: style)
    }

    func testStrikethroughColorIsAdded() {
        let style = Stylize.strikethroughColor(UIColor.redColor())
        checkAttribute(NSStrikethroughColorAttributeName, style: style)
    }

    func testStrikethroughColorIsAddedtoARange() {
        let style = Stylize.strikethroughColor(UIColor.redColor(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSStrikethroughColorAttributeName, style: style)
    }

    func testShadowIsAdded() {
        let style = Stylize.shadow(NSShadow())
        checkAttribute(NSShadowAttributeName, style: style)
    }

    func testShadowIsAddedToRange() {
        let style = Stylize.shadow(NSShadow(), range: NSMakeRange(0, 1))
        checkAttributeInRange(NSShadowAttributeName, style: style)
    }

    func testStylesAreComposed() {
        let baseline = Stylize.baseline(1)
        let kern = Stylize.kern(1)
        let style = Stylize.compose(baseline, kern)

        checkAttribute(NSBaselineOffsetAttributeName, style: style)
        checkAttribute(NSKernAttributeName, style: style)
    }

    func testStylesAreComposedInRange() {
        let baseline = Stylize.baseline(1, range: NSMakeRange(0, 1))
        let kern = Stylize.kern(1, range: NSMakeRange(0, 1))
        let style = Stylize.compose(baseline, kern)

        checkAttributeInRange(NSBaselineOffsetAttributeName, style: style)
        checkAttributeInRange(NSKernAttributeName, style: style)
    }
}

extension StylizeTests {

    func checkAttribute(name: AttributeName, style: StringStyle) {
        let testString  = style(string!)

        var found = attributeFound(name, string: testString)

        XCTAssertTrue(found, "\(name) attribute was not added")
    }

    func checkAttributeInRange(name: AttributeName, style: StringStyle) {
        let testString  = style(string!)

        var found    = attributeFound(name, string: testString, range: NSMakeRange(0, 1))
        var notFound = attributeFound(name, string: testString, range: NSMakeRange(1, 5))

        XCTAssertTrue(found, "\(name) attribute was not added at the correct range")
        XCTAssertFalse(notFound, "\(name) attribute was added at the wrong range")
    }

    func attributeFound(name: AttributeName, string: NSAttributedString) -> Bool {
        var found = false

        string.enumerateAttribute(name, inRange: NSMakeRange(0, string.length), options: NSAttributedStringEnumerationOptions.Reverse, usingBlock: { attributes, _, _ in
            found = attributes != nil
        })

        return found
    }

    func attributeFound(name: AttributeName, string: NSAttributedString, range: NSRange) -> Bool {
        var found = false

        string.enumerateAttribute(name, inRange: range, options: NSAttributedStringEnumerationOptions.Reverse, usingBlock: { attributes, _, _ in
            found = attributes != nil
        })

        return found
    }
}