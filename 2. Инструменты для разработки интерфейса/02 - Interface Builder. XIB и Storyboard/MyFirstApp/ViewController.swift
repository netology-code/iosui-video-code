import UIKit

class ViewController: UIViewController {
    
    private lazy var myView: MyFirstView = {
        let view = Bundle.main.loadNibNamed(
            "MyFirstView",
            owner: nil,
            options: nil
        )?.first as! MyFirstView
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(myView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        myView.frame = CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y,
            width: 200,
            height: 200
        )
    }

}

