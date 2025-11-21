import UIKit

class YouTubePlayerViewController: UIViewController {
    
    var videoID: String?
    var videoTitle: String?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let watchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitle("🎬 Watch on YouTube", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadThumbnail()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(containerView)
        containerView.addSubview(closeButton)
        containerView.addSubview(thumbnailImageView)
        containerView.addSubview(playIconView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(watchButton)
        
        titleLabel.text = videoTitle
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        watchButton.addTarget(self, action: #selector(openInSafari), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            thumbnailImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            thumbnailImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            thumbnailImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 200),
            
            playIconView.centerXAnchor.constraint(equalTo: thumbnailImageView.centerXAnchor),
            playIconView.centerYAnchor.constraint(equalTo: thumbnailImageView.centerYAnchor),
            playIconView.widthAnchor.constraint(equalToConstant: 60),
            playIconView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            watchButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            watchButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            watchButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            watchButton.heightAnchor.constraint(equalToConstant: 50),
            watchButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30)
        ])
    }
    
    private func loadThumbnail() {
        guard let videoID = videoID else { return }
        
        let thumbnailURLString = "https://img.youtube.com/vi/\(videoID)/maxresdefault.jpg"
        guard let url = URL(string: thumbnailURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.thumbnailImageView.image = image
            }
        }.resume()
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func openInSafari() {
        guard let videoID = videoID else { return }
        
        if let url = URL(string: "https://www.youtube.com/watch?v=\(videoID)") {
            UIApplication.shared.open(url) { [weak self] _ in
                self?.dismiss(animated: true)
            }
        }
    }
}
