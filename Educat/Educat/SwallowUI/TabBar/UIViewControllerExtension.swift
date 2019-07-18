//
//import UIKit
//import Foundation
//
//private var itemsHashTable: [Int32: SWTabBarItem] = [
//    1: SWTabBarItem(), 2: SWTabBarItem(), 3: SWTabBarItem(), 4: SWTabBarItem()]
//private var count: Int32 = 0
//
////Расширение, добавляющее возможность присваивать
////кнопку, которая будет отображаться в SWTabBar
//extension UIViewController {
//
//    var swTabBarItem: SWTabBarItem {
//
//        get {
//            var const = count + 1
//            let i = objc_getAssociatedObject(self, &const) as? SWTabBarItem
//            if i == nil {
//
//                objc_setAssociatedObject(self, &const, itemsHashTable[const], .OBJC_ASSOCIATION_RETAIN)
//                let j = objc_getAssociatedObject(self, &const) as? SWTabBarItem
//                count = count + 1
//                return j!
//            }
//            return i!
//        }
//    }
//}
