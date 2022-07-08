import UIKit

class ViewAnimationsController: UIViewController {
    
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
        title = "UIView.animate()"
        view.backgroundColor = .systemBrown
        
        tabBarItem = UITabBarItem(
            title: "UIView",
            image: UIImage(systemName: "display"),
            tag: 0
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
        
        UIView.animate(
            withDuration: 5.0,
            delay: 2.0,
            options: .curveLinear
        ) {
            self.animatedView.center = CGPoint(
                x: 2.0 * centerOrigin.x,
                y: 2.0 * centerOrigin.y
            )
            self.animatedView.backgroundColor = .systemPink
        } completion: { finished in
            print("Did finish UIView.animate() example")
        }
    }
}
