
import UIKit

public class UserViewController: UIViewController {

    var collectionView: UICollectionView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}
