
import UIKit

public class PubSubView: UIView {

    // Декоративный разделитель между подписчиками и публикациями
    var delimeter: UIView = UIView()
    
    var delimeterYdisplacement: Double {
        get {
            return -(height / 6.0)
        }
    }
    
    var delimeterHeight: Double {
        get {
            return height / 2.0
        }
    }
    
    var height = 10.0
    
    var publications: PubSubStackView?
    
    var subscribers: PubSubStackView?
    
    var subscribeButton: UIButton = UIButton()

    var delegate: PubSubViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(publications: String, subscribers: String, subscribed: Bool) {
        self.init(frame: .zero)
        setupSubPubView(publications: publications, subscribers: subscribers, subscribed: subscribed)
        print("\(self)" + " Don't forget to call setupConstraints() method in parent view or view controller after conviniece init() use.")
    }
    
    private func setupSubPubView(publications: String, subscribers: String, subscribed: Bool) {
        
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true

        self.subscribeButton.backgroundColor = .educatDarkYellow
        self.subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
        
        self.backgroundColor = .educatLightGray
        self.delimeter.backgroundColor = .educatGray
        
        self.publications = PubSubStackView(label: "Публикации", count: publications)
        self.subscribers = PubSubStackView(label: "Подписчики", count: subscribers)
        self.subscribeButton.titleLabel?.text = subscribed ? "Вы подписаны" : "Подписаться"
        
        self.addSubview(self.publications!)
        self.addSubview(self.subscribers!)
        self.addSubview(self.delimeter)
        self.addSubview(self.subscribeButton)
        
    }

    func setupConstraints() -> Void {
        
        delimeter.translatesAutoresizingMaskIntoConstraints = false
        publications?.translatesAutoresizingMaskIntoConstraints = false
        subscribers?.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Subscribe button
            subscribeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subscribeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subscribeButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: CGFloat(1.0 / 3.0)),
            // Delimeter
            delimeter.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            delimeter.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: CGFloat(delimeterYdisplacement)),
            delimeter.heightAnchor.constraint(equalToConstant: CGFloat(delimeterHeight)),
            delimeter.widthAnchor.constraint(equalToConstant: CGFloat(2.0)),
            // Publications
            publications!.centerYAnchor.constraint(equalTo: delimeter.centerYAnchor),
            publications!.heightAnchor.constraint(equalTo: delimeter.heightAnchor),
            publications!.trailingAnchor.constraint(equalTo: delimeter.leadingAnchor, constant: -(self.superview!.frame.width * 0.025)),
            // Subscribers
            subscribers!.centerYAnchor.constraint(equalTo: delimeter.centerYAnchor),
            subscribers!.heightAnchor.constraint(equalTo: delimeter.heightAnchor),
            subscribers!.leadingAnchor.constraint(equalTo: delimeter.trailingAnchor, constant: (self.superview!.frame.width * 0.025))
        ])
    }

    @objc func subscribeButtonTapped() -> Void {
        delegate?.subscribeButtonTapped?()
    }

}
