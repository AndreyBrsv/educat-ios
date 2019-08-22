
import UIKit

class MainCourceCollectionViewCell: UICollectionView {
    
    var cellModel: MainCourseCollectionViewCellModel? {
        get {
            return model
        }
        set {
            guard let model = newValue else { return }
            self.model = model
            self.courceTag.text = model.tag
            self.likes.text = model.likes
            self.subject.text = model.subject
            self.title.text = model.title
            self.image.image = model.image
        }
    }
    
    private var model: MainCourseCollectionViewCellModel?
    
    let courceTag = UILabel()
    let likesIcon = UIImageView()
    let likes = UILabel()
    let subject = UILabel()
    let title = UILabel()
    let image = UIImageView()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    public convenience init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, model: MainCourseCollectionViewCellModel) {
        self.init(frame: frame, collectionViewLayout: layout)
        cellModel = model
    }
    
    private func constraints() -> Void {
        
        likesIcon.translatesAutoresizingMaskIntoConstraints = false
        likes.translatesAutoresizingMaskIntoConstraints = false
        subject.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            courceTag.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
            courceTag.trailingAnchor.constraint(lessThanOrEqualTo: likes.leadingAnchor),
            courceTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20.0),
            courceTag.heightAnchor.constraint(equalToConstant: 20.0),
            
            likesIcon.heightAnchor.constraint(equalTo: courceTag.heightAnchor),
            likesIcon.widthAnchor.constraint(equalTo: likesIcon.heightAnchor),
            likesIcon.centerYAnchor.constraint(equalTo: courceTag.centerYAnchor),
            likesIcon.trailingAnchor.constraint(equalTo: likes.leadingAnchor),
            
            likes.centerYAnchor.constraint(equalTo: courceTag.centerYAnchor),
            likes.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            
            subject.topAnchor.constraint(equalTo: courceTag.bottomAnchor, constant: 20.0),
            subject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            subject.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            
            title.topAnchor.constraint(equalTo: subject.bottomAnchor, constant: 20.0),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
        
            image.topAnchor.constraint(equalTo: title.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
}
