
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context: AppContext!
    
    override init() {
        super.init()
        UIFont.overrideInitialize()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        context = AppContextImpl(application: application)
        
        window?.rootViewController = context.getRootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        let root = (window?.rootViewController as! ECTabBarController)
//        root.edTabBar.animateSelectorToItem(withIndex: root.selectedIndex)
//    }
    
    
}

