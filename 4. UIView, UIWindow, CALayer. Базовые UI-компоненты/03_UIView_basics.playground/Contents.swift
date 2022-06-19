import UIKit
import PlaygroundSupport

let view = UIView(
    frame: CGRect(
        x: 100,
        y: 100,
        width: 300,
        height: 300
    )
)
view.backgroundColor = .systemYellow

print("View:\nFrame: \(view.frame)\nBounds: \(view.bounds)\nCenter: \(view.center)")
print("-------------------")

view.bounds = CGRect(
    x: 0,
    y: 0,
    width: 350,
    height: 350
)
print("View:\nFrame: \(view.frame)\nBounds: \(view.bounds)\nCenter: \(view.center)")

PlaygroundPage.current.liveView = view
