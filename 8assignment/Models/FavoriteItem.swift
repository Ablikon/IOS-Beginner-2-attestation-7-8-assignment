import UIKit

struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageURL: String // Unsplash URL
    let description: String
    let rating: Double
    let year: String
    
    var placeholderImage: UIImage? {
        return UIImage(systemName: "photo.fill")
    }
}

enum FavoriteCategory: Int, CaseIterable {
    case movies = 0
    case music = 1
    case books = 2
    case courses = 3
    
    var title: String {
        switch self {
        case .movies: return "Movies"
        case .music: return "Music"
        case .books: return "Books"
        case .courses: return "Courses"
        }
    }
    
    var icon: String {
        switch self {
        case .movies: return "film.fill"
        case .music: return "music.note.list"
        case .books: return "book.fill"
        case .courses: return "graduationcap.fill"
        }
    }
    
    var emoji: String {
        switch self {
        case .movies: return "🎬"
        case .music: return "🎵"
        case .books: return "📚"
        case .courses: return "🎓"
        }
    }
    
    var color: UIColor {
        switch self {
        case .movies: return UIColor.systemRed
        case .music: return UIColor.systemPurple
        case .books: return UIColor.systemOrange
        case .courses: return UIColor.systemBlue
        }
    }
}
