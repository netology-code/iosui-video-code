import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let favouritesViewController = ViewController()
        favouritesViewController.title = "Избранное"
        favouritesViewController.view.backgroundColor = .systemOrange
        
        let downloadsViewController = ViewController()
        downloadsViewController.title = "Загрузки"
        downloadsViewController.view.backgroundColor = .systemYellow
        
        let historyViewController = ViewController()
        historyViewController.title = "История"
        historyViewController.view.backgroundColor = .systemBackground
        
        let tabBarController = UITabBarController()
        
        favouritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        downloadsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        historyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        let controllers = [favouritesViewController, downloadsViewController, historyViewController]
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        tabBarController.selectedIndex = 1
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
