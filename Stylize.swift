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

func underline(style: NSUnderlineStyle) -> StringStyle {
    return { string in
        return apply(NSUnderlineColorAttributeName, style.rawValue)(string)
    }
}

func foregroundColor(color: UIColor) -> StringStyle {
    return { string in
        return apply(NSForegroundColorAttributeName, color)(string)
    }
}

func backgroundColor(color: UIColor) -> StringStyle {
    return { string in
        return apply(NSBackgroundColorAttributeName, color)(string)
    }
}

func apply(name: AttributeName, value: AttributeValue) -> StringStyle {
    return { string in
        let attributedString = NSMutableAttributedString(attributedString: string)
        attributedString.addAttribute(name, value: value, range: NSMakeRange(0, string.length))

        return attributedString
    }
}

infix operator >>> { associativity left }
func >>> (style1: StringStyle, style2: StringStyle) -> StringStyle {
    return { string in style2(style1(string)) }
}