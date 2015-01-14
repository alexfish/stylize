# stylize

[![Build Status](https://travis-ci.org/alexfish/stylize.svg)](https://travis-ci.org/alexfish/stylize)

A funcitonal wrapper of NSAttributedString for easy string styling

## Contents

* [Why does NSAttributedString need a wrapper?](#why-does-nsattributedstring-need-a-wrapper)
* [Integration](#integration)
    * [Carthage](#carthage)
    * [Manual](#manual)
        * [iOS 8+](#ios-8)
        * [iOS 7+](#ios-7)
* [Usage](#usage)
    * [Substrings](#substrings)
    * [Composing Styles](#composing-styles)
* [Available Attributes](#available-attributes)

## Why does NSAttributedString need a wrapper?

Styling strings with NSAttributedString requires a lot of painful and ugly boiler plate code, for example changing the color of a subsstring and underlining it requires:

```swift
let string = NSMutableAttributedString(string: "Hello")
string.addAttribute(NSforegroundAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 5))
string.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, string.length))
```

Ouch!

This quickly builds into a giant chunk of code that is a pain to read and maintain. Using stylize our code looks like this:

```swift
let string          = NSAttributedString(string: "Hello World")
let foregroundStyle = Stylize.foreground(UIColor.redColor(), range: NSMakeRange(0, 5))
let underlineStyle  = Stylize.underline(NSUnderlineStyle.StyleSingle)
let style           = Stylize.compose(foregroundStyle, underlineStyle)

let styledString    = style(string)
```

That's better.

## Integration

### Carthage

Add `github "alexfish/stylize"` to your `Cartfile`

### Manual

#### iOS 8+
1. Add Stylize to you project as a submodule using `git submodule add https://github.com/alexfish/stylize.git`
2. Open the `Stylize` folder & drag `Stylize.xcodeproj` into your project tree
3. Add `Stylize.framework` to your target's `Link Binary with Libraries` Build Phase
4. Import Stylize with `import Stylize` and you're ready to go

#### iOS 7+
To manually install Stylize, download this repository and drag `Stylize.swift` into your project tree.

## Usage

```swift
let string        = NSAttributedString(string: "Hello World")
let style         = Stylize.foreground(UIColor.redColor())
let styledString  = style(string)
```

#### Substrings

By default styles will be applied to the entire string, if you need to apply a style to a subsstring an optional `range` paramater is available for each style:

```swift
let string        = NSAttributedString(string: "Hello World")
let style         = Stylize.foreground(UIColor.redColor(), range: NSMakeRange(0, 5))
let styledString  = style(string)
```

#### Composing Styles

stylize has a `compose` function that can compose a style from multiple styles

```swift
let string          = NSAttributedString(string: "Hello World")
let foregroundStyle = Stylize.foreground(UIColor.redColor())
let backgroundStyle = Stylize.background(UIColor.orangeColor())
let underlineStyle  = Stylize.underline(NSUnderlineStyle.StyleSingle)

let style           = Stylize.compose(foregroundStyle, backgroundStyle, underlineStyle)
let styledString    = style(string)
```

## Available Attributes

| Attribute  | Function |
| ------------- | ------------- |
| NSUnderlineStyleAttributeName  | `underline(style: NSUnderlineStyle)`  |
| NSUnderlineColorAttributeName | `underline(color: UIColor)` |
| NSForegroundColorAttributeName | `foreground(color: UIColor)` |
| NSBackgroundColorAttributeName | `background(color: UIColor` |
| NSStrikethroughStyleAttributeName  | `strikethrough(style: NSUnderlineStyle)`  |
| NSStrikethroughColorAttributeName | `strikethrough(color: UIColor)` |
| NSLinkAttributeName | `link(url: NSURL)` |
| NSParagraphStyleAttributeName | `paragraph(style: NSParagraphStyle)` |
| NSKernAttributeName | `kern(points: NSNumber)` |
| NSBaselineOffsetAttributeName | `baseline(offset: NSNumber)` |
| NSShadowAttributeName | `shadow(shadow: NSShadow)` |
| NSStrokeWidthAttributeName| `stroke(width: NSNumber)` |
| NSStrokeColorAttributeName | `stroke(color: UIColor)` |
| NSTextEffectAttributeName | `letterpress()` |
| NSFontAttributeName | `font(font: UIFont)` |
