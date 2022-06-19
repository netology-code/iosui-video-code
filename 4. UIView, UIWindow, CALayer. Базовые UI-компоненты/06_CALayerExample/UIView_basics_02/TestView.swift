import UIKit

class TestView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        ctx.setStrokeColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: 1.0
        )
        
        let rectangle = CGRect(
            x: 10.0,
            y: 10.0,
            width: 50.0,
            height: 50.0
        )
        ctx.stroke(rectangle)
    }
}
