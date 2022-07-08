import UIKit

class CAAnimationsViewController: UIViewController {
    
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
        title = "CAAnimation"
        view.backgroundColor = .systemBackground
        
        tabBarItem = UITabBarItem(
            title: "CAAnimation",
            image: UIImage(systemName: "rectangle.on.rectangle"),
            tag: 2
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
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            print("Did finish CAAnimation example")
        }
        
        let animationPosition = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animationPosition.toValue = CGPoint(
            x: 2.0 * centerOrigin.x,
            y: 2.0 * centerOrigin.y
        )
        animationPosition.duration = 2.5
        animationPosition.autoreverses = true
        animationPosition.isRemovedOnCompletion = false
        animationPosition.repeatCount = Float.infinity
        animationPosition.delegate = self
        animatedView.layer.add(animationPosition, forKey: #keyPath(CALayer.position))
        
        let rotateAnimation = CASpringAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi
        rotateAnimation.duration = 2.5
        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        rotateAnimation.autoreverses = true
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.repeatCount = Float.infinity
        animatedView.layer.add(rotateAnimation, forKey: #keyPath(CALayer.transform))
        
        CATransaction.commit()
    }
}

extension CAAnimationsViewController: CAAnimationDelegate {

    func animationDidStart(
        _ anim: CAAnimation
    ) {
        print("Did start CAAnimation example")
    }
    
    func animationDidStop(
        _ animation: CAAnimation,
        finished flag: Bool
    ) {
        print("Did finish CAAnimation example")
    }
}
