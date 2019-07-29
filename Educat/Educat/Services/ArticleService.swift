
import Foundation

protocol ArticleService {
    
    func loadArticle(byId: Int) -> Article
    
    func loadInterestingArticles() -> [ShortDetailedArticle]
    
    func loadBookmarkedArticles() -> [ShortDetailedArticle]
    
    func loadArticlesCreatedByUser(withId: Int) -> [ShortDetailedArticle]
    
}
