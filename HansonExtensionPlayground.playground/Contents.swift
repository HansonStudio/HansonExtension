//: Playground - noun: a place where people can play

import UIKit
import HansonExtensionKit

let color = UIColor.hsExt.color(rgba: "#1782d0")


let time = Date.hsExt.getTimeAgoString("20171103133522")

let view = UIView()
view.backgroundColor = UIColor.blue
view.hsExt.maskCorner(byRoundingCorners: .allCorners, radii: 10)
