
import UIKit

/// Ячейка табличного представления, отображающая информацию
/// о пользователе. Отображается в качестве первой ячейки
/// во вкладке профиля.
class ProfileInformationTableViewCell: UITableViewCell {
    
    var user : User? {
        willSet {
            guard let firstName = newValue?.firstName, let lastName = newValue?.lastName else { return }
            usernameLabel.text = firstName + " " + lastName
            userInfoLabel.text = newValue?.userInfo
        }
    }
    
    var delegate: ProfileInformationTableViewCellDelegate?

    var profileImage: CircleImageView!
    var changeInfoButton = UIButton()
    var background = UIView()
    var usernameLabel = UILabel()
    var userInfoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() -> Void {
        
        profileImage = CircleImageView(image: UIImage(imageLiteralResourceName: "ph"), radius: 0.2 * self.frame.width)
        
        self.addSubview(background)
        self.addSubview(usernameLabel)
        self.addSubview(userInfoLabel)
        self.addSubview(profileImage)
        self.addSubview(changeInfoButton)
    }
    
    private func setProperties() -> Void {
        
        self.selectionStyle = .none
        self.backgroundColor = .white
        
        background.backgroundColor = .educatLightGray
        background.layer.cornerRadius = CGFloat(20.0)
        
        profileImage.backgroundColor = .educatDarkBlue
        profileImage.whiteRoundedView.backgroundColor = .educatLightGray
        
        changeInfoButton.backgroundColor = .white
        changeInfoButton.addTarget(delegate, action: #selector(delegate?.editInfo(_:)), for: .touchUpInside)
        changeInfoButton.setImage(UIImage(imageLiteralResourceName: "changeInfoButton"), for: .normal)
        changeInfoButton.layer.cornerRadius = 0.4 * profileImage.width / 2.0
        changeInfoButton.layer.shadowColor = UIColor.black.cgColor
        changeInfoButton.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        changeInfoButton.layer.shadowOpacity = 0.1
        changeInfoButton.layer.shadowRadius = 4.0
        
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .educatPlainTextColor
        usernameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = .educatPlainTextColor
        userInfoLabel.numberOfLines = 3
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        changeInfoButton.translatesAutoresizingMaskIntoConstraints = false
        background.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                
            changeInfoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changeInfoButton.centerYAnchor.constraint(equalTo: profileImage.bottomAnchor),
            changeInfoButton.widthAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: 0.4),
            changeInfoButton.heightAnchor.constraint(equalTo: changeInfoButton.widthAnchor),
                
            usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: changeInfoButton.bottomAnchor, constant: 20.0),
            usernameLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
                
            userInfoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userInfoLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
            userInfoLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20.0),
            
            background.topAnchor.constraint(equalTo: profileImage.centerYAnchor),
            background.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            background.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            background.bottomAnchor.constraint(greaterThanOrEqualTo: userInfoLabel.bottomAnchor, constant: 10),
            background.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10)
                
            ])
        
        profileImage.layoutIfNeeded()
        
        setProperties()

    }

    
}
