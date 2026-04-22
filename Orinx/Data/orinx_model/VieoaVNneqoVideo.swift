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

extension VieoaVNneqoVideo {

    init(json: [String: Any]) {

        self.vieoaVNneqoWorkId = "\(json["dynamicId"] ?? "")"
        self.vieoaVNneqoCreatorId = "\(json["userId"] ?? "")"
        self.vieoaVNneqoType = json["dynamicType"] as? Int ?? 0
        self.vieoaVNneqoTextContent = json["dynamicDesc"] as? String ?? ""
        self.vieoaVNneqoTitleType = json["dynamicTitleType"] as? Int ?? 0
        self.vieoaVNneqoVideoUrl = json["dynamicVideo"] as? String ?? ""
        self.vieoaVNneqoLikeCount = json["dynamicLikeCount"] as? Int ?? 0
        self.vieoaVNneqoCommentCount = json["dynamicCommentCount"] as? Int ?? 0

        // 👇 图片数组（兼容 __NSArrayM）
        self.vieoaVNneqoPic = (json["dynamicPic"] as? [Any])?.map { "\($0)" } ?? []
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
  @Published var workDetail: VieoaVNneqoVideo?

  private let storage = OrinxntqoStorageManager.shared

  func getAllVieoaVNneqoWorks() {
    allWorks = storage.getWorks()
  }

  func getAllNotBlockVieoaVNneqoWorks() {
    let allWorks: [VieoaVNneqoVideo] = storage.getWorks()
    if let cnaiwjdMyInfo = storage.getUserById(userId: storage.getCurrentUserId()) {
      allNotBlockWorks = allWorks.filter {
        !cnaiwjdMyInfo.rexceaiPwvzwaBlacklist.contains($0.vieoaVNneqoCreatorId)
      }
    }

  }
    
    // get by type
    func getAllNotBlockVieoaVNneqoWorksByType(type: Int) -> [VieoaVNneqoVideo] {
      let allWorks: [VieoaVNneqoVideo] = storage.getWorks()
      if let cnaiwjdMyInfo = storage.getUserById(userId: storage.getCurrentUserId()) {
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
      let allWorks: [VieoaVNneqoVideo] = storage.getWorks()
        return allWorks.filter {
            $0.vieoaVNneqoCreatorId == storage.getCurrentUserId()
        }

    }


    func getVieoaVNneqoWorksByUserIdAndType(userId: String, type: Int) -> [VieoaVNneqoVideo] {
    let allPostWorks: [VieoaVNneqoVideo] = storage.getWorks()
    return allPostWorks.filter {
        $0.vieoaVNneqoCreatorId == userId && $0.vieoaVNneqoType == type
    }
  }

  func getMyFollowingVieoaVNneqoWorks() {
    let currentUserId = storage.getCurrentUserId()
    guard let currentUserInfo: RexceaiPwvzwaUser = storage.getUserById(userId: currentUserId)
    else {
      return
    }
    let allPostWorks: [VieoaVNneqoVideo] = storage.getWorks()
    let myFollowingWorks: [VieoaVNneqoVideo] = allPostWorks.filter {
      currentUserInfo.rexceaiPwvzwaFollowing.contains($0.vieoaVNneqoCreatorId)
        && !currentUserInfo.rexceaiPwvzwaBlacklist.contains($0.vieoaVNneqoCreatorId)
    }
    myFollowingUserWorks = myFollowingWorks
  }

  func getVieoaVNneqoWorkDetailByWorkId(workId: String) {
    workDetail = storage.getWorkDetailById(workId: workId)
  }

  // 根据用户ID获取用户信息（封装存储层方法）
  func getUserByCreatorId(creatorId: String) -> RexceaiPwvzwaUser? {
    return storage.getUserById(userId: creatorId)
  }

}
