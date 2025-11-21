import UIKit

// MARK: - Movies View Controller
class MoviesViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .movies
        super.viewDidLoad()
    }
}

// MARK: - Music View Controller
class MusicViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .music
        super.viewDidLoad()
    }
}

// MARK: - Books View Controller
class BooksViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .books
        super.viewDidLoad()
    }
}

// MARK: - Courses View Controller
class CoursesViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .courses
        super.viewDidLoad()
    }
}
