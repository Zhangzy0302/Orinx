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
    
    var isRexceaiPwvzwaGuest: Bool {
        rexceaiPwvzwaEmail.isEmpty && rexceaiPwvzwaPassword.isEmpty
    }
    
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

private enum RexceaiPwvzwaUserJsonCipherKeys {
    static let ORINXVougeuserId = "Ab9CmsrFLx2e3c69BZ9oiQ=="
    static let ORINXVougeemail = "F9ClV7Uu+JOf4RZLolM05w=="
    static let ORINXVougepassword = "k/Pmaf8QL0TK16jgZHVm8w=="
    static let ORINXVougename = "Bt7506MqME5TfEW+lk2c1Q=="
    static let ORINXVougeavator = "z68PW7+8yO8WLhVu0p8lVA=="
    static let ORINXVougeabout = "v23jaxRROcmBeRKnwpM48Q=="
    static let ORINXVougecoins = "nFQxE/UaeyAhbS+ftYEMeg=="
    static let ORINXVougeisdelete = "7D/glk6OQNqneenqUR4tYw=="
    static let ORINXVougefollow = "n7la7raq+2LxyesrcJFJVQ=="
    static let ORINXVougefans = "bFpSPGai8KI0U4LpBK4ZCg=="
    static let ORINXVougeblockList = "USqbemV0c1uR1v9fP8bcxw=="
    static let ORINXVougepostLikeIds = "hf8Dw6z1tRhWnS6H0RGEZQ=="
}

private func rexceaiPwvzwaJsonKey(_ cipherText: String) -> String {
    XaiwgAesECBTool.xaiwgDecrypt(cipherText)
}

extension RexceaiPwvzwaUser {

