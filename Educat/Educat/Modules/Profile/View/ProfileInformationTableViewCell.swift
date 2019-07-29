
import UIKit

/// Ячейка табличного представления, отображающая инфомацию
/// о пользователе. Отображается в качестве первой ячейки
/// во вкладке профиля.
class ProfileInformationTableViewCell: UITableViewCell {

    public final let decorativeStripeHeightScaleFactor = 0.002
    public final let decorativeStripeWidthScaleFactor = 0.9

    var profileImage: CircleImageView!
    var changeInfoButton: UIButton!
    var decorativeStripe: UIView!
    var usernameLabel: UILabel!
    var userInfoLabel: UILabel!

    func setupCell() -> Void {

        self.addSubview(profileImage)
        self.addSubview(changeInfoButton)
        self.addSubview(decorativeStripe)
        self.addSubview(usernameLabel)
        self.addSubview(userInfoLabel)

        self.profileImage.translatesAutoresizingMaskIntoConstraints = false
        self.changeInfoButton.translatesAutoresizingMaskIntoConstraints = false
        self.decorativeStripe.translatesAutoresizingMaskIntoConstraints = false
        self.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.userInfoLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            // profileImage
            self.profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // changeInfoButton
            self.changeInfoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.changeInfoButton.centerYAnchor.constraint(equalTo: self.profileImage.bottomAnchor),
            // decorativeStripe
            self.decorativeStripe.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // usernameLabel
            self.usernameLabel.centerXAnchor.constraint(equalTo: self.decorativeStripe.centerXAnchor),
            self.usernameLabel.centerYAnchor.constraint(equalTo: self.decorativeStripe.centerYAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
