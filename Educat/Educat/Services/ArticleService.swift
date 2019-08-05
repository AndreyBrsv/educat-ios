
import Foundation

protocol ArticleService {
    
    func loadArticle(byId: Int) -> Article?
    
    func loadInterestingArticles() -> [ShortDetailedArticle]?
    
    func loadBookmarkedArticles() -> [ShortDetailedArticle]?
    
    func loadArticlesCreatedByUser(withId: Int) -> [ShortDetailedArticle]?
    
}

class ArticleServiceImpl: ArticleService {
    
    func loadArticle(byId: Int) -> Article {
        return nil
    }
    
    func loadInterestingArticles() -> [ShortDetailedArticle] {
        return nil
    }
    
    func loadBookmarkedArticles() -> [ShortDetailedArticle] {
        return nil
    }
    
    func loadArticlesCreatedByUser(withId: Int) -> [ShortDetailedArticle] {
        return nil
    }
    
}
