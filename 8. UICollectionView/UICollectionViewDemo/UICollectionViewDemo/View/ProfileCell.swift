import UIKit

final class ProfileCell: UICollectionViewCell {

    private enum Constants {
        // Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
        
        // contentView layout constants
        static let contentViewCornerRadius: CGFloat = 4.0

        // profileImageView layout constants
        static let imageHeight: CGFloat = 180.0
    }
    
    // MARK: - Subviews

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()

    private lazy var professionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayouts()
    }
    
    // MARK: - Private
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white
    }

    private func setupSubviews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(professionLabel)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.horizontalPadding
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.horizontalPadding
            ),
            nameLabel.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor,
                constant: Constants.profileDescriptionVerticalPadding
            ),
        ])

        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.horizontalPadding
            ),
            locationLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.horizontalPadding
            ),
            locationLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 4.0
            ),
        ])

        NSLayoutConstraint.activate([
            professionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.horizontalPadding
            ),
            professionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.horizontalPadding
            ),
            professionLabel.topAnchor.constraint(
                equalTo: locationLabel.bottomAnchor,
                constant: Constants.verticalSpacing
            ),
            professionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.profileDescriptionVerticalPadding
            ),
        ])
    }
    
    // MARK: - Public

    func setup(
        with profile: Profile
    ) {
        profileImageView.image = UIImage(named: profile.imageName)
        nameLabel.text = profile.name
        locationLabel.text = profile.location
        professionLabel.text = profile.profession
    }
}



