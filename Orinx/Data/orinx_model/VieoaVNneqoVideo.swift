import SwiftUI
import Combine

struct VieoaVNneqoVideo: Codable, Identifiable, Equatable {

  let vieoaVNneqoWorkId: String
  var vieoaVNneqoCreatorId: String
    var vieoaVNneqoType: Int
  var vieoaVNneqoTextContent: String
    var vieoaVNneqoTitleType: Int
  var vieoaVNneqoVideoUrl: String
  var vieoaVNneqoPic: [String]
  var vieoaVNneqoLikeCount: Int
    var vieoaVNneqoCommentCount: Int

  var id: String { vieoaVNneqoWorkId }
    
    func toTargetPost() -> TargetPost {
            return TargetPost(
                dynamicId: vieoaVNneqoWorkId,
                userId: vieoaVNneqoCreatorId,
                dynamicType: vieoaVNneqoType,
                dynamicDesc: vieoaVNneqoTextContent,
                dynamicTitleType: vieoaVNneqoTitleType,
                dynamicPic: vieoaVNneqoPic,
                dynamicVideo: vieoaVNneqoVideoUrl,
                dynamicLikeCount: vieoaVNneqoLikeCount,
                dynamicCommentCount: vieoaVNneqoCommentCount
            )
        }
}

private enum VieoaVNneqoVideoJsonCipherKeys {
    static let ORINXVougedynamicId = "DQyvyhASixnVKYUA9cFCtw=="
    static let ORINXVougeuserId = "Ab9CmsrFLx2e3c69BZ9oiQ=="
    static let ORINXVougedynamicType = "hrs/Y6IbqhI0qObSGpWkHA=="
    static let ORINXVougedynamicDesc = "jotl5dxOoC3OI9wXk+x8EQ=="
    static let ORINXVougedynamicTitleType = "Dpd9qjukn/Dl45vCgVEVG3XHJ8e/z413tJ5LLrjRDTY="
    static let ORINXVougedynamicVideo = "ItVmUFtPj2gOK7I5Sw9KjA=="
    static let ORINXVougedynamicLikeCount = "bK4vqoVDf4eEfl5+uEeUeXXHJ8e/z413tJ5LLrjRDTY="
    static let ORINXVougedynamicCommentCount = "y2LpX8NRfT1JZyc1SkQSAuSE9oSO0bJvCVUTHMTMlJY="
    static let ORINXVougedynamicPic = "OuuaIbk3ohvVp99oj0MMVg=="
}

private func vieoaVNneqoJsonKey(_ cipherText: String) -> String {
    XaiwgAesECBTool.xaiwgDecrypt(cipherText)
}

extension VieoaVNneqoVideo {

    init(json: [String: Any]) {

        self.vieoaVNneqoWorkId = "\(json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicId)] ?? "")"
        self.vieoaVNneqoCreatorId = "\(json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougeuserId)] ?? "")"
        self.vieoaVNneqoType = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicType)] as? Int ?? 0
        self.vieoaVNneqoTextContent = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicDesc)] as? String ?? ""
        self.vieoaVNneqoTitleType = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicTitleType)] as? Int ?? 0
        self.vieoaVNneqoVideoUrl = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicVideo)] as? String ?? ""
        self.vieoaVNneqoLikeCount = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicLikeCount)] as? Int ?? 0
        self.vieoaVNneqoCommentCount = json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicCommentCount)] as? Int ?? 0

        // 👇 图片数组（兼容 __NSArrayM）
        self.vieoaVNneqoPic = (json[vieoaVNneqoJsonKey(VieoaVNneqoVideoJsonCipherKeys.ORINXVougedynamicPic)] as? [Any])?.map { "\($0)" } ?? []
    }
    
    static func fromJsonArray(_ array: [[String: Any]]) -> [VieoaVNneqoVideo] {
            return array.map { VieoaVNneqoVideo(json: $0) }
        }
}

struct TargetPost: Codable {
    let dynamicId: String
    let userId: String
    let dynamicType: Int
    let dynamicDesc: String
    let dynamicTitleType: Int
    let dynamicPic: [String]
    let dynamicVideo: String
    let dynamicLikeCount: Int
    let dynamicCommentCount: Int
}

@MainActor
final class VieoaVNneqoVideoViewModel: ObservableObject {

  @Published var allWorks: [VieoaVNneqoVideo] = []
  @Published var allNotBlockWorks: [VieoaVNneqoVideo] = []
//  @Published var userWorks: [VieoaVNneqoVideo] = []
  @Published var myFollowingUserWorks: [VieoaVNneqoVideo] = []

  private let storage = OrinxntqoStorageManager.shared

  func getAllVieoaVNneqoWorks() {
    allWorks = storage.aelgohiAorGetWorks()
  }

  func getAllNotBlockVieoaVNneqoWorks() {
    let allWorks: [VieoaVNneqoVideo] = storage.aelgohiAorGetWorks()
    if let cnaiwjdMyInfo = storage.aelgohiAorGetUserById(userId: storage.aelgohiAorGetCurrentUserId()) {
      allNotBlockWorks = allWorks.filter {
        !cnaiwjdMyInfo.rexceaiPwvzwaBlacklist.contains($0.vieoaVNneqoCreatorId)
      }
    }

  }
    
    // get by type
    func getAllNotBlockVieoaVNneqoWorksByType(type: Int) -> [VieoaVNneqoVideo] {
      let allWorks: [VieoaVNneqoVideo] = storage.aelgohiAorGetWorks()
      if let cnaiwjdMyInfo = storage.aelgohiAorGetUserById(userId: storage.aelgohiAorGetCurrentUserId()) {
        return allWorks.filter {
          !cnaiwjdMyInfo.rexceaiPwvzwaBlacklist.contains($0.vieoaVNneqoCreatorId)
            && $0.vieoaVNneqoType == type
        }
      }else {
          return []
      }

    }
    
    // get my works
    func getMyVieoaVNneqoWorks() -> [VieoaVNneqoVideo] {
      let allWorks: [VieoaVNneqoVideo] = storage.aelgohiAorGetWorks()
        return allWorks.filter {
            $0.vieoaVNneqoCreatorId == storage.aelgohiAorGetCurrentUserId()
        }

    }


    func getVieoaVNneqoWorksByUserIdAndType(userId: String, type: Int) -> [VieoaVNneqoVideo] {
    let allPostWorks: [VieoaVNneqoVideo] = storage.aelgohiAorGetWorks()
    return allPostWorks.filter {
        $0.vieoaVNneqoCreatorId == userId && $0.vieoaVNneqoType == type
    }
  }

  func getMyFollowingVieoaVNneqoWorks() {
    let currentUserId = storage.aelgohiAorGetCurrentUserId()
    guard let currentUserInfo: RexceaiPwvzwaUser = storage.aelgohiAorGetUserById(userId: currentUserId)
    else {
      return
    }
    let allPostWorks: [VieoaVNneqoVideo] = storage.aelgohiAorGetWorks()
    let myFollowingWorks: [VieoaVNneqoVideo] = allPostWorks.filter {
      currentUserInfo.rexceaiPwvzwaFollowing.contains($0.vieoaVNneqoCreatorId)
        && !currentUserInfo.rexceaiPwvzwaBlacklist.contains($0.vieoaVNneqoCreatorId)
    }
    myFollowingUserWorks = myFollowingWorks
  }

  func getUserByCreatorId(creatorId: String) -> RexceaiPwvzwaUser? {
    return storage.aelgohiAorGetUserById(userId: creatorId)
  }

}
