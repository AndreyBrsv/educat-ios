
import Foundation

public struct ShortDetailedArticle: Codable {
    
    var id: Int!
    var title: String!
    var metadata: ArticleMetadata!
    var readingTime: String!
    var tags: [String]!
    var publicationDate: Date!
    
    init(id: Int,
         title: String,
         metadata: ArticleMetadata,
         readingTime: String,
         tags: [String],
         publicationDate: Date) {
        
        self.id = id
        self.title = title
        self.metadata = metadata
        self.readingTime = readingTime
        self.tags = tags
        self.publicationDate = publicationDate
        
    }
    
}
