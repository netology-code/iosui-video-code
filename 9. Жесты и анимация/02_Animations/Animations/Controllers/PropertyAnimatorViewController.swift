import UIKit

class PropertyAnimatorViewController: UIViewController {
    
    // MARK: - Subviews
    
    private let animatedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemIndigo
        
        return view
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        launchAnimationExample()
    }
    
    // MARK: - Private
    
    private func setupView() {
        title = "UIViewPropertyAnimator"
        view.backgroundColor = .systemGray3
        
        tabBarItem = UITabBarItem(
            title: "UIViewPropertyAnimator",
            image: UIImage(systemName: "square.and.pencil"),
            tag: 3
        )
    }
    
    private func setupSubviews() {
        view.addSubview(animatedView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            animatedView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 50.0
            ),
            animatedView.widthAnchor.constraint(
                equalToConstant: 100.0
            ),
            animatedView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 50.0
            ),
            animatedView.heightAnchor.constraint(
                equalToConstant: 100.0
            ),
        ])
    }
    
    private func launchAnimationExample() {
        let centerOrigin = animatedView.center
        
        let animator = UIViewPropertyAnimator(
            duration: 2.5,
            curve: .linear
        ) {
            self.animatedView.center = CGPoint(
                x: 2.0 * centerOrigin.x,
                y: 2.0 * centerOrigin.y
            )
        }
        
        animator.addCompletion { finishedPosition in
            print("Did finish UIViewPropertyAnimator example")
        }
        
        animator.startAnimation(afterDelay: 1.0)
    }
}
