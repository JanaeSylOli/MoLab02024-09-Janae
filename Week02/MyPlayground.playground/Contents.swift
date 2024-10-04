//Janae Sylvester Oliver
// 10.02.2024
// Ascii kitten


import UIKit
import PlaygroundSupport

let kittenAscii = """
     /\\_/\\  
    ( o.o ) 
     > ^ <
"""

let label = UILabel()
label.font = UIFont(name: "Courier", size: 32)
label.text = kittenAscii
label.numberOfLines = 0
label.sizeToFit()


PlaygroundPage.current.liveView = label


