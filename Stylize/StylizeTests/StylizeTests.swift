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
        let style = Stylize.underline(NSUnderlineStyle.styleSingle)
        checkAttribute(NSAttributedStringKey.underlineStyle, style: style)
    }

    func testUnderlineAttibuteIsAddedToARange() {
        let style = Stylize.underline(NSUnderlineStyle.styleSingle, range: range)
        checkAttributeInRange(NSAttributedStringKey.underlineStyle, style: style)
    }

    func testForegroundColorIsAdded() {
        let style = Stylize.foreground(UIColor.red)
        checkAttribute(NSAttributedStringKey.foregroundColor, style: style)
    }

    func testForegroundColorIsAddedToARange() {
        let style = Stylize.foreground(UIColor.red, range: range)
        checkAttributeInRange(NSAttributedStringKey.foregroundColor, style: style)
    }

    func testBackgroundColorIsAdded() {
        let style = Stylize.background(UIColor.red)
        checkAttribute(NSAttributedStringKey.backgroundColor, style: style)
    }

    func testBackgroundColorIsAddedToARange() {
        let style = Stylize.background(UIColor.red, range: range)
        checkAttributeInRange(NSAttributedStringKey.backgroundColor, style: style)
    }

    func testUnderlineColorIsAdded() {
        let style = Stylize.underline(UIColor.red)
        checkAttribute(NSAttributedStringKey.underlineColor, style: style)
    }

    func testUnderlineColorIsAddedToARange() {
        let style = Stylize.underline(UIColor.red, range: range)
        checkAttributeInRange(NSAttributedStringKey.underlineColor, style: style)
    }

    func testLinkIsAdded() {
        let style = Stylize.link(URL(string: "http://google.com")!)
        checkAttribute(NSAttributedStringKey.link, style: style)
    }

    func testLinkIsAddedToARange() {
        let style = Stylize.link(URL(string: "http://google.com")!, range: range)
        checkAttributeInRange(NSAttributedStringKey.link, style: style)
    }

    func testParagraphIsAdded() {
        let style = Stylize.paragraph(NSParagraphStyle())
        checkAttribute(NSAttributedStringKey.paragraphStyle, style: style)
    }

    func testParagraphIsAddedToARange() {
        let style = Stylize.paragraph(NSParagraphStyle(), range: range)
        checkAttributeInRange(NSAttributedStringKey.paragraphStyle, style: style)
    }

    func testKernIsAdded() {
        let style = Stylize.kern(1)
        checkAttribute(NSAttributedStringKey.kern, style: style)
    }

    func testKernIsAddedToARange() {
        let style = Stylize.kern(1, range: range)
        checkAttributeInRange(NSAttributedStringKey.kern, style: style)
    }

    func testBaselineIsAdded() {
        let style = Stylize.baseline(1)
        checkAttribute(NSAttributedStringKey.baselineOffset, style: style)
    }

    func testBaselineIsAddedToARange() {
        let style = Stylize.baseline(1, range: range)
        checkAttributeInRange(NSAttributedStringKey.baselineOffset, style: style)
    }

    func testStrikethroughIsAdded() {
        let style = Stylize.strikethrough(NSUnderlineStyle.patternDash)
        checkAttribute(NSAttributedStringKey.strikethroughStyle, style: style)
    }

    func testStrikethroughIsAddedToARange() {
        let style = Stylize.strikethrough(NSUnderlineStyle.patternDash, range: range)
        checkAttributeInRange(NSAttributedStringKey.strikethroughStyle, style: style)
    }

    func testStrikethroughColorIsAdded() {
        let style = Stylize.strikethrough(UIColor.red)
        checkAttribute(NSAttributedStringKey.strikethroughColor, style: style)
    }

    func testStrikethroughColorIsAddedtoARange() {
        let style = Stylize.strikethrough(UIColor.red, range: range)
        checkAttributeInRange(NSAttributedStringKey.strikethroughColor, style: style)
    }

    func testShadowIsAdded() {
        let style = Stylize.shadow(NSShadow())
        checkAttribute(NSAttributedStringKey.shadow, style: style)
    }

    func testShadowIsAddedToRange() {
        let style = Stylize.shadow(NSShadow(), range: range)
        checkAttributeInRange(NSAttributedStringKey.shadow, style: style)
    }

    func testStrokeWidthIsAdded() {
        let style = Stylize.stroke(1)
        checkAttribute(NSAttributedStringKey.strokeWidth, style: style)
    }

    func testStrokeWidthIsAddedToRange() {
        let style = Stylize.stroke(1, range: range)
        checkAttributeInRange(NSAttributedStringKey.strokeWidth, style: style)
    }

    func testStrokeColorIsAdded() {
        let style = Stylize.stroke(UIColor.red)
        checkAttribute(NSAttributedStringKey.strokeColor, style: style)
    }

    func testStrokeColorIsAddedToRange() {
        let style = Stylize.stroke(UIColor.red, range: range)
        checkAttributeInRange(NSAttributedStringKey.strokeColor, style: style)
    }

    func testLetterpressIsAdded() {
        let style = Stylize.letterpress()
        checkAttribute(NSAttributedStringKey.textEffect, style: style)
    }

    func testLetterpressIsAddedToRange() {
        let style = Stylize.letterpress(range)
        checkAttributeInRange(NSAttributedStringKey.textEffect, style: style)
    }

    func testFontIsAdded() {
        let style = Stylize.font(UIFont.boldSystemFont(ofSize: 10))
        checkAttribute(NSAttributedStringKey.font, style: style)
    }

    func testFontIsAddedToRange() {
        let style = Stylize.font(UIFont.boldSystemFont(ofSize: 10), range: range)
        checkAttributeInRange(NSAttributedStringKey.font, style: style)
    }

    func testLigaturesAreAdded() {
        let style = Stylize.ligatures(true)
        checkAttribute(NSAttributedStringKey.ligature, style: style)
    }

    func testLigaturesAreAddedToRange() {
        let style = Stylize.ligatures(true, range: range)
        checkAttributeInRange(NSAttributedStringKey.ligature, style: style)
    }

    func testObliquenessIsAdded() {
        let style = Stylize.obliqueness(1)
        checkAttribute(NSAttributedStringKey.obliqueness, style: style)
    }

    func testObliquenessIsAddedToRange() {
        let style = Stylize.obliqueness(1, range: range)
        checkAttributeInRange(NSAttributedStringKey.obliqueness, style: style)
    }

    func testAttachementIsAdded() {
        let style = Stylize.attachment(NSTextAttachment())
        checkAttribute(NSAttributedStringKey.attachment, style: style)
    }

    func testAttachementIsAddedToRange() {
        let style = Stylize.attachment(NSTextAttachment(), range: range)
        checkAttributeInRange(NSAttributedStringKey.attachment, style: style)
    }

    func testExpandIsAdded() {
        let style = Stylize.expand(1)
        checkAttribute(NSAttributedStringKey.expansion, style: style)
    }

    func testExpandIsAddedToRange() {
        let style = Stylize.expand(1, range: range)
        checkAttributeInRange(NSAttributedStringKey.expansion, style: style)
    }

    func testDirectionIsAdded() {
        let style = Stylize.direction(WritingDirection.rightToLeftEmbedding)
        checkAttribute(NSAttributedStringKey.writingDirection, style: style)
    }

    func testDirectionIsAddedToRange() {
        let style = Stylize.direction(WritingDirection.rightToLeftEmbedding, range: range)
        checkAttributeInRange(NSAttributedStringKey.writingDirection, style: style)
    }

    func testStylesAreComposed() {
        let baseline = Stylize.baseline(1)
        let kern = Stylize.kern(1)
        let style = Stylize.compose(baseline, kern)

        checkAttribute(NSAttributedStringKey.baselineOffset, style: style)
        checkAttribute(NSAttributedStringKey.kern, style: style)
    }

    func testStylesAreComposedInRange() {
        let baseline = Stylize.baseline(1, range: range)
        let kern = Stylize.kern(1, range: range)
        let style = Stylize.compose(baseline, kern)

        checkAttributeInRange(NSAttributedStringKey.baselineOffset, style: style)
        checkAttributeInRange(NSAttributedStringKey.kern, style: style)
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

        string.enumerateAttribute(name, in: range, options: NSAttributedString.EnumerationOptions.reverse, using: { attributes, _, _ in
            found = attributes != nil
        })

        return found
    }
}
