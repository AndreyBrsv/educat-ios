
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
        setProperties()
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
        
        background.backgroundColor = .educatLightGray
        background.layer.cornerRadius = CGFloat(20.0)
        
        profileImage.backgroundColor = .educatPlainTextColor
        profileImage.whiteRoundedView.backgroundColor = .educatLightGray
        
        changeInfoButton.backgroundColor = .white
        changeInfoButton.addTarget(delegate, action: #selector(delegate?.editInfo(_:)), for: .touchUpInside)
        changeInfoButton.dropShadow()
        
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .educatPlainTextColor
        
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = .educatPlainTextColor
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        changeInfoButton.translatesAutoresizingMaskIntoConstraints = false
        background.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let changeInfoButtonWidthMultiplier: CGFloat = 0.4
        
        NSLayoutConstraint.activate([
                
            background.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            background.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor, multiplier: 0.7),
            background.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0.1 * self.frame.height),
                
            profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: background.topAnchor),
                
            changeInfoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changeInfoButton.centerYAnchor.constraint(equalTo: profileImage.bottomAnchor),
            changeInfoButton.widthAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: changeInfoButtonWidthMultiplier),
            changeInfoButton.heightAnchor.constraint(equalTo: changeInfoButton.widthAnchor),
                
            usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: changeInfoButton.bottomAnchor, constant: 20.0),
            usernameLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
                
            userInfoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userInfoLabel.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.8),
            userInfoLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20.0),
                
            ])
        
        profileImage.layoutIfNeeded()
        
        changeInfoButton.layer.cornerRadius = changeInfoButtonWidthMultiplier * profileImage.width / 2.0
    }

    
}
