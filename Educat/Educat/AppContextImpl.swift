
import UIKit

/// Да-да приходится писать свой аналог контейнера зависимостей
class AppContextImpl: AppContext {
    
    private let application: UIApplication!
    
    // MARK: Объявление необходимых сервисов
//    var articleService: ArticleService! // Сервис статей
//    var userService: UserService! // Сервис пользователей
//    var securityService: SecurityService! // Сервис безопасности
//    var requestDispatcher: CentralWebRequestDispatcher! // Центральный диспечер запросов
    
    // MARK: Объявление и иницализация необходимых контроллеров представления
//    let signInViewController: SignInViewController? // Вход
//    let signUpViewController: SignUpViewController? // Регистрация
    let tabBarViewController = TabBarController()
    
    // MARK:- Лента
    let feedViewController = FeedViewController()
    
    // MARK:- Курсы
    let courseViewController = CourseViewController() // Курсы
    let courceMarketViewController = CourseMarketViewController() // Магазин курсов
    
    let bookmarksViewController = BookmarksViewController() // Закладки
    let profileViewController = ProfileViewController() // Профиль пользователя
//    let userViewController = UserViewController() // Информация о профиле другого пользователя (нужен ренейминг)
//
//    // MARK: Объявление навигационных контроллеров
    private var feedNavigationController: ECNavigationController!
    private var courseNavigationController: ECNavigationController!
    private var bookmarksNavigationController: ECNavigationController!
    private var profileNavigationController: ECNavigationController!
    
    init(application: UIApplication!) {
        
        self.application = application

        // Тут нужно принять решение относительно сокрытия бара
        // на основании данных об устройстве, если безрамочный,
        // тогда бар со скругленными углами, иначе обычный
        tabBarViewController.switchTabBar = true // пока переключаем
        setupDependencies()
    }
    
    func getRootViewController() -> UIViewController {
        
        // Принять решение относительно возврата корневого контроллера представления
        // в зависимости от наличия/отсутствия данных пользователя в keychain
        
        return tabBarViewController
    }
    

    private func setupDependencies() -> Void {

        feedNavigationController = ECNavigationController(rootViewController: feedViewController)
        courseNavigationController = ECNavigationController(rootViewController: courceMarketViewController)
        bookmarksNavigationController = ECNavigationController(rootViewController: bookmarksViewController)
        profileNavigationController = ECNavigationController(rootViewController: profileViewController)

        tabBarViewController.setViewControllers([
                    feedNavigationController,
                    courseNavigationController,
                    bookmarksNavigationController,
                    profileNavigationController], animated: false)

//        tabBarViewController.card = cardViewController
//        cardViewController.container = tabBarViewController

    }
    
}
