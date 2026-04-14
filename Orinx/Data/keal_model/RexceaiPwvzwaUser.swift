import SwiftUI
import Combine

struct RexceaiPwvzwaUser: Codable, Identifiable, Equatable {

  let rexceaiPwvzwaUserId: String
  var rexceaiPwvzwaEmail: String
  var rexceaiPwvzwaPassword: String
  var rexceaiPwvzwaUserName: String
  var rexceaiPwvzwaAvatar: String
    var rexceaiPwvzwaAboutMe: String
  var rexceaiPwvzwaFollowing: [String]
  var rexceaiPwvzwaFans: [String]
  var rexceaiPwvzwaBlacklist: [String]
  var rexceaiPwvzwaWalletBalance: Int
    var rexceaiPwvzwaLikePosts: [String]
  var rexceaiPwvzwaIsDeleted: Int	

  // MARK: - Identifiable
  var id: String { rexceaiPwvzwaUserId }
    
    func toTargetUser() -> TargetUser {
            return TargetUser(
                userId: rexceaiPwvzwaUserId,
                email: rexceaiPwvzwaEmail,
                password: rexceaiPwvzwaPassword,
                avator: rexceaiPwvzwaAvatar,
                name: rexceaiPwvzwaUserName,
                about: rexceaiPwvzwaAboutMe.isEmpty ? "This user has no description. " : rexceaiPwvzwaAboutMe,
                coins: rexceaiPwvzwaWalletBalance,
                follow: rexceaiPwvzwaFollowing,
                fans: rexceaiPwvzwaFans,
                blockList: rexceaiPwvzwaBlacklist,
                postLikeIds: rexceaiPwvzwaLikePosts,
                isdelete: rexceaiPwvzwaIsDeleted
            )
        }
    
    func convertUsers(_ users: [RexceaiPwvzwaUser]) -> [TargetUser] {
        return users.map { $0.toTargetUser() }
    }
}

extension RexceaiPwvzwaUser {

