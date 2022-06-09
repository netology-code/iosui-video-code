import UIKit

class Feed: UIViewController {
    
    private var field: FieldView {
        
        let view = Bundle.main.loadNibNamed(
            "Field",
            owner: nil,
            options: nil
        )?.first as! FieldView
        
        view.frame = CGRect(x: 100.0, y: 100.0, width: 150.0, height: 200.0)
        
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        
        view.addSubview(field)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
