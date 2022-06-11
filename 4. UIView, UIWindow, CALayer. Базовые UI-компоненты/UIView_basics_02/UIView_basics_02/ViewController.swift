import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let orangeView = Bundle.main.loadNibNamed(
            "TestView",
            owner: nil,
            options: nil
        )?.first as? TestView {
            orangeView.frame = CGRect(
                x: 100.0,
                y: 200.0,
                width: 200.0,
                height: 100.0
            )
            view.addSubview(orangeView)
        }
    }
}
