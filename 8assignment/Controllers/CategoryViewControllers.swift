import UIKit

class MoviesViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .movies
        super.viewDidLoad()
    }
}
class MusicViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .music
        super.viewDidLoad()
    }
}

class BooksViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .books
        super.viewDidLoad()
    }
}


class CoursesViewController: FavoritesViewController {
    override func viewDidLoad() {
        category = .courses
        super.viewDidLoad()
    }
}
