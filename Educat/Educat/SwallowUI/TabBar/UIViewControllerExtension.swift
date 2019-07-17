
import UIKit

//Расширение, добавляющее возможность присваивать
//кнопку, которая будет отображаться в SWTabBar
extension UIViewController {
    private struct SWTabBarItemStruct {
        static var swTabBarItem = SWTabBarItem()
    }
    var swTabBarItem: SWTabBarItem {
        get {
            return SWTabBarItemStruct.swTabBarItem
        }
        set (newValue) {
            SWTabBarItemStruct.swTabBarItem = newValue
        }
    }
}
