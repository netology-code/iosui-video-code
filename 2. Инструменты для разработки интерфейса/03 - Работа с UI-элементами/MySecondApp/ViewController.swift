import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func buttonTouched(_ sender: UIButton) {
        
        imageView.image = UIImage(named: "Closed")
        button.setTitle("Открыть", for: .normal)
    }
    
}

