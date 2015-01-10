//
//  ViewController.swift
//  StylizeExample
//
//  Created by Alex Fish on 10/01/2015.
//  Copyright (c) 2015 alexefish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        let foregroundStyle  = foregroundColor(UIColor.redColor())
        let backgroundStyle  = backgroundColor(UIColor.greenColor(), range: NSMakeRange(0, 5))
        let backgroundStyle2 = backgroundColor(UIColor.purpleColor(), range: NSMakeRange(6, 5))
        let style            = foregroundStyle >>> backgroundStyle >>> backgroundStyle2

        let string = NSAttributedString(string: "Hello World")
        label?.attributedText = style(string)
    }
}

