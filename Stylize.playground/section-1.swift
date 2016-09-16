// Playground - noun: a place where people can play

import Stylize

let foregroundStyle = Stylize.foreground(UIColor.red)
let kernStyle       = Stylize.kern(5)
let style           = Stylize.compose(foregroundStyle, kernStyle)

let label   = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
let string  = NSAttributedString(string: "Hello World")

label.attributedText = style(string)
