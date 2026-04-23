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

private enum SaascieSeigCommentJsonCipherKeys {
    static let ORINXVougecommentId = "QvtnJp2mpH+9Sw9ONRgFDg=="
    static let ORINXVougedynamicId = "DQyvyhASixnVKYUA9cFCtw=="
    static let ORINXVougeuserId = "Ab9CmsrFLx2e3c69BZ9oiQ=="
    static let ORINXVougecontent = "zNAQjuFvKdFFEwGfSYlGyg=="
}

private func saascieSeigJsonKey(_ cipherText: String) -> String {
    XaiwgAesECBTool.xaiwgDecrypt(cipherText)
}

extension SaascieSeigComment {

    init(json: [String: Any]) {

        self.saascieSeigCommentId = "\(json[saascieSeigJsonKey(SaascieSeigCommentJsonCipherKeys.ORINXVougecommentId)] ?? "")"
        self.saascieSeigCommentWorkId = "\(json[saascieSeigJsonKey(SaascieSeigCommentJsonCipherKeys.ORINXVougedynamicId)] ?? "")"
        self.saascieSeigCommentUserId = "\(json[saascieSeigJsonKey(SaascieSeigCommentJsonCipherKeys.ORINXVougeuserId)] ?? "")"
        self.saascieSeigCommentText = json[saascieSeigJsonKey(SaascieSeigCommentJsonCipherKeys.ORINXVougecontent)] as? String ?? ""
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
