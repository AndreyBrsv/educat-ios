
import Foundation

public struct Article: Codable {
    
    var id: Int
    var authorId: Int
    var author: String
    var title: String
    var subtitle: String
    var isBookmarked: Bool
    var isLiked: Bool
    var metadata: ArticleMetadata
    var articleTags: [String]
    var components: [ArticleComponent]
    
}
