import UIKit

class FavoriteTableViewCell: UITableViewCell {
    static let identifier = "FavoriteTableViewCell"
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(itemImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(reviewLabel)
        containerView.addSubview(ratingContainerView)
        
        ratingContainerView.addSubview(starImageView)
        ratingContainerView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            // Container constraints
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Image constraints
            itemImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            itemImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 70),
            
            // Title constraints
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            
            // Subtitle constraints
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Rating container constraints
            ratingContainerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            ratingContainerView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 6),
            ratingContainerView.heightAnchor.constraint(equalToConstant: 16),
            
            // Star constraints
            starImageView.leadingAnchor.constraint(equalTo: ratingContainerView.leadingAnchor),
            starImageView.centerYAnchor.constraint(equalTo: ratingContainerView.centerYAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 14),
            starImageView.heightAnchor.constraint(equalToConstant: 14),
            
            // Rating label constraints
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingContainerView.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: ratingContainerView.trailingAnchor),
            
            // Review constraints
            reviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            reviewLabel.topAnchor.constraint(equalTo: ratingContainerView.bottomAnchor, constant: 8),
            reviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -12),
            
            // Ensure image doesn't get cut off
            itemImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -12)
        ])
        
        // Set content compression priorities
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        reviewLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    // MARK: - Configuration
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = "\(item.subtitle) • \(item.year)"
        reviewLabel.text = item.review
        ratingLabel.text = String(format: "%.1f", item.rating)
        
        // Load image from URL
        loadImage(from: item.imageURL)
    }
    
    private func loadImage(from urlString: String) {
        itemImageView.image = UIImage(systemName: "photo.fill")
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.itemImageView.image = image
            }
        }.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = UIImage(systemName: "photo.fill")
    }
}
