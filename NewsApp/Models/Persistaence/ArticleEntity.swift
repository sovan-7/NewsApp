import CoreData

@objc(ArticleEntity)
public class ArticleEntity: NSManagedObject {
    @NSManaged public var url: String?
    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var source: String?
    @NSManaged public var content: String?
}

extension ArticleEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }
}