    init(json: [String: Any]) {

        self.rexceaiPwvzwaUserId = "\(json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeuserId)] ?? "")"
        self.rexceaiPwvzwaEmail = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeemail)] as? String ?? ""
        self.rexceaiPwvzwaPassword = "\(json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougepassword)] ?? "")"
        self.rexceaiPwvzwaUserName = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougename)] as? String ?? ""
        self.rexceaiPwvzwaAvatar = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeavator)] as? String ?? ""
        self.rexceaiPwvzwaAboutMe = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeabout)] as? String ?? ""
        self.rexceaiPwvzwaWalletBalance = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougecoins)] as? Int ?? 0
        self.rexceaiPwvzwaIsDeleted = json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeisdelete)] as? Int ?? 0

        // 数组转换（兼容 __NSArrayM）
        self.rexceaiPwvzwaFollowing = (json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougefollow)] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaFans = (json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougefans)] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaBlacklist = (json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougeblockList)] as? [Any])?.map { "\($0)" } ?? []
        self.rexceaiPwvzwaLikePosts = (json[rexceaiPwvzwaJsonKey(RexceaiPwvzwaUserJsonCipherKeys.ORINXVougepostLikeIds)] as? [Any])?.map { "\($0)" } ?? []
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
    userInfo = storage.aelgohiAorGetUserById(userId: uid)
  }

  func returnRexceaiPwvzwaUserInfoById(userId: String) -> RexceaiPwvzwaUser? {
    storage.aelgohiAorGetUserById(userId: userId)
  }

  func loadLoginRexceaiPwvzwaUser() {
    users = storage.aelgohiAorGetUsers()

    let uid: String = storage.aelgohiAorGetCurrentUserId()
      currentUserID = uid
    currentUser = users.first { $0.rexceaiPwvzwaUserId == uid }
  }
    
    func isCurrentLoginUserGuestRexceaiPwvzwa() -> Bool {
        if let currentUser {
            return currentUser.isRexceaiPwvzwaGuest
        }
        
        let uid = storage.aelgohiAorGetCurrentUserId()
        guard !uid.isEmpty,
              let loginUser = storage.aelgohiAorGetUserById(userId: uid) else {
            return false
        }
        
        return loginUser.isRexceaiPwvzwaGuest
    }

  // 登录
  func loginByEmailAndPasswordRexceaiPwvzwa(email: String, password: String) -> RexceaiPwvzwaUser? {
    let users = storage.aelgohiAorGetUsers()
    guard
      let matchUser = users.first(where: {
        $0.rexceaiPwvzwaEmail == email && $0.rexceaiPwvzwaPassword == password && $0.rexceaiPwvzwaIsDeleted == 0
      })
    else {
      return nil
    }

    // 记录登录态
    storage.aelgohiAorSetCurrentUserId(matchUser.rexceaiPwvzwaUserId)
      currentUserID = matchUser.rexceaiPwvzwaUserId
    loadLoginRexceaiPwvzwaUser()
    return matchUser
  }

  // 游客登录
    func visitorLoginRexceaiPwvzwa() {
        
        let users = storage.aelgohiAorGetUsers()
        
        // ✅ 1. 查找已有游客（email & password 为空 + 未删除）
        if let existVisitor = users.first(where: {
            $0.rexceaiPwvzwaEmail.isEmpty &&
            $0.rexceaiPwvzwaPassword.isEmpty &&
            $0.rexceaiPwvzwaIsDeleted == 0
        }) {
            print(existVisitor)
//            print("✅ 使用已有游客:", existVisitor.rexceaiPwvzwaUserId)
            
            storage.aelgohiAorSetCurrentUserId(existVisitor.rexceaiPwvzwaUserId)
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
            rexceaiPwvzwaAvatar: "http://huanniuchat.oss-accelerate.aliyuncs.com/Orinx2026/ORINXDefaultAva.png",
            rexceaiPwvzwaAboutMe: "",
            rexceaiPwvzwaFollowing: [],
            rexceaiPwvzwaFans: [],
            rexceaiPwvzwaBlacklist: [],
            rexceaiPwvzwaWalletBalance: 0,
            rexceaiPwvzwaLikePosts: [],
            rexceaiPwvzwaIsDeleted: 0
        )
        
        print("🆕 创建新游客:", newId)
        
        storage.aelgohiAorAddUser(user: newUser)
        storage.aelgohiAorSetCurrentUserId(newUser.rexceaiPwvzwaUserId)
        
        loadLoginRexceaiPwvzwaUser()
    }

  // 删除账号
  func deleteAccountRexceaiPwvzwa() {
      storage.aelgohiAorRemoveCurrentUserAllWorks()
      storage.aelgohiAorRemoveCurrentUserChatRooms()
      storage.aelgohiAorRemoveCurrentUserAllComments()
      // ✅ 1. 标记删除
      storage.aelgohiAorUpdateUser(uid: storage.aelgohiAorGetCurrentUserId()) { user in
          var newUser = user
          newUser.rexceaiPwvzwaIsDeleted = 1
          return newUser
      }
    storage.aelgohiAorSetCurrentUserId("")
      currentUserID = ""
    loadLoginRexceaiPwvzwaUser()
  }

  // 注册
  func registerRexceaiPwvzwa(email: String, password: String) -> RexceaiPwvzwaUser? {
    let users = storage.aelgohiAorGetUsers()
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
      rexceaiPwvzwaAvatar: "http://huanniuchat.oss-accelerate.aliyuncs.com/Orinx2026/ORINXDefaultAva.png",
      rexceaiPwvzwaAboutMe: "",
      rexceaiPwvzwaFollowing: [],
      rexceaiPwvzwaFans: [],
      rexceaiPwvzwaBlacklist: [],
      rexceaiPwvzwaWalletBalance: 0,
      rexceaiPwvzwaLikePosts: [],
      rexceaiPwvzwaIsDeleted: 0
    )

    storage.aelgohiAorAddUser(user: newUser)
    storage.aelgohiAorSetCurrentUserId(newUser.rexceaiPwvzwaUserId)
    loadLoginRexceaiPwvzwaUser()
    return newUser
  }

  // 登出
  func logoutRexceaiPwvzwa() {
    storage.aelgohiAorSetCurrentUserId("")
    loadLoginRexceaiPwvzwaUser()
  }

  // 切换拉黑状态
  func toggleUserIsBlocked(blockUserId: String) {
    storage.aelgohiAorUpdateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
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
    storage.aelgohiAorUpdateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
      var newUser: RexceaiPwvzwaUser = user
      if newUser.rexceaiPwvzwaLikePosts.contains(videoId) {
        newUser.rexceaiPwvzwaLikePosts.removeAll { $0 == videoId }
          storage.aelgohiAorDecreaseLikeCount(workId: videoId)
      } else {
        newUser.rexceaiPwvzwaLikePosts.append(videoId)
          storage.aelgohiAorIncreaseLikeCount(workId: videoId)
      }
      return newUser
    }
    loadLoginRexceaiPwvzwaUser()
  }


  // 更新用户钻石数
  func increaseUserDiamond(diamond: Int) {
    storage.aelgohiAorUpdateUser(uid: currentUser!.rexceaiPwvzwaUserId) { user in
      var newUser: RexceaiPwvzwaUser = user
      newUser.rexceaiPwvzwaWalletBalance = newUser.rexceaiPwvzwaWalletBalance + diamond
      return newUser
    }

    loadLoginRexceaiPwvzwaUser()
  }
    
    // 获取所有未拉黑的用户
    func getAllNotBlockRexceaiPwvzwaUsers() -> [RexceaiPwvzwaUser] {
        let users = storage.aelgohiAorGetUsers()
        if let rexceaiPwvzwaMyInfo = currentUser {
            let allRexceaiPwvzwaUsers = users.filter{
                !rexceaiPwvzwaMyInfo.rexceaiPwvzwaBlacklist.contains($0.rexceaiPwvzwaUserId)
            }
            
            return allRexceaiPwvzwaUsers
        }
        return []
    }
}
