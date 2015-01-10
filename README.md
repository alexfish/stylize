# stylize

A funcitonal wrapper of NSAttributedString for easy string styling

## Why does NSAttributedString need a wrapper?

Styling strings with NSAttributedString requires a lot of painful and ugly boiler plate code, for example changing the color of a string and underlining it requires:

```
let string = NSAttributedString(string: "Hello", attributes: [NSForegroundColorAttributeName: UIColor.redColor(), NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle])
```

Ouch!

This quickly builds into a giant chunk of code that is a pain to read and maintain. Using stylize our code looks like this:

```
let string        = NSAttributedString(string: "Hello World")
let style         = foregroundColor(UIColor.redColor()) >>> underline(NSUnderlineStyle.StyleSingle)
let styledString  = style(string)
```

That's better.

## Integration

To manually install stylize simply drag `Stylize.swift` into your project tree.

## Usage

```
let string        = NSAttributedString(string: "Hello World")
let style         = foregroundColor(UIColor.redColor())
let styledString  = style(string)
```

### Chaining Styles

stylize uses operating overloading to expose the `>>>` operator to chain styles together

```
let string        = NSAttributedString(string: "Hello World")
let style         = foregroundColor(UIColor.redColor()) >>> backgroundColor(UIColor.orangeColor()) >>> underline(NSUnderlineStyle.StyleSingle)
let styledString  = style(string)
```

