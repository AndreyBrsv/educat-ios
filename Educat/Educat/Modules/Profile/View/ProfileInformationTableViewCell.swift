
import UIKit

/// Ячейка табличного представления, отображающая информацию
/// о пользователе. Отображается в качестве первой ячейки
/// во вкладке профиля.
class ProfileInformationTableViewCell: UITableViewCell {
    
    override class var requiresConstraintBasedLayout: Bool {
        get {
            return true
        }
    }
    
    var user : User? {
        willSet {
            guard let firstName = newValue?.firstName, let lastName = newValue?.lastName else { return }
            usernameLabel.text = firstName + " " + lastName
            userInfoLabel.text = newValue?.userInfo
        }
    }
    
    var delegate: ProfileInformationTableViewCellDelegate?

    var profileImageViewRadius: CGFloat {
        get {
            return 0.2 * frame.width
        }
    }
    
    open var profileImage: UIImage? {
        get {
            return profileImageView.imageView.image
        }
        set {
            profileImageView.imageView.image = newValue
        }
    }
    
    lazy var profileImageView: CircleImageView = {
        let profileImage = CircleImageView()
        profileImage.backgroundColor = .educatDarkBlue
        profileImage.whiteRoundedView.backgroundColor = .educatLightGray
        profileImage.cornerRadius = profileImageViewRadius
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    var changeInfoButtonRadius: CGFloat {
        get {
            return 0.3 * profileImageViewRadius
        }
    }
    
    lazy var changeInfoButton: UIView = {
        let changeInfoButtonContrainer = UIView()
        changeInfoButtonContrainer.dropShadow()
        let changeInfoButton = UIButton()
        changeInfoButton.backgroundColor = .white
        changeInfoButton.clipsToBounds = true
        changeInfoButton.addTarget(delegate, action: #selector(delegate?.editInfo(_:)), for: .touchUpInside)
        changeInfoButton.setImage(UIImage(imageLiteralResourceName: "changeInfoButton"), for: .normal)
        changeInfoButtonContrainer.addSubview(changeInfoButton)
        changeInfoButton.layer.cornerRadius = changeInfoButtonRadius
        changeInfoButton.translatesAutoresizingMaskIntoConstraints = false
        changeInfoButtonContrainer.translatesAutoresizingMaskIntoConstraints = false
        return changeInfoButtonContrainer
    }()
    
    lazy var background: UIView = {
        let background = UIView()
        background.backgroundColor = .educatLightGray
        background.layer.cornerRadius = CGFloat(20.0)
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    lazy var usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .educatPlainTextColor
        usernameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    lazy var userInfoLabel: UILabel = {
        let userInfoLabel = UILabel()
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = .educatPlainTextColor
        userInfoLabel.numberOfLines = 3
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return userInfoLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() -> Void {
        self.selectionStyle = .none
        self.addSubview(background)
        self.addSubview(usernameLabel)
        self.addSubview(userInfoLabel)
        self.addSubview(profileImageView)
        self.addSubview(changeInfoButton)
    }
    
    func setupLayout() -> Void {
        NSLayoutConstraint.activate([
            // profileImage
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 2 * profileImageViewRadius),
            profileImageView.widthAnchor.constraint(equalToConstant: 2 * profileImageViewRadius),
            // changeInfoButton
            changeInfoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            changeInfoButton.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            changeInfoButton.widthAnchor.constraint(equalToConstant: 2 * changeInfoButtonRadius),
            changeInfoButton.heightAnchor.constraint(equalToConstant: 2 * changeInfoButtonRadius),
            // usernameLabel
            usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: changeInfoButton.bottomAnchor, constant: 20.0),
            usernameLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
            // userInfoLabel
            userInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userInfoLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
            userInfoLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20.0),
            // background
            background.topAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            background.centerXAnchor.constraint(equalTo: centerXAnchor),
            background.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            background.bottomAnchor.constraint(greaterThanOrEqualTo: userInfoLabel.bottomAnchor, constant: 10),
            background.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10)
        ])
    }
}
