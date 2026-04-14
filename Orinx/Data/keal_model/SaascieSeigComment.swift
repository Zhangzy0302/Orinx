import SwiftUI
import Combine

struct SaascieSeigComment: Codable, Equatable {

  let saascieSeigCommentId: String
    let saascieSeigCommentWorkId: String
    let saascieSeigCommentUserId: String
    let saascieSeigCommentText: String
    
    func toTargetComment() -> TargetComment {
            return TargetComment(
                commentId: saascieSeigCommentId,
                dynamicId: saascieSeigCommentWorkId,
                userId: saascieSeigCommentUserId,
                content: saascieSeigCommentText
            )
        }
}

extension SaascieSeigComment {

    init(json: [String: Any]) {

        self.saascieSeigCommentId = "\(json["commentId"] ?? "")"
        self.saascieSeigCommentWorkId = "\(json["dynamicId"] ?? "")"
        self.saascieSeigCommentUserId = "\(json["userId"] ?? "")"
        self.saascieSeigCommentText = json["content"] as? String ?? ""
    }
    
    static func fromJsonArray(_ array: [[String: Any]]) -> [SaascieSeigComment] {
        return array.map { SaascieSeigComment(json: $0) }
    }
}

struct TargetComment: Codable {
    let commentId: String
    let dynamicId: String
    let userId: String
    let content: String
}

