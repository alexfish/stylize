//
//  Stylize.swift
//  
//
//  Created by Alex Fish on 10/01/2015.
//
//

import UIKit

typealias AttributeName     = String
typealias AttributeValue    = AnyObject
typealias StringStyle       = NSAttributedString -> NSAttributedString

let EmptyRange              = NSMakeRange(NSNotFound, 0)

func underline(style: NSUnderlineStyle, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSUnderlineStyleAttributeName, style.rawValue, range)(string)
    }
}

func foregroundColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSForegroundColorAttributeName, color, range)(string)
    }
}

func backgroundColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSBackgroundColorAttributeName, color, range)(string)
    }
}

func underlineColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSUnderlineColorAttributeName, color, range)(string)
    }
}

func link(url: NSURL, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSLinkAttributeName, url, range)(string)
    }
}

func paragraph(style: NSParagraphStyle, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSParagraphStyleAttributeName, style, range)(string)
    }
}

func kern(points: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSKernAttributeName, points, range)(string)
    }
}

func baseline(offset: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
    return { string in
        return apply(NSBaselineOffsetAttributeName, offset, range)(string)
    }
}

func apply(name: AttributeName, value: AttributeValue, var range: NSRange) -> StringStyle {
    return { string in
        if range.location == NSNotFound {
            range = NSMakeRange(0, string.length)
        }

        let attributedString = NSMutableAttributedString(attributedString: string)
        attributedString.addAttribute(name, value: value, range: range)

        return attributedString
    }
}

infix operator >>> { associativity left }
func >>> (style1: StringStyle, style2: StringStyle) -> StringStyle {
    return { string in
        style2(style1(string))
    }
}

func combine(styles: StringStyle...) -> StringStyle {
    var combined = styles.first!

    for style in styles {
        combined = combined >>> style
    }

    return combined
}
