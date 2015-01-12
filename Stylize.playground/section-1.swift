// Playground - noun: a place where people can play

import Stylize

let foregroundStyle = Stylize.foregroundColor(UIColor.redColor())
let kernStyle       = Stylize.kern(5)
let style           = Stylize.compose(foregroundStyle, kernStyle)

let label   = UILabel(frame: CGRectMake(0, 0, 400, 50))
let string  = NSAttributedString(string: "Hello World")

label.attributedText = style(string)
