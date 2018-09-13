//
//  StylizeTests.swift
//  StylizeTests
//
//  Created by Alex Fish on 10/01/2015.
//  Copyright (c) 2015 alexefish. All rights reserved.
//

import UIKit
import XCTest
@testable import Stylize

class StylizeTests: XCTestCase {

    var string: NSAttributedString?
    let range = NSMakeRange(0, 1)

    override func setUp() {
        super.setUp()
        string = NSAttributedString(string: "Test String")
    }

    func testUnderlineAttributeIsAdded() {
        let style = Stylize.underline(.single)
        checkAttribute(.underlineStyle, style: style)
    }

    func testUnderlineAttibuteIsAddedToARange() {
        let style = Stylize.underline(.single, range: range)
        checkAttributeInRange(.underlineStyle, style: style)
    }

    func testForegroundColorIsAdded() {
        let style = Stylize.foreground(UIColor.red)
        checkAttribute(.foregroundColor, style: style)
    }

    func testForegroundColorIsAddedToARange() {
        let style = Stylize.foreground(UIColor.red, range: range)
        checkAttributeInRange(.foregroundColor, style: style)
    }

    func testBackgroundColorIsAdded() {
        let style = Stylize.background(UIColor.red)
        checkAttribute(.backgroundColor, style: style)
    }

    func testBackgroundColorIsAddedToARange() {
        let style = Stylize.background(UIColor.red, range: range)
        checkAttributeInRange(.backgroundColor, style: style)
    }

    func testUnderlineColorIsAdded() {
        let style = Stylize.underline(UIColor.red)
        checkAttribute(.underlineColor, style: style)
    }

    func testUnderlineColorIsAddedToARange() {
        let style = Stylize.underline(UIColor.red, range: range)
        checkAttributeInRange(.underlineColor, style: style)
    }

    func testLinkIsAdded() {
        let style = Stylize.link(URL(string: "http://google.com")!)
        checkAttribute(.link, style: style)
    }

    func testLinkIsAddedToARange() {
        let style = Stylize.link(URL(string: "http://google.com")!, range: range)
        checkAttributeInRange(.link, style: style)
    }

    func testParagraphIsAdded() {
        let style = Stylize.paragraph(NSParagraphStyle())
        checkAttribute(.paragraphStyle, style: style)
    }

    func testParagraphIsAddedToARange() {
        let style = Stylize.paragraph(NSParagraphStyle(), range: range)
        checkAttributeInRange(.paragraphStyle, style: style)
    }

    func testKernIsAdded() {
        let style = Stylize.kern(1)
        checkAttribute(.kern, style: style)
    }

    func testKernIsAddedToARange() {
        let style = Stylize.kern(1, range: range)
        checkAttributeInRange(.kern, style: style)
    }

    func testBaselineIsAdded() {
        let style = Stylize.baseline(1)
        checkAttribute(.baselineOffset, style: style)
    }

    func testBaselineIsAddedToARange() {
        let style = Stylize.baseline(1, range: range)
        checkAttributeInRange(.baselineOffset, style: style)
    }

    func testStrikethroughIsAdded() {
        let style = Stylize.strikethrough(.patternDash)
        checkAttribute(.strikethroughStyle, style: style)
    }

    func testStrikethroughIsAddedToARange() {
        let style = Stylize.strikethrough(.patternDash, range: range)
        checkAttributeInRange(.strikethroughStyle, style: style)
    }

    func testStrikethroughColorIsAdded() {
        let style = Stylize.strikethrough(UIColor.red)
        checkAttribute(.strikethroughColor, style: style)
    }

    func testStrikethroughColorIsAddedtoARange() {
        let style = Stylize.strikethrough(UIColor.red, range: range)
        checkAttributeInRange(.strikethroughColor, style: style)
    }

    func testShadowIsAdded() {
        let style = Stylize.shadow(NSShadow())
        checkAttribute(.shadow, style: style)
    }

    func testShadowIsAddedToRange() {
        let style = Stylize.shadow(NSShadow(), range: range)
        checkAttributeInRange(.shadow, style: style)
    }

    func testStrokeWidthIsAdded() {
        let style = Stylize.stroke(1)
        checkAttribute(.strokeWidth, style: style)
    }

    func testStrokeWidthIsAddedToRange() {
        let style = Stylize.stroke(1, range: range)
        checkAttributeInRange(.strokeWidth, style: style)
    }

