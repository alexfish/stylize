# stylize

[![Build Status](https://travis-ci.org/alexfish/stylize.svg)](https://travis-ci.org/alexfish/stylize)

A funcitonal wrapper of NSAttributedString for easy string styling

## Why does NSAttributedString need a wrapper?

Styling strings with NSAttributedString requires a lot of painful and ugly boiler plate code, for example changing the color of a subsstring and underlining it requires:

```swift
let string = NSMutableAttributedString(string: "Hello")
string.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 5))
string.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, string.length))
```

Ouch!

This quickly builds into a giant chunk of code that is a pain to read and maintain. Using stylize our code looks like this:

```swift
let string          = NSAttributedString(string: "Hello World")
let foregroundStyle = Stylize.foregroundColor(UIColor.redColor(), range: NSMakeRange(0, 5))
let underlineStyle  = Stylize.underline(NSUnderlineStyle.StyleSingle)
let style           = Stylize.combine(foregroundStyle, underlineStyle)

let styledString    = style(string)
```

That's better.

## Integration

To manually install stylize simply drag `Stylize.swift` into your project tree.

## Usage

```swift
let string        = NSAttributedString(string: "Hello World")
let style         = Stylize.foregroundColor(UIColor.redColor())
let styledString  = style(string)
```

#### Substrings

By default styles will be applied to the entire string, if you need to apply a style to a subsstring an optional `range` paramater is available for each style:

```swift
let string        = NSAttributedString(string: "Hello World")
let style         = Stylize.foregroundColor(UIColor.redColor(), range: NSMakeRange(0, 5))
let styledString  = style(string)
```

#### Combining Styles

stylize has a `combine` function that can combine any number of styles into one:

```swift
let string          = NSAttributedString(string: "Hello World")
let foregroundStyle = Stylize.foregroundColor(UIColor.redColor())
let backgroundStyle = Stylize.backgroundColor(UIColor.orangeColor())
let underlineStyle  = Stylize.underline(NSUnderlineStyle.StyleSingle)

let style           = Stylize.combine(foregroundStyle, backgroundStyle, underlineStyle)
let styledString    = style(string)
```

