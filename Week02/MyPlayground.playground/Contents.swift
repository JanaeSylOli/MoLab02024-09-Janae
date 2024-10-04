import UIKit
import PlaygroundSupport

let kittenAscii = """
     /\\_/\\  
    ( o.o ) 
     > ^ <
"""

let kitten = UILabel()
kitten.font = UIFont(name: "Courier", size: 32)
kitten.text = kittenAscii
kitten.numberOfLines = 0
kitten.sizeToFit()

PlaygroundPage.current.liveView = kitten
