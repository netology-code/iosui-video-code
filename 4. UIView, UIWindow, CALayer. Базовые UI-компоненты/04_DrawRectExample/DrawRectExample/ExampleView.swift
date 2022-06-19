import UIKit

class ExampleView: UIView {

    override func draw(_ rect: CGRect) {
        let height = rect.height
        let width = rect.width
        let color: UIColor = .systemYellow
        
        let drect = CGRect(
            x: (width * 0.25),
            y: (height * 0.25),
            width: (width * 0.5),
            height: (height * 0.5)
        )
        let bpath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
}
