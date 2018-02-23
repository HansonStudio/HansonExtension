//: Playground - noun: a place where people can play

import UIKit
import HansonExtensionKit

let color = UIColor.hsExt.color(rgba: "#1782d0")
let color2 = UIColor.hsExt.color(netHex: 0xff6262, alpha: 0.5)

let time = Date.hsExt.getTimeAgoString("20171103133522")

let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
view.backgroundColor = UIColor.cyan
view.hsExt.maskCorner(byRoundingCorners: [.bottomLeft, .topLeft], radii: 10)

let d = 10000000.0
d.hsExt.toNumberFormat(maxDecimal: 2)

//let alert = UIAlertAction(title: "ceshi", style: UIAlertActionStyle.default, handler: nil)
//alert.addAction(.cancel)

let test = "hello world"
test.hsExt.md5
//test.hsExt.toMd5HexCode
//test.hsExt.MD5String()


