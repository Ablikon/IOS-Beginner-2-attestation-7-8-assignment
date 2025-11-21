import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    func getFavorites(for category: FavoriteCategory) -> [FavoriteItem] {
        switch category {
        case .movies:
            return getMovies()
        case .music:
            return getMusic()
        case .books:
            return getBooks()
        case .courses:
            return getCourses()
        }
    }
    
    private func getMovies() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "The Shawshank Redemption", subtitle: "Frank Darabont", review: "An inspiring tale of hope and friendship that never gets old. Tim Robbins and Morgan Freeman deliver unforgettable performances in this timeless masterpiece.", imageURL: "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=800", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency. A powerful story about hope, friendship, and the human spirit.", rating: 5.0, year: "1994", youtubeVideoID: "6hB3S9bIaco"),
            
            FavoriteItem(title: "Inception", subtitle: "Christopher Nolan", review: "A mind-bending masterpiece that challenges our perception of reality. Leonardo DiCaprio shines in this visually stunning and intellectually complex thriller.", imageURL: "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=800", description: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.", rating: 4.8, year: "2010", youtubeVideoID: "YoHD9XEInc0"),
            
            FavoriteItem(title: "The Dark Knight", subtitle: "Christopher Nolan", review: "Heath Ledger's Joker is iconic and unforgettable. This superhero film transcends the genre with deep themes, stellar action, and moral complexity.", imageURL: "https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=800", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests.", rating: 4.9, year: "2008", youtubeVideoID: "EXeTwQWrcwY"),
            
            FavoriteItem(title: "Interstellar", subtitle: "Christopher Nolan", review: "A visually stunning space epic with incredible emotional depth. The physics are breathtaking and Hans Zimmer's score is absolutely magnificent.", imageURL: "https://images.unsplash.com/photo-1446776653964-20c1d3a81b06?w=800", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival on a dying Earth.", rating: 4.7, year: "2014", youtubeVideoID: "zSWdZVtXT7E"),
            
            FavoriteItem(title: "Pulp Fiction", subtitle: "Quentin Tarantino", review: "Revolutionary non-linear storytelling with unforgettable dialogue and characters. Tarantino at his absolute best with iconic scenes throughout.", imageURL: "https://images.unsplash.com/photo-1594908900066-3f47337549d8?w=800", description: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.", rating: 4.6, year: "1994", youtubeVideoID: "s7EdQ4FqbhY"),
            
            FavoriteItem(title: "The Matrix", subtitle: "Wachowski Sisters", review: "Groundbreaking sci-fi that changed action cinema forever. Keanu Reeves at his best with revolutionary visual effects and deep philosophy.", imageURL: "https://images.unsplash.com/photo-1574267432644-f74f8cc53af0?w=800", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", rating: 4.8, year: "1999", youtubeVideoID: "vKQi3bBA1y8"),
            
            FavoriteItem(title: "Forrest Gump", subtitle: "Robert Zemeckis", review: "Tom Hanks delivers a heartwarming performance in this touching journey through American history. A beautiful story about life, love, and destiny.", imageURL: "https://images.unsplash.com/photo-1485846234645-a62644f84728?w=800", description: "The presidencies of Kennedy and Johnson, the Vietnam War, and other historical events unfold from the perspective of an Alabama man.", rating: 4.7, year: "1994", youtubeVideoID: "bLvqoHBptjg"),
            
            FavoriteItem(title: "Fight Club", subtitle: "David Fincher", review: "A dark, twisted commentary on consumerism with an unforgettable plot twist. Edward Norton and Brad Pitt create cinema magic.", imageURL: "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=800", description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.", rating: 4.5, year: "1999", youtubeVideoID: "SUXWAEX2jlg"),
            
            FavoriteItem(title: "The Godfather", subtitle: "Francis Ford Coppola", review: "The definitive crime saga. Marlon Brando's performance is legendary and the storytelling is absolutely masterful.", imageURL: "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=800", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", rating: 5.0, year: "1972", youtubeVideoID: "sY1S34973zA"),
            
            FavoriteItem(title: "Goodfellas", subtitle: "Martin Scorsese", review: "A gripping portrayal of mob life with incredible performances and direction. Scorsese's masterpiece of crime cinema.", imageURL: "https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=800", description: "The story of Henry Hill and his life in the mob, covering his relationship with his wife and his partners in crime.", rating: 4.8, year: "1990", youtubeVideoID: "qo5jJpHtI1Y")
        ]
    }
    
    private func getMusic() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "The Dark Side of the Moon", subtitle: "Pink Floyd", review: "A concept album that explores the human experience with unparalleled artistry. Every track flows perfectly into the next creating a sonic masterpiece.", imageURL: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800", description: "Progressive rock masterpiece exploring themes of conflict, greed, time, death, and mental illness through innovative production.", rating: 5.0, year: "1973", youtubeVideoID: "HW-lXjOyUWo"),
            
            FavoriteItem(title: "Abbey Road", subtitle: "The Beatles", review: "The Beatles at their creative peak. 'Come Together' and 'Here Comes the Sun' are timeless classics that defined an era.", imageURL: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800", description: "The eleventh studio album featuring iconic medleys and innovative production techniques that changed music forever.", rating: 4.9, year: "1969", youtubeVideoID: "axb2sHpGwHQ"),
            
            FavoriteItem(title: "Thriller", subtitle: "Michael Jackson", review: "The best-selling album of all time for good reason. Pure pop perfection from start to finish with groundbreaking music videos.", imageURL: "https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?w=800", description: "Pop masterpiece that broke barriers and set new standards for music production, performance, and visual storytelling.", rating: 4.8, year: "1982", youtubeVideoID: "sOnqjkJTMaA"),
            
            FavoriteItem(title: "Rumours", subtitle: "Fleetwood Mac", review: "Born from chaos, this album captures raw emotion in every song. 'Go Your Own Way' and 'Dreams' are absolutely incredible.", imageURL: "https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=800", description: "Soft rock classic documenting the band's interpersonal conflicts during recording, resulting in deeply personal music.", rating: 4.7, year: "1977", youtubeVideoID: "6ul-cZyuYq4"),
            
            FavoriteItem(title: "Led Zeppelin IV", subtitle: "Led Zeppelin", review: "Contains 'Stairway to Heaven' - enough said. The pinnacle of rock perfection and musical excellence.", imageURL: "https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?w=800", description: "Hard rock and folk fusion featuring one of the most famous and influential rock songs ever written.", rating: 4.9, year: "1971", youtubeVideoID: "QkF3oxziUI4"),
            
            FavoriteItem(title: "Back in Black", subtitle: "AC/DC", review: "The ultimate hard rock album. A powerful tribute to Bon Scott that became legendary in its own right.", imageURL: "https://images.unsplash.com/photo-1571330735066-03aaa9429d89?w=800", description: "Hard rock masterpiece and best-selling album by any band, featuring thunderous riffs and unforgettable hooks.", rating: 4.6, year: "1980", youtubeVideoID: "pAgnJDJN4VA"),
            
            FavoriteItem(title: "The Wall", subtitle: "Pink Floyd", review: "A rock opera exploring isolation and abandonment. Ambitious, deeply moving, and sonically brilliant.", imageURL: "https://images.unsplash.com/photo-1487180144351-b8472da7d491?w=800", description: "Double album rock opera about a rock star's mental breakdown and isolation from society through metaphorical walls.", rating: 4.8, year: "1979", youtubeVideoID: "hbTeYAiaNyY"),
            
            FavoriteItem(title: "Nevermind", subtitle: "Nirvana", review: "Defined a generation. Kurt Cobain's raw energy and emotion changed music forever and brought grunge to the mainstream.", imageURL: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800", description: "Grunge masterpiece that brought alternative rock into the mainstream and became the voice of Generation X.", rating: 4.7, year: "1991", youtubeVideoID: "hTWKbfoikeg"),
            
            FavoriteItem(title: "Hotel California", subtitle: "Eagles", review: "The title track alone makes this essential. Masterful storytelling, incredible guitar work, and timeless melodies.", imageURL: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=800", description: "Soft rock perfection exploring themes of excess, loss of innocence, and the darker side of American culture.", rating: 4.6, year: "1976", youtubeVideoID: "09839DpTctU"),
            
            FavoriteItem(title: "Born to Run", subtitle: "Bruce Springsteen", review: "The Boss at his finest. Captures the spirit of youth, freedom, and the American dream perfectly.", imageURL: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800", description: "Rock anthem album about escape, hope, and the eternal search for something better beyond the horizon.", rating: 4.5, year: "1975", youtubeVideoID: "f3t9SfrfDZM")
        ]
    }
    
    private func getBooks() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "1984", subtitle: "George Orwell", review: "A chilling dystopian masterpiece that feels more relevant than ever. Orwell's vision of totalitarianism is haunting and prophetic.", imageURL: "https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=800", description: "Dystopian novel depicting a totalitarian society under constant surveillance, thought control, and propaganda.", rating: 5.0, year: "1949", youtubeVideoID: nil),
            
            FavoriteItem(title: "To Kill a Mockingbird", subtitle: "Harper Lee", review: "A powerful exploration of racism and justice through a child's innocent eyes. Atticus Finch is an iconic character of moral courage.", imageURL: "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=800", description: "Coming-of-age story addressing racial injustice in the American South through compassion and understanding.", rating: 4.9, year: "1960", youtubeVideoID: nil),
            
            FavoriteItem(title: "The Great Gatsby", subtitle: "F. Scott Fitzgerald", review: "Beautiful, lyrical prose capturing the Jazz Age. A tragic tale of love, obsession, and the American Dream.", imageURL: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800", description: "Jazz Age novel exploring themes of decadence, idealism, excess, and the corruption of the American Dream.", rating: 4.7, year: "1925", youtubeVideoID: nil),
            
            FavoriteItem(title: "Pride and Prejudice", subtitle: "Jane Austen", review: "Elizabeth Bennet is one of literature's greatest characters. Witty, romantic, and absolutely timeless.", imageURL: "https://images.unsplash.com/photo-1522407183863-c0bf2256188f?w=800", description: "Classic romance exploring manners, upbringing, morality, education, and marriage in Georgian England.", rating: 4.8, year: "1813", youtubeVideoID: nil),
            
            FavoriteItem(title: "The Catcher in the Rye", subtitle: "J.D. Salinger", review: "Holden Caulfield's voice is unforgettable and authentic. Perfectly captures teenage angst and alienation.", imageURL: "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800", description: "Coming-of-age novel following a teenager's experiences in New York City after expulsion from prep school.", rating: 4.5, year: "1951", youtubeVideoID: nil),
            
            FavoriteItem(title: "Harry Potter Series", subtitle: "J.K. Rowling", review: "A magical journey that defined a generation. The world-building is extraordinary and the characters feel like family.", imageURL: "https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=800", description: "Fantasy series following a young wizard's education at Hogwarts and battle against dark forces.", rating: 4.9, year: "1997-2007", youtubeVideoID: nil),
            
            FavoriteItem(title: "The Lord of the Rings", subtitle: "J.R.R. Tolkien", review: "The foundation of modern fantasy literature. Epic in scope, depth, and imagination. Simply masterful.", imageURL: "https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=800", description: "High fantasy epic chronicling the quest to destroy the One Ring and save Middle-earth from darkness.", rating: 5.0, year: "1954", youtubeVideoID: nil),
            
            FavoriteItem(title: "The Hobbit", subtitle: "J.R.R. Tolkien", review: "A perfect adventure story for all ages. Bilbo's journey of self-discovery is enchanting and exciting.", imageURL: "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=800", description: "Fantasy adventure following a hobbit's unexpected journey to reclaim a treasure guarded by a dragon.", rating: 4.7, year: "1937", youtubeVideoID: nil),
            
            FavoriteItem(title: "Brave New World", subtitle: "Aldous Huxley", review: "A different kind of dystopia - one of pleasure and conformity. Deeply thought-provoking and disturbing.", imageURL: "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=800", description: "Dystopian novel imagining a future world of genetic engineering and psychological conditioning.", rating: 4.6, year: "1932", youtubeVideoID: nil),
            
            FavoriteItem(title: "The Chronicles of Narnia", subtitle: "C.S. Lewis", review: "Magical adventures filled with Christian allegory and wonder. Aslan is an unforgettable character of nobility.", imageURL: "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=800", description: "Fantasy series set in a magical world accessible through a wardrobe, filled with adventure and meaning.", rating: 4.8, year: "1950-1956", youtubeVideoID: nil)
        ]
    }
    
    private func getCourses() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "iOS Development", subtitle: "Mobile Programming", review: "Learning to build iOS apps has been transformative for my career. Swift is elegant, powerful, and UIKit opens endless possibilities.", imageURL: "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800", description: "Comprehensive course covering UIKit, SwiftUI, networking, persistence, and modern app architecture patterns.", rating: 5.0, year: "2024", youtubeVideoID: nil),
            
            FavoriteItem(title: "Data Structures & Algorithms", subtitle: "Computer Science", review: "Challenging but absolutely essential. Understanding algorithms fundamentally changed how I approach problem-solving.", imageURL: "https://images.unsplash.com/photo-1516116216624-53e697fedbea?w=800", description: "Deep dive into fundamental data structures, algorithmic paradigms, and complexity analysis.", rating: 4.8, year: "2023", youtubeVideoID: nil),
            
            FavoriteItem(title: "Database Systems", subtitle: "Backend Development", review: "SQL mastery and database design principles are crucial for any serious developer. Learned so much about data modeling.", imageURL: "https://images.unsplash.com/photo-1544383835-bda2bc66a55d?w=800", description: "Study of relational databases, SQL, normalization, transactions, and database design principles.", rating: 4.6, year: "2023", youtubeVideoID: nil),
            
            FavoriteItem(title: "Web Development", subtitle: "Full Stack Programming", review: "Building complete web applications from frontend to backend is incredibly satisfying and practical.", imageURL: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800", description: "Full-stack development covering HTML, CSS, JavaScript, React, Node.js, and deployment strategies.", rating: 4.7, year: "2024", youtubeVideoID: nil),
            
            FavoriteItem(title: "Machine Learning", subtitle: "Artificial Intelligence", review: "Fascinating introduction to AI and ML. The mathematical foundations are challenging but incredibly rewarding.", imageURL: "https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800", description: "Introduction to ML algorithms, neural networks, and practical applications using Python and TensorFlow.", rating: 4.9, year: "2024", youtubeVideoID: nil),
            
            FavoriteItem(title: "Computer Networks", subtitle: "Network Architecture", review: "Understanding how the internet actually works is mind-blowing. TCP/IP protocols are ingeniously designed.", imageURL: "https://images.unsplash.com/photo-1551033406-611cf9a28f67?w=800", description: "Study of network protocols, architecture, security, and the infrastructure of the internet.", rating: 4.5, year: "2023", youtubeVideoID: nil),
            
            FavoriteItem(title: "Operating Systems", subtitle: "System Programming", review: "Learning about processes, threads, and memory management deepened my understanding of computer science.", imageURL: "https://images.unsplash.com/photo-1629654297299-c8506221ca97?w=800", description: "Exploration of OS design principles, process management, memory systems, and file systems.", rating: 4.7, year: "2023", youtubeVideoID: nil),
            
            FavoriteItem(title: "Software Engineering", subtitle: "Development Practices", review: "Agile methodologies, design patterns, and best practices - essential knowledge for professional development.", imageURL: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800", description: "Professional practices including SDLC, design patterns, testing methodologies, and project management.", rating: 4.6, year: "2024", youtubeVideoID: nil),
            
            FavoriteItem(title: "Cybersecurity", subtitle: "Information Security", review: "Eye-opening course on security threats and defenses. Everyone in tech should understand these principles.", imageURL: "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=800", description: "Study of security principles, cryptography, network security, and ethical hacking techniques.", rating: 4.8, year: "2024", youtubeVideoID: nil),
            
            FavoriteItem(title: "Cloud Computing", subtitle: "Distributed Systems", review: "AWS, Azure, and cloud architecture - this is the future of computing infrastructure and scalability.", imageURL: "https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=800", description: "Introduction to cloud platforms, services, deployment strategies, and building scalable applications.", rating: 4.7, year: "2024", youtubeVideoID: nil)
        ]
    }
}
