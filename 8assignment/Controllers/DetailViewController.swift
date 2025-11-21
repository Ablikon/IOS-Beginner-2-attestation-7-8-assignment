import UIKit

class DetailViewController: UIViewController {

    var favoriteItem: FavoriteItem?
    var categoryColor: UIColor = .systemBlue
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let gradientOverlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let starContainerView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitle("▶ Watch Trailer / Listen", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Review"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureWithItem()
    }
    

    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(gradientOverlay)
        contentView.addSubview(infoContainerView)
        
        infoContainerView.addSubview(titleLabel)
        infoContainerView.addSubview(subtitleLabel)
        infoContainerView.addSubview(ratingStackView)
        infoContainerView.addSubview(playButton)
        infoContainerView.addSubview(divider)
        infoContainerView.addSubview(descriptionTitleLabel)
        infoContainerView.addSubview(descriptionLabel)
        infoContainerView.addSubview(reviewTitleLabel)
        infoContainerView.addSubview(reviewLabel)
        
        ratingStackView.addArrangedSubview(starContainerView)
        ratingStackView.addArrangedSubview(ratingLabel)
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        setupGradient()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 350),
            
            gradientOverlay.topAnchor.constraint(equalTo: itemImageView.topAnchor),
            gradientOverlay.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor),
            gradientOverlay.trailingAnchor.constraint(equalTo: itemImageView.trailingAnchor),
            gradientOverlay.bottomAnchor.constraint(equalTo: itemImageView.bottomAnchor),
            
            infoContainerView.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: -30),
            infoContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            ratingStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            ratingStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            playButton.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 20),
            playButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            
            divider.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            reviewTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            reviewTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reviewTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            reviewLabel.topAnchor.constraint(equalTo: reviewTitleLabel.bottomAnchor, constant: 12),
            reviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            reviewLabel.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.withAlphaComponent(0.3).cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.locations = [0.0, 0.7, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350)
        gradientOverlay.layer.addSublayer(gradientLayer)
    }
    
    private func configureWithItem() {
        guard let item = favoriteItem else { return }
        

        loadImage(from: item.imageURL)
        
        titleLabel.text = item.title
        subtitleLabel.text = "\(item.subtitle) • \(item.year)"
        descriptionLabel.text = item.description
        reviewLabel.text = item.review
        ratingLabel.text = String(format: "%.1f / 5.0", item.rating)
        
   
        playButton.isHidden = !item.hasVideo
        

        let fullStars = Int(item.rating)
        for i in 0..<5 {
            let starImage = UIImageView()
            starImage.image = UIImage(systemName: i < fullStars ? "star.fill" : "star")
            starImage.tintColor = .systemYellow
            starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
            starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
            starContainerView.addArrangedSubview(starImage)
        }
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.itemImageView.image = image
            }
        }.resume()
    }
    
    @objc private func playButtonTapped() {
        guard let item = favoriteItem,
              let videoID = item.youtubeVideoID else { return }
        
        let playerVC = YouTubePlayerViewController()
        playerVC.videoID = videoID
        playerVC.videoTitle = item.title
        playerVC.modalPresentationStyle = .fullScreen
        playerVC.modalTransitionStyle = .crossDissolve
        
        present(playerVC, animated: true)
    }
}
