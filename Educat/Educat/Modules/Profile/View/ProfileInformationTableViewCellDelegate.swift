
import UIKit

@objc public protocol ProfileInformationTableViewCellDelegate: class {
    @objc func editInfo(_ sender: UIButton) -> Void
}
