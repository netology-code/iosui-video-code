import UIKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        
        return view
    }()
        
    private lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        
        return view
    }()
        
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0.0
            
        stackView.addArrangedSubview(self.view1)
        stackView.addArrangedSubview(self.view2)
        
        return stackView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        
        setupContraints()
    }
    
    // MARK: - Private
    
    private func setupContraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 20.0
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -20.0
            ),
            stackView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 16.0
            ),
            stackView.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor,
                constant: -16.0
            ),
        ])
    }
}
