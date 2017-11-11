//: Playground - noun: a place where people can play

import UIKit
import HansonExtensionKit

let color = UIColor.hsExt.color(rgba: "#1782d0")


let time = Date.hsExt.getTimeAgoString("20171103133522")

let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
view.backgroundColor = UIColor.cyan
view.hsExt.maskCorner(byRoundingCorners: [.bottomLeft, .topLeft], radii: 10)
