//
//  Stylize.swift
//  
//
//  Created by Alex Fish on 10/01/2015.
//
//

import UIKit

/// Helpers
public typealias AttributeName     = String
public typealias AttributeValue    = AnyObject
public typealias StringStyle       = NSAttributedString -> NSAttributedString

/**
Writing direction for NSWritingDirectionAttributeName

- LeftToRightEmbedding: NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding
- RightToLeftEmbedding: NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding
- LeftToRightOverride:  NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride
- RightToLeftOverride:  NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride
*/
public enum WritingDirection: NSNumber {
    case LeftToRightEmbedding   = 0
    case RightToLeftEmbedding   = 1
    case LeftToRightOverride    = 2
    case RightToLeftOverride    = 3
}

/// An empty range with no location
let EmptyRange = NSMakeRange(NSNotFound, 0)

/**
*  Easy attributed strings
*/
public class Stylize {

    // MARK: Styles

    /**
    Creates a function that will underline an attributed string

    :param: style The NSUnderlineStyle to use when underlining
    :param: range Optional range of the underline, an invalid range will result in the
                  entire string being underlined

    :returns: Function that can be called to underline an attributed string
    */
    public class func underline(style: NSUnderlineStyle, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSUnderlineStyleAttributeName, value: style.rawValue, range: range)(string)
        }
    }

    /**
    Creates a function that will strikethrough an attributed string

    :param: style The NSUnderlineStyle to strikethrough with
    :param: range Optional range of the strikethrough, an invalid range will result in the
    entire string being striked through

    :returns: Function that can be called to strikthrough an attributed string
    */
    public class func strikethrough(style: NSUnderlineStyle, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSStrikethroughStyleAttributeName, value: style.rawValue, range: range)(string)
        }
    }

    /**
    Creates a function that will change the foreground color of an attributed string

    :param: color The UIColor to use when styling a string
    :param: range Optional range of the color, an invalid range will result in the
                  entire string being colored

    :returns: Function that can be called to change the foreground color of an attributed string
    */
    public class func foreground(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSForegroundColorAttributeName, value: color, range: range)(string)
        }
    }

    /**
    Creates a function that will change the background color of an attributed string

    :param: color The UIColor to use when styling the string
    :param: range Optional range of the color, an invalid range will result in the
                  entire string being colored

    :returns: Function that can be called to change the background color of an attributed string
    */
    public class func background(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSBackgroundColorAttributeName, value: color, range: range)(string)
        }
    }

    /**
    Creates a function that will change the underline color of an attributed string

    :param: color The UIColor to use when styling the string
    :param: range Optional range of the color, an invalid range will result in the
                  entire string underline being colored

    :returns: Function that can be called to change the underline color of an attributed string
    */
    public class func underline(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSUnderlineColorAttributeName, value: color, range: range)(string)
        }
    }

    /**
    Creates a function that will change the strikethrough color of an attributed string

    :param: color The UIColor to use when styling the string
    :param: range Optional range of the color, an invalid range will result in the
    entire string strikethrough being colored

    :returns: Function that can be called to change the strikethrough color of an attributed string
    */
    public class func strikethrough(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSStrikethroughColorAttributeName, value: color, range: range)(string)
        }
    }

    /**
    Creates a function that will create a ink within an attributed string

    :param: url   The URL to link with
    :param: range Optional range of the link, an invalid range will result in the
                  entire string being linked

    :returns: Function that can be called to create a link with an attributed string
    */
    public class func link(url: NSURL, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSLinkAttributeName, value: url, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a paragraph style to an attributed string

    :param: style The paragraph style to style the string with
    :param: range Optional range of the paragraph style, an invalid range will result in the
                  entire string being styled

    :returns: Function that can be called to style an attributed string with a paragraph style
    */
    public class func paragraph(style: NSParagraphStyle, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSParagraphStyleAttributeName, value: style, range: range)(string)
        }
    }

    /**
    Creates a function that will alter the kern of an attributed string

    :param: points The amount of points to kern per character
    :param: range Optional range of the kern, an invalid range will result in the
                  entire string being kerned by the amount of points

    :returns: Function that can be called to alter the kern of an attributed string
    */
    public class func kern(points: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSKernAttributeName, value: points, range: range)(string)
        }
    }

    /**
    Creates a function that will alter the baseline of an attributed string

    :param: offset The amount of points to offset the baseline by
    :param: range Optional range of the baseline, an invalid range will result in the
                  entire string's baseline being offset by the amount of points

    :returns: Function that can be called to alter the baseline of an attributed string
    */
    public class func baseline(offset: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSBaselineOffsetAttributeName, value: offset, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a shadow to an attributed string

    :param: shadow An NSShadow object to apply
    :param: range Optional range of the shadow, an invalid range will result
                  in the shadow being applied to the entire string

    :returns: Function that can be called to apply a shadow to an attributed string
    */
    public class func shadow(shadow: NSShadow, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSShadowAttributeName, value: shadow, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a stroke color to an attribute string

    :param: color The color to apply
    :param: range Optional range of the color, an invalid range will result
                  in the color being applied to the entire string

    :returns: Function that can be called to apply a stroke color to an attributed string
    */
    public class func stroke(color: UIColor, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSStrokeColorAttributeName, value: color, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a stroke width to an attributed string

    :param: width The stroke width to apply
    :param: range Optional range of the stroke width, an invalid range will result
                  in the stroke width being applied to the entire string

    :returns: Function that can be called to apply a stroke width to an attributed string
    */
    public class func stroke(width: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSStrokeWidthAttributeName, value: width, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a letterpress effect to an attributed string

    :param: range Optional range of the letterpress effect, an invalid range will result
                  in a letterpress effect being applied to the entire string

    :returns: Function that can be called to apply letterpress effect to an attributed string
    */
    public class func letterpress(range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSTextEffectAttributeName, value: NSTextEffectLetterpressStyle, range: range)(string)
        }
    }

    /**
    Creates a function that will apply a font to an attributed string

    :param: font  The font to apply
    :param: range Optional range of the font, an invalid range will result
                  in the font being applied to the entire string

    :returns: Function that can be called to apply a font to an attributed string
    */
    public class func font(font: UIFont, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSFontAttributeName, value: font, range: range)(string)
        }
    }

    /**
    Creates a function that will enable or disable ligatures in an attributed string

    :param: enabled true for ligatures false for none, if the font supports it
    :param: range   Optional range of the ligatures, an invalid range will result
                    in the ligatures being applied to the entire string

    :returns: Function that can be called to enable or disable ligatures in an attributed string
    */
    public class func ligatures(enabled: Bool, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSLigatureAttributeName, value: NSNumber(bool: enabled), range: range)(string)
        }
    }

    /**
    Creates a function that will alter the obliqueness of an attributed string

    :param: skew  The amount of skew to apply to glyphs
    :param: range   Optional range of the obliqueness, an invalid range will result
                    in the obliqueness being applied to the entire string

    :returns: Function that can be called to alter the obliqueness of an attributed string
    */
    public class func obliqueness(skew: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSObliquenessAttributeName, value: skew, range: range)(string)
        }
    }

    /**
    Creates a function that will attach a text attachement to an attributed string

    :param: attachement The attachement to attach
    :param: range   Optional range of the attachement, an invalid range will result
                    in the attachement being applied to the entire string

    :returns: Function that can be called to attach an attachement an attributed string
    */
    public class func attachment(attachement: NSTextAttachment, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSAttachmentAttributeName, value: attachement, range: range)(string)
        }
    }

    /**
    Creates a function that will expand an attributed string

    :param: log   The log of the expansion factor
    :param: range   Optional range of the expansion, an invalid range will result
                    in the expansion being applied to the entire string

    :returns: Function that can be called to expand an attributed string
    */
    public class func expand(log: NSNumber, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSExpansionAttributeName, value: log, range: range)(string)
        }
    }

    /**
    Creates a function that will alter the writing direction of an attributed string

    :param: direction The writing direction to apply
    :param: range     Optional range of the writing direction, an invalid range will result
                      in the writing direction being applied to the entire string

    :returns: Function that can be called to alter the writing direction of an attributed string
    */
    public class func direction(direction: WritingDirection, range: NSRange = EmptyRange) -> StringStyle {
        return { string in
            return self.apply(NSWritingDirectionAttributeName, value: direction.rawValue, range: range)(string)
        }
    }

    // MARK: Compose

    /**
    Compose multiple style functions into one function that can be used to style an attributed string

    :param: styles An unlimted number of StringStyle functions to compose

    :returns: Function that can be called to style an attributed string
    */
    public class func compose(styles: StringStyle...) -> StringStyle {
        var composed = styles.first!
        
        for style in styles {
            composed = composed >>> style
        }
        
        return composed
    }
}

// MARK: Private

extension Stylize {

    /// Create a function that applies new attributes to an attributed string
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

// MARK: Overloads

/**
*  Operator overload to compose functions with >>>
*/
infix operator >>> { associativity left }

/**
Compose a style from multiple styles that can be used to style an attributed string

:param: style1 The first style to compose with
:param: style2 The second style to compose with

:returns: Function that can be called to style an attributed string
*/
func >>> (style1: StringStyle, style2: StringStyle) -> StringStyle {
    return { string in
        style2(style1(string))
    }
}