    init(json: [String: Any]) {

        self.rexceaiPwvzwaUserId = "\(json["userId"] ?? "")"
        self.rexceaiPwvzwaEmail = json["email"] as? String ?? ""
        self.rexceaiPwvzwaPassword = "\(json["password"] ?? "")"
        self.rexceaiPwvzwaUserName = json["name"] as? String ?? ""
        self.rexceaiPwvzwaAvatar = json["avator"] as? String ?? ""
        self.rexceaiPwvzwaAboutMe = json["about"] as? String ?? ""
        self.rexceaiPwvzwaWalletBalance = json["coins"] as? Int ?? 0
        self.rexceaiPwvzwaIsDeleted = json["isdelete"] as? Int ?? 0

        // 数组转换（兼容 __NSArrayM）
        self.rexceaiPwvzwaFollowing = (json["follow"] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaFans = (json["fans"] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaBlacklist = (json["blockList"] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaLikePosts = (json["postLikeIds"] as? [Any])?.map { "\($0)" } ?? []
    }
    
    static func fromJsonArray(_ array: [[String: Any]]) -> [RexceaiPwvzwaUser] {
            return array.map { RexceaiPwvzwaUser(json: $0) }
        }
}

struct TargetUser: Codable {
    var userId: String
    var email: String
    var password: String
    var avator: String
    var name: String
    var about: String
    var coins: Int
    var follow: [String]
    var fans: [String]
    var blockList: [String]
    var postLikeIds: [String]
    var isdelete: Int
}


@MainActor
final class RexceaiPwvzwaUserViewModel: ObservableObject {

  @Published var users: [RexceaiPwvzwaUser] = []
  @Published var currentUser: RexceaiPwvzwaUser?
  @Published var userInfo: RexceaiPwvzwaUser?
    @Published var currentUserID: String = ""

  private let storage = OrinxntqoStorageManager.shared

  func getRexceaiPwvzwaUserInfoByUid(uid: String) {
    userInfo = storage.getUserById(userId: uid)
  }

  func returnRexceaiPwvzwaUserInfoById(userId: String) -> RexceaiPwvzwaUser? {
    storage.getUserById(userId: userId)
  }

  func loadLoginRexceaiPwvzwaUser() {
    users = storage.getUsers()

    let uid: String = storage.getCurrentUserId()
      currentUserID = uid
    currentUser = users.first { $0.rexceaiPwvzwaUserId == uid }
  }

  // 登录
  func loginByEmailAndPasswordRexceaiPwvzwa(email: String, password: String) -> RexceaiPwvzwaUser? {
    let users = storage.getUsers()
    guard
      let matchUser = users.first(where: {
        $0.rexceaiPwvzwaEmail == email && $0.rexceaiPwvzwaPassword == password && $0.rexceaiPwvzwaIsDeleted == 0
      })
    else {
      return nil
    }

    // 记录登录态
    storage.setCurrentUserId(matchUser.rexceaiPwvzwaUserId)
      currentUserID = matchUser.rexceaiPwvzwaUserId
    loadLoginRexceaiPwvzwaUser()
    return matchUser
  }

  // 游客登录
    func visitorLoginRexceaiPwvzwa() {
        
        let users = storage.getUsers()
        
        // ✅ 1. 查找已有游客（email & password 为空 + 未删除）
        if let existVisitor = users.first(where: {
            $0.rexceaiPwvzwaEmail.isEmpty &&
            $0.rexceaiPwvzwaPassword.isEmpty &&
            $0.rexceaiPwvzwaIsDeleted == 0
        }) {
            print(existVisitor)
//            print("✅ 使用已有游客:", existVisitor.rexceaiPwvzwaUserId)
            
            storage.setCurrentUserId(existVisitor.rexceaiPwvzwaUserId)
            loadLoginRexceaiPwvzwaUser()
            return
        }
        
        // ❌ 2. 没有游客 → 创建新游客
        let newId = "\(Int(Date().timeIntervalSince1970))" // ✅ 推荐用时间戳避免重复
        
        let newUser = RexceaiPwvzwaUser(
            rexceaiPwvzwaUserId: newId,
            rexceaiPwvzwaEmail: "",
            rexceaiPwvzwaPassword: "",
            rexceaiPwvzwaUserName: "Visitor_\(newId)",
            rexceaiPwvzwaAvatar: "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/vnewiaADefaultAva.png",
            rexceaiPwvzwaAboutMe: "",
            rexceaiPwvzwaFollowing: [],
            rexceaiPwvzwaFans: [],
            rexceaiPwvzwaBlacklist: [],
            rexceaiPwvzwaWalletBalance: 0,
            rexceaiPwvzwaLikePosts: [],
            rexceaiPwvzwaIsDeleted: 0
        )
        
        print("🆕 创建新游客:", newId)
        
        storage.addUser(user: newUser)
        storage.setCurrentUserId(newUser.rexceaiPwvzwaUserId)
        
        loadLoginRexceaiPwvzwaUser()
    }

  // 删除账号
  func deleteAccountRexceaiPwvzwa() {
      storage.removeCurrentUserAllWorks()
      storage.removeCurrentUserChatRooms()
      storage.removeCurrentUserAllComments()
      // ✅ 1. 标记删除
      storage.updateUser(uid: storage.getCurrentUserId()) { user in
          var newUser = user
          newUser.rexceaiPwvzwaIsDeleted = 1
          return newUser
      }
    storage.setCurrentUserId("")
      currentUserID = ""
    loadLoginRexceaiPwvzwaUser()
  }

  // 注册
  func registerRexceaiPwvzwa(email: String, password: String) -> RexceaiPwvzwaUser? {
    let users = storage.getUsers()
    guard
      users.first(where: { $0.rexceaiPwvzwaEmail == email }) == nil
    else {
      return nil
    }

    let newUser: RexceaiPwvzwaUser = RexceaiPwvzwaUser(
      rexceaiPwvzwaUserId: "\(users.count)",
      rexceaiPwvzwaEmail: email,
      rexceaiPwvzwaPassword: password,
      rexceaiPwvzwaUserName: "User_" + String(users.count),
      rexceaiPwvzwaAvatar: "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/vnewiaADefaultAva.png",
      rexceaiPwvzwaAboutMe: "",
      rexceaiPwvzwaFollowing: [],
      rexceaiPwvzwaFans: [],
      rexceaiPwvzwaBlacklist: [],
      rexceaiPwvzwaWalletBalance: 0,
      rexceaiPwvzwaLikePosts: [],
      rexceaiPwvzwaIsDeleted: 0
    )

    storage.addUser(user: newUser)
    storage.setCurrentUserId(newUser.rexceaiPwvzwaUserId)
    loadLoginRexceaiPwvzwaUser()
    return newUser
  }

  // 登出
  func logoutRexceaiPwvzwa() {
    storage.setCurrentUserId("")
    loadLoginRexceaiPwvzwaUser()
  }

  // 切换拉黑状态
  func toggleUserIsBlocked(blockUserId: String) {
    storage.updateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
      var newUser: RexceaiPwvzwaUser = user
      if newUser.rexceaiPwvzwaBlacklist.contains(blockUserId) {
        newUser.rexceaiPwvzwaBlacklist.removeAll { $0 == blockUserId }
      } else {
        newUser.rexceaiPwvzwaBlacklist.append(blockUserId)
      }

      return newUser
    }

    loadLoginRexceaiPwvzwaUser()
  }

  // 切换是否喜欢视频作品
  func toggleVideoIsLiked(_ videoId: String) {
    storage.updateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
      var newUser: RexceaiPwvzwaUser = user
      if newUser.rexceaiPwvzwaLikePosts.contains(videoId) {
        newUser.rexceaiPwvzwaLikePosts.removeAll { $0 == videoId }
          storage.decreaseLikeCount(workId: videoId)
      } else {
        newUser.rexceaiPwvzwaLikePosts.append(videoId)
          storage.increaseLikeCount(workId: videoId)
      }
      return newUser
    }
    loadLoginRexceaiPwvzwaUser()
  }


  // 更新用户钻石数
  func increaseUserDiamond(diamond: Int) {
    storage.updateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
      var newUser: RexceaiPwvzwaUser = user
      newUser.rexceaiPwvzwaWalletBalance = newUser.rexceaiPwvzwaWalletBalance + diamond
      return newUser
    }

    loadLoginRexceaiPwvzwaUser()
  }
}
