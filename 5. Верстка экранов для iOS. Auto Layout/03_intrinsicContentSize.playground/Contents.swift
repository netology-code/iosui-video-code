import UIKit
import PlaygroundSupport

final class RoundContainer: UIView {

    var cornerRadius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(
            width: cornerRadius * 2, // UIView.noIntrinsicMetric
            height: cornerRadius * 2 // UIView.noIntrinsicMetric
        )
    }
}

final class MyViewController: UIViewController {
    
    weak var titleLabel: UILabel!
    weak var roundContainter: RoundContainer!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        // Label

        let label = UILabel()
        label.backgroundColor = .systemRed
        label.text = "Hello World!"
        label.textColor = .lightText
        label.translatesAutoresizingMaskIntoConstraints = false
        titleLabel = label
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            label.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
        ])
        
        // Container
        
        let container = RoundContainer()
        container.backgroundColor = .systemBlue
        container.cornerRadius = 40.0
        container.translatesAutoresizingMaskIntoConstraints = false
        
        roundContainter = container
                
        view.addSubview(container)
                
        NSLayoutConstraint.activate([
           container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           container.topAnchor.constraint(equalTo: label.bottomAnchor)
        ])
        
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("view intrinsic content size: \(view.intrinsicContentSize)")
        print("titleLabel intrinsic content size: \(titleLabel.intrinsicContentSize)")
        print("RoundContainer intrinsic content size: \(roundContainter.intrinsicContentSize)")
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = MyViewController()
