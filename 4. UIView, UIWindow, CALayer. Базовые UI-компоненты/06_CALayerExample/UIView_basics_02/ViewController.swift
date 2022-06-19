import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let orangeView = Bundle.main.loadNibNamed(
            "TestView",
            owner: nil,
            options: nil
        )?.first as? UIView {
            orangeView.frame = CGRect(
                x: 100.0,
                y: 200.0,
                width: 200.0,
                height: 100.0
            )
            orangeView.layer.cornerRadius = 20.0
            
            orangeView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
            orangeView.layer.shadowOpacity = 0.7
            orangeView.layer.shadowRadius = 5.0
            orangeView.layer.shadowColor = UIColor.systemRed.cgColor

            orangeView.layer.borderColor = UIColor.systemBlue.cgColor
            orangeView.layer.borderWidth = 3
            
            orangeView.layer.contents = UIImage(named: "cat")?.cgImage
            orangeView.layer.contentsGravity = .resizeAspect
            orangeView.layer.masksToBounds = true
            
            orangeView.layer.backgroundColor = UIColor.systemYellow.cgColor
            orangeView.layer.opacity = 0.5
            
            // Create a new layer
            let sublayer = CALayer()

            // Configure the sublayer
            sublayer.backgroundColor = UIColor.red.cgColor
            sublayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            sublayer.shadowRadius = 5.0
            sublayer.shadowOpacity = 0.8
            sublayer.frame = CGRect(x: 10, y: 10, width: 100, height: 100)

            orangeView.layer.addSublayer(sublayer)
            
            orangeView.clipsToBounds = false
            
            view.addSubview(orangeView)
        }
    }
}

