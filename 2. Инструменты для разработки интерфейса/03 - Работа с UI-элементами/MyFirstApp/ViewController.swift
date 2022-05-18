import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton.setTitle("Закрыть", for: .normal)
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        imageView.image = UIImage.init(named: "Closed")
        actionButton.setTitle("Открыть", for: .normal)
    }
    
}

