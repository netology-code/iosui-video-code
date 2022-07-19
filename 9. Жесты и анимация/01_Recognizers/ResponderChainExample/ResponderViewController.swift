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
        tapRed.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRed)
        
        return view
    }()
    
    private lazy var greenView: UIView = { [unowned self] in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemGreen
        
        let rightSwipeGesture = UISwipeGestureRecognizer(
            target: self,
            action: #selector(didRightSwipedGreen(gesture:))
        )
        rightSwipeGesture.direction = .right
        view.addGestureRecognizer(rightSwipeGesture)
        
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
        
        title = "Gesture Recognizers"
        view.backgroundColor = .systemBackground
        view.isUserInteractionEnabled = true
        
        view.addSubview(redView)
        redView.addSubview(greenView)
        greenView.addSubview(blueView)
        
        setupContraints()
        setupActions()
    }
    
    // MARK: - Actions
    
    @objc private func didLongPressRoot(gesture: UIGestureRecognizer) {
        if gesture.state == .ended {
            print("Did long press Root")
        }
    }
    
    @objc private func didTapRed() {
        print("Did tap Red")
    }
    
    @objc private func didRightSwipedGreen(gesture: UIGestureRecognizer) {
        print("Did right swipe Green")
    }
    
    // MARK: - Private
    
    private func setupActions() {
        let longPressRoot = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressRoot(gesture:))
        )
        longPressRoot.minimumPressDuration = 1.0
        view.addGestureRecognizer(longPressRoot)
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

