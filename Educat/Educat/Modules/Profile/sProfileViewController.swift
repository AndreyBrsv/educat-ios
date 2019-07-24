
import UIKit

class pProfileViewController: SWViewController {
    
    public final let profilePhotoScaleFactor = 0.6 // Scale factor from width of the device
    public final let decorativeStripeHeightScaleFactor = 0.002
    public final let decorativeStripeWidthScaleFactor = 0.9
    
    open var delegate: ProfileViewControllerDelegate? {
        get {
            return profileViewControllerDelegate
        }
        set {
            profileViewControllerDelegate = newValue
        }
    }
    
    private var profileViewControllerDelegate: ProfileViewControllerDelegate?
    
    private var profilePicture = UIImage()
    
    private var editProfileInformationButton = UIButton()
    
    private var decorativeStripe = UIView()
    
    private var userNameLabel = UILabel()
    
    private var userInfoLabel = UILabel()
    
    private var profileMenu = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //profileMenu.delegate = self.delegate
        self.view.backgroundColor = .white
        
        self.navigationItem.title = delegate?.getControllerTitle()
        self.navigationItem.largeTitleDisplayMode = .always

        decorativeStripe.backgroundColor = .educatLightYellow
        decorativeStripe.clipsToBounds = true
        decorativeStripe.layer.cornerRadius = 2
        self.view.addSubview(decorativeStripe)
        userNameLabel.text = delegate?.getUserName()
        userNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: CGFloat(21))
        userNameLabel.textColor = .educatPlainTextColor
        userNameLabel.backgroundColor = self.view.backgroundColor
        userNameLabel.textAlignment = .natural
        self.view.addSubview(userNameLabel)
        userInfoLabel.text = delegate?.getUserInformation()
        userInfoLabel.font = UIFont(name: "AvenirNext-Regular", size: CGFloat(17))
        userInfoLabel.textColor = .educatPlainTextColor
        userInfoLabel.textAlignment = .center
        userInfoLabel.numberOfLines = 2
        self.view.addSubview(userInfoLabel)
        profileMenu.delegate = self.delegate
        profileMenu.dataSource = self.delegate
        profileMenu.isScrollEnabled = false
        profileMenu.remembersLastFocusedIndexPath = false
        profileMenu.showsVerticalScrollIndicator = false
        profileMenu.separatorStyle = .none
        profileMenu.register(
            UINib(nibName: "ProfileTableViewCell", bundle: nil),
            forCellReuseIdentifier: "profileTableViewCell"
        )
        self.view.addSubview(profileMenu)
        
        
        
        decorativeStripe.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        profileMenu.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints
        let constraints = [
            // For now configure decorative stripe, and than configure other relative it
            self.decorativeStripe.centerXAnchor.constraint(equalTo: self.view!.centerXAnchor),
            self.decorativeStripe.centerYAnchor.constraint(
                equalTo: self.view!.centerYAnchor,
                constant: CGFloat(-self.view.frame.height / 12.0)
            ),
            self.decorativeStripe.widthAnchor.constraint(
                equalTo: self.view!.safeAreaLayoutGuide.widthAnchor,
                multiplier: CGFloat(decorativeStripeWidthScaleFactor)
            ),
            self.decorativeStripe.heightAnchor.constraint(
                equalTo: self.view!.safeAreaLayoutGuide.heightAnchor,
                multiplier: CGFloat(decorativeStripeHeightScaleFactor)
            ),
            
            // Configure username label constraints
            self.userNameLabel.centerXAnchor.constraint(equalTo: self.decorativeStripe.centerXAnchor),
            self.userNameLabel.centerYAnchor.constraint(equalTo: self.decorativeStripe.centerYAnchor),
            
            // Configure userInfo label constraints
            self.userInfoLabel.topAnchor.constraint(equalTo: self.userNameLabel.bottomAnchor, constant: CGFloat(10)),
            self.userInfoLabel.centerXAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.centerXAnchor),
            // TODO: fix height of user info text area
            
            // Configure table view constraints
            self.profileMenu.widthAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.widthAnchor),
            self.profileMenu.centerXAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.centerXAnchor),
            self.profileMenu.topAnchor.constraint(
                equalTo: self.userInfoLabel.bottomAnchor,
                constant: CGFloat(self.view.frame.height / 12.0)
            ),
            self.profileMenu.bottomAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.bottomAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        

    }
    
    
}
