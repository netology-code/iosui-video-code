import UIKit

class ResponderViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var redView: UIView = { [unowned self] in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemRed
        
        let tapRed = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapRed)
        )
        view.addGestureRecognizer(tapRed)
        
        return view
    }()
    
    private lazy var greenView: UIView = { [unowned self] in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemGreen
        
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Responder chain"
        view.backgroundColor = .systemBackground
        view.isUserInteractionEnabled = true
        
        view.addSubview(redView)
        redView.addSubview(greenView)
        greenView.addSubview(blueView)
        
        setupContraints()
        setupActions()
    }
    
    // MARK: - Actions
    
    @objc private func didTapRoot() {
        print("Did tap Root")
    }
    
    @objc private func didTapRed() {
        print("Did tap Red")
    }
    
    // MARK: - Private
    
    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapRoot)
        )
        view.addGestureRecognizer(tapRoot)
    }
    
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalToConstant: 300.0),
            redView.widthAnchor.constraint(equalToConstant: 300.0),
            redView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            
            greenView.heightAnchor.constraint(equalToConstant: 150.0),
            greenView.widthAnchor.constraint(equalToConstant: 150.0),
            greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            greenView.centerYAnchor.constraint(equalTo: redView.centerYAnchor),
            
            blueView.heightAnchor.constraint(equalToConstant: 75.0),
            blueView.widthAnchor.constraint(equalToConstant: 75.0),
            blueView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            blueView.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
        ])
    }
}

