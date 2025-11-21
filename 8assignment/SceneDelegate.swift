import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        
        let moviesVC = MoviesViewController()
        let musicVC = MusicViewController()
        let booksVC = BooksViewController()
        let coursesVC = CoursesViewController()
        
        let moviesNav = createNavController(for: moviesVC, title: "Movies", icon: "film.fill", color: .systemRed)
        let musicNav = createNavController(for: musicVC, title: "Music", icon: "music.note.list", color: .systemPurple)
        let booksNav = createNavController(for: booksVC, title: "Books", icon: "book.fill", color: .systemOrange)
        let coursesNav = createNavController(for: coursesVC, title: "Courses", icon: "graduationcap.fill", color: .systemBlue)
        
        tabBarController.viewControllers = [moviesNav, musicNav, booksNav, coursesNav]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String, icon: String, color: UIColor) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: icon)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = color
        return navController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