    func testStrokeColorIsAdded() {
        let style = Stylize.stroke(UIColor.red)
        checkAttribute(.strokeColor, style: style)
    }

    func testStrokeColorIsAddedToRange() {
        let style = Stylize.stroke(UIColor.red, range: range)
        checkAttributeInRange(.strokeColor, style: style)
    }

    func testLetterpressIsAdded() {
        let style = Stylize.letterpress()
        checkAttribute(.textEffect, style: style)
    }

    func testLetterpressIsAddedToRange() {
        let style = Stylize.letterpress(range)
        checkAttributeInRange(.textEffect, style: style)
    }

    func testFontIsAdded() {
        let style = Stylize.font(UIFont.boldSystemFont(ofSize: 10))
        checkAttribute(.font, style: style)
    }

    func testFontIsAddedToRange() {
        let style = Stylize.font(UIFont.boldSystemFont(ofSize: 10), range: range)
        checkAttributeInRange(.font, style: style)
    }

    func testLigaturesAreAdded() {
        let style = Stylize.ligatures(true)
        checkAttribute(.ligature, style: style)
    }

    func testLigaturesAreAddedToRange() {
        let style = Stylize.ligatures(true, range: range)
        checkAttributeInRange(.ligature, style: style)
    }

    func testObliquenessIsAdded() {
        let style = Stylize.obliqueness(1)
        checkAttribute(.obliqueness, style: style)
    }

    func testObliquenessIsAddedToRange() {
        let style = Stylize.obliqueness(1, range: range)
        checkAttributeInRange(.obliqueness, style: style)
    }

    func testAttachementIsAdded() {
        let style = Stylize.attachment(NSTextAttachment())
        checkAttribute(.attachment, style: style)
    }

    func testAttachementIsAddedToRange() {
        let style = Stylize.attachment(NSTextAttachment(), range: range)
        checkAttributeInRange(.attachment, style: style)
    }

    func testExpandIsAdded() {
        let style = Stylize.expand(1)
        checkAttribute(.expansion, style: style)
    }

    func testExpandIsAddedToRange() {
        let style = Stylize.expand(1, range: range)
        checkAttributeInRange(.expansion, style: style)
    }

    func testDirectionIsAdded() {
        let style = Stylize.direction(.rightToLeftEmbedding)
        checkAttribute(.writingDirection, style: style)
    }

    func testDirectionIsAddedToRange() {
        let style = Stylize.direction(.rightToLeftEmbedding, range: range)
        checkAttributeInRange(.writingDirection, style: style)
    }

    func testStylesAreComposed() {
        let baseline = Stylize.baseline(1)
        let kern = Stylize.kern(1)
        let style = Stylize.compose(baseline, kern)

        checkAttribute(.baselineOffset, style: style)
        checkAttribute(.kern, style: style)
    }

    func testStylesAreComposedInRange() {
        let baseline = Stylize.baseline(1, range: range)
        let kern = Stylize.kern(1, range: range)
        let style = Stylize.compose(baseline, kern)

        checkAttributeInRange(.baselineOffset, style: style)
        checkAttributeInRange(.kern, style: style)
    }
}

extension StylizeTests {

    func checkAttribute(_ name: AttributeName, style: StringStyle) {
        let testString  = style(string!)

        let found = attributeFound(name, string: testString)

        XCTAssertTrue(found, "\(name) attribute was not added")
    }

    func checkAttributeInRange(_ name: AttributeName, style: StringStyle) {
        let testString  = style(string!)

        let found    = attributeFound(name, string: testString, range: range)
        let notFound = attributeFound(name, string: testString, range: NSMakeRange(1, 5))

        XCTAssertTrue(found, "\(name) attribute was not added at the correct range")
        XCTAssertFalse(notFound, "\(name) attribute was added at the wrong range")
    }

    func attributeFound(_ name: AttributeName, string: NSAttributedString) -> Bool {
        var found = false

        string.enumerateAttribute(name, in: NSMakeRange(0, string.length), options: NSAttributedString.EnumerationOptions.reverse, using: { attributes, _, _ in
            found = attributes != nil
        })

        return found
    }

    func attributeFound(_ name: AttributeName, string: NSAttributedString, range: NSRange) -> Bool {
        var found = false

        string.enumerateAttribute(name, in: range, options: .reverse, using: { attributes, _, _ in
            found = attributes != nil
        })

        return found
    }
}
