//
//  Stylize.swift
//  
//
//  Created by Alex Fish on 10/01/2015.
//
//

import UIKit

public typealias AttributeName     = String
public typealias AttributeValue    = AnyObject
public typealias StringStyle       = NSAttributedString -> NSAttributedString

let EmptyRange = NSMakeRange(NSNotFound, 0)

public class Stylize {

    public class func underline(style: NSUnderlineStyle, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSUnderlineStyleAttributeName, value: style.rawValue, range: range)(string)
        }
    }

    public class func foregroundColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSForegroundColorAttributeName, value: color, range: range)(string)
        }
    }

    public class func backgroundColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSBackgroundColorAttributeName, value: color, range: range)(string)
        }
    }

    public class func underlineColor(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSUnderlineColorAttributeName, value: color, range: range)(string)
        }
    }

    public class func link(url: NSURL, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSLinkAttributeName, value: url, range: range)(string)
        }
    }

    public class func paragraph(style: NSParagraphStyle, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSParagraphStyleAttributeName, value: style, range: range)(string)
        }
    }

    public class func kern(points: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSKernAttributeName, value: points, range: range)(string)
        }
    }

    public class func baseline(offset: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return Stylize.apply(NSBaselineOffsetAttributeName, value: offset, range: range)(string)
        }
    }

    public class func combine(styles: StringStyle...) -> StringStyle {
        var combined = styles.first!
        
        for style in styles {
            combined = combined >>> style
        }
        
        return combined
    }

    private class func apply(name: AttributeName, value: AttributeValue, var range: NSRange) -> StringStyle {
        return { string in
            if range.location == NSNotFound {
                range = NSMakeRange(0, string.length)
            }

            let attributedString = NSMutableAttributedString(attributedString: string)
            attributedString.addAttribute(name, value: value, range: range)

            return attributedString
        }
    }
}

infix operator >>> { associativity left }
func >>> (style1: StringStyle, style2: StringStyle) -> StringStyle {
    return { string in
        style2(style1(string))
    }
}
