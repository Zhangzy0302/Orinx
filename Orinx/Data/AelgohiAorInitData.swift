import Foundation
import SwiftUI

final class OrinxntqoStorageManager {

  static let shared = OrinxntqoStorageManager()
  private init() {}

  private let storage = UserDefaults.standard

  // MARK: - Keys
  private enum Keys {
    static let rexceaiPwvzwaUsers: String = "rexceaiPwvzwaUsers"
    static let vieoaVNneqoWorks: String = "vieoaVNneqoWorks"
    static let saascieSeigComments: String = "saascieSeigComments"
    static let zswqoveiNiegChatRooms: String = "zswqoveiNiegChatRooms"
    static let zswqoveiNiegMessages: String = "zswqoveiNiegMessages"
    static let orinxCurrentUId: String = "orinxCurrentUId"
  }
}

extension OrinxntqoStorageManager {

  func initializeAllDefaults() {
    initializeUsersIfNeeded()
    initializeWorksIfNeeded()
    initializeCommentsIfNeeded()
    initializeChatRoomsIfNeeded()
    initializeMessagesIfNeeded()
  }

}

//User CRUD & 登录态
extension OrinxntqoStorageManager {

  private func initializeUsersIfNeeded() {
    guard storage.data(forKey: Keys.rexceaiPwvzwaUsers) == nil else { return }

    let users: [RexceaiPwvzwaUser] = [
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "0",
        rexceaiPwvzwaEmail: "test@gmail.com",
        rexceaiPwvzwaPassword: "654321",
        rexceaiPwvzwaUserName: "Barton",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_0.jpg",
        rexceaiPwvzwaAboutMe: "Make friends with the wind, and keep company with the road.",
        rexceaiPwvzwaFollowing: ["1", "2"],
        rexceaiPwvzwaFans: ["4", "5"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "1",
        rexceaiPwvzwaEmail: "Carlos@gmail.com",
        rexceaiPwvzwaPassword: "wi28ja29jad",
        rexceaiPwvzwaUserName: "Carlos",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_1.jpg",
        rexceaiPwvzwaAboutMe: "Ride into the wilderness, without caring about the destination.",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "2",
        rexceaiPwvzwaEmail: "Willisasd@gmail.com",
        rexceaiPwvzwaPassword: "2u8hd8aks",
        rexceaiPwvzwaUserName: "Willis",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_2.jpg",
        rexceaiPwvzwaAboutMe: "Those who chase the wind are always on the road.",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "3",
        rexceaiPwvzwaEmail: "32asdAw3a@gmail.com",
        rexceaiPwvzwaPassword: "wqsd23sad",
        rexceaiPwvzwaUserName: "Haley",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_3.jpg",
        rexceaiPwvzwaAboutMe: "The road lies beneath our feet, and the wind follows behind us.",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: [],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "4",
        rexceaiPwvzwaEmail: "32fgdgehwv@gmail.com",
        rexceaiPwvzwaPassword: "d21g2waas",
        rexceaiPwvzwaUserName: "Christy",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_4.jpg",
        rexceaiPwvzwaAboutMe: "Our hearts yearn for the vast wilderness, and our steps never cease.",
        rexceaiPwvzwaFollowing: ["0"],
        rexceaiPwvzwaFans: [],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "5",
        rexceaiPwvzwaEmail: "sfaAd3ga@gmail.com",
        rexceaiPwvzwaPassword: "jy64f2sasd",
        rexceaiPwvzwaUserName: "Sophia",
        rexceaiPwvzwaAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/kfukuruKuw_5.jpg",
        rexceaiPwvzwaAboutMe: "With a lifetime of passion, we never stop moving forward.",
        rexceaiPwvzwaFollowing: ["0"],
        rexceaiPwvzwaFans: [],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
    ]

    save(users, forKey: Keys.rexceaiPwvzwaUsers)
  }

  func getUsers() -> [RexceaiPwvzwaUser] {
    load([RexceaiPwvzwaUser].self, forKey: Keys.rexceaiPwvzwaUsers, default: [])
  }

  func saveUsers(_ users: [RexceaiPwvzwaUser]) {
    save(users, forKey: Keys.rexceaiPwvzwaUsers)
  }

  func getUserById(userId: String) -> RexceaiPwvzwaUser? {
    let allUsers = getUsers()
    // 查找第一个 userId 匹配的用户
    return allUsers.first { $0.rexceaiPwvzwaUserId == userId }
  }

  func updateUser(
    uid: String,
    update: (RexceaiPwvzwaUser) -> RexceaiPwvzwaUser
  ) {
    var users = getUsers()
    guard let index = users.firstIndex(where: { $0.rexceaiPwvzwaUserId == uid }) else { return }
    users[index] = update(users[index])
    saveUsers(users)
  }

  // add user
  func addUser(user: RexceaiPwvzwaUser) {
    var users: [RexceaiPwvzwaUser] = getUsers()
    users.append(user)
    saveUsers(users)
  }

  // MARK: Login State
  func setCurrentUserId(_ uid: String) {
    storage.set(uid, forKey: Keys.orinxCurrentUId)
  }

  func getCurrentUserId() -> String {
    return storage.object(forKey: Keys.orinxCurrentUId) as? String ?? ""
  }
    
    func markCurrentUserDeleted() {
        let currentUserId = getCurrentUserId()
        
        updateUser(uid: currentUserId) { user in
            var updated = user
            updated.rexceaiPwvzwaIsDeleted = 1
            return updated
        }
    }

}

//work
extension OrinxntqoStorageManager {

  private func initializeWorksIfNeeded() {
    guard storage.data(forKey: Keys.vieoaVNneqoWorks) == nil else { return }

    let vieoaVNneqoWorks: [VieoaVNneqoVideo] = [
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "0",
        vieoaVNneqoCreatorId: "0",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "At 6 pm, watch the setting sun and allow yourself to relax.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_0.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_0.png"],
        vieoaVNneqoLikeCount: 397,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "1",
        vieoaVNneqoCreatorId: "1",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent:
          "Just a guy that loves riding bikes",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_1.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_1.png"],
        vieoaVNneqoLikeCount: 727,
        vieoaVNneqoCommentCount: 2),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "2",
        vieoaVNneqoCreatorId: "2",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent:
          "Keep moving forward, for all the beauty lies on the journey.",
        vieoaVNneqoTitleType: 2,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_2.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_2.png"],
        vieoaVNneqoLikeCount: 986,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "3",
        vieoaVNneqoCreatorId: "3",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "First outdoor ride of the season is going to hit the spot",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_3.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_3.png"],
        vieoaVNneqoLikeCount: 657,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "4",
        vieoaVNneqoCreatorId: "4",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "Taking a ride on a bike while enjoying the breeze.",
        vieoaVNneqoTitleType: 2,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_4.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_4.png"],
        vieoaVNneqoLikeCount: 1397,
        vieoaVNneqoCommentCount: 0),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "5",
        vieoaVNneqoCreatorId: "5",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "Everyone’s favorite descent on the bike",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_5.mp4",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/iwioaAciw_cover_5.png"],
        vieoaVNneqoLikeCount: 221,
        vieoaVNneqoCommentCount: 0),
      //image
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "6",
        vieoaVNneqoCreatorId: "2",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "Conquer every uphill stretch, enjoy every downhill ride.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_0.jpg",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_1.jpg",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_2.png"],
        vieoaVNneqoLikeCount: 397,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "7",
        vieoaVNneqoCreatorId: "1",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "The wheels trample through the wind and rain, and love surmounts all difficulties.",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_3.jpg",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_4.png",
           "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_5.jpg"],
        vieoaVNneqoLikeCount: 523,
        vieoaVNneqoCommentCount: 2),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "8",
        vieoaVNneqoCreatorId: "0",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "Set out, it is always the most meaningful thing.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_6.jpg",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Kael2026/tyauelkwAwi_7.jpg"],
        vieoaVNneqoLikeCount: 584,
        vieoaVNneqoCommentCount: 0),
    ]
    save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
  }

  func getWorks() -> [VieoaVNneqoVideo] {
    load([VieoaVNneqoVideo].self, forKey: Keys.vieoaVNneqoWorks, default: [])
  }
    
    func saveWorks(_ works: [VieoaVNneqoVideo]) {
        save(works, forKey: Keys.vieoaVNneqoWorks)
    }

  func getWorksNotBlock() -> [VieoaVNneqoVideo] {
    let allWorks = getWorks()
    let currentUserInfo = getUserById(userId: getCurrentUserId())

    // 用 $0 指代遍历的每个 work 元素
    return allWorks.filter {
      guard let blacklist = currentUserInfo?.rexceaiPwvzwaBlacklist else { return true }
      return !blacklist.contains($0.vieoaVNneqoCreatorId)
    }
  }

  func getWorkDetailById(workId: String) -> VieoaVNneqoVideo? {
    let allWorks = getWorks()
    guard
      let workDetail = allWorks.first(where: {
        $0.vieoaVNneqoWorkId == workId
      })
    else {
      return nil
    }

    return workDetail
  }

  func addWork(_ work: VieoaVNneqoVideo) {
    var vieoaVNneqoWorks = getWorks()
    vieoaVNneqoWorks.insert(work, at: 0)
    save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
  }

  func updateWork(_ work: VieoaVNneqoVideo) {
    var vieoaVNneqoWorks = getWorks()
    guard
      let index = vieoaVNneqoWorks.firstIndex(where: {
        $0.vieoaVNneqoWorkId == work.vieoaVNneqoWorkId
      })
    else {
      return
    }

    vieoaVNneqoWorks[index] = work
  }
    
    // like + 1
    func increaseLikeCount(workId: String) {
        var vieoaVNneqoWorks = getWorks()
        
        guard let index = vieoaVNneqoWorks.firstIndex(where: {
            $0.vieoaVNneqoWorkId == workId
        }) else {
            return
        }
        
        vieoaVNneqoWorks[index].vieoaVNneqoLikeCount += 1
        
        save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
    }
    
    // like - 1
    func decreaseLikeCount(workId: String) {
        var vieoaVNneqoWorks = getWorks()
        
        guard let index = vieoaVNneqoWorks.firstIndex(where: {
            $0.vieoaVNneqoWorkId == workId
        }) else {
            return
        }
        
        if vieoaVNneqoWorks[index].vieoaVNneqoLikeCount > 0 {
            vieoaVNneqoWorks[index].vieoaVNneqoLikeCount -= 1
        }
        
        save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
    }

    //删除
    func removeCurrentUserAllWorks() {
        let currentUserId = getCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allWorks = getWorks()
        
        // 过滤掉当前用户的作品
        let filteredWorks = allWorks.filter {
            $0.vieoaVNneqoCreatorId != currentUserId
        }
        
        save(filteredWorks, forKey: Keys.vieoaVNneqoWorks)
    }
}

//Comment
extension OrinxntqoStorageManager {

  private func initializeCommentsIfNeeded() {
    guard storage.data(forKey: Keys.saascieSeigComments) == nil else { return }
      
      let saascieSeigCommentList: [SaascieSeigComment] = [
        SaascieSeigComment(
            saascieSeigCommentId: "0",
            saascieSeigCommentWorkId: "0",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "Wow, the sunset is absolutely stunning!"),
        SaascieSeigComment(
            saascieSeigCommentId: "1",
            saascieSeigCommentWorkId: "1",
            saascieSeigCommentUserId: "5",
            saascieSeigCommentText: "The scenery is really beautiful."),
        SaascieSeigComment(
            saascieSeigCommentId: "2",
            saascieSeigCommentWorkId: "2",
            saascieSeigCommentUserId: "3",
            saascieSeigCommentText: "Great!"),
        SaascieSeigComment(
            saascieSeigCommentId: "3",
            saascieSeigCommentWorkId: "3",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "You are stunning!"),
        SaascieSeigComment(
            saascieSeigCommentId: "4",
            saascieSeigCommentWorkId: "1",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "beautiful day for a ride I just finished mine keep pushing it cycling Sister"),
        SaascieSeigComment(
            saascieSeigCommentId: "5",
            saascieSeigCommentWorkId: "6",
            saascieSeigCommentUserId: "4",
            saascieSeigCommentText: "I need to feel this again"),
        SaascieSeigComment(
            saascieSeigCommentId: "6",
            saascieSeigCommentWorkId: "7",
            saascieSeigCommentUserId: "3",
            saascieSeigCommentText: "Like the female lead in the movie."),
        SaascieSeigComment(
            saascieSeigCommentId: "7",
            saascieSeigCommentWorkId: "7",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "The nice weather makes going for a bike ride really relaxing."),
        SaascieSeigComment(
            saascieSeigCommentId: "8",
            saascieSeigCommentWorkId: "8",
            saascieSeigCommentUserId: "1",
            saascieSeigCommentText: "Cool!"),
      ]
    save(saascieSeigCommentList, forKey: Keys.saascieSeigComments)
  }
    
    func saveComments(_ commentsList: [SaascieSeigComment]) {
        save(commentsList, forKey: Keys.saascieSeigComments)
    }

  func getComments(for workId: String) -> [SaascieSeigComment] {
    load([SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
      .filter { $0.saascieSeigCommentWorkId == workId }
  }

  // 获取所有评论
  func getAllComments() -> [SaascieSeigComment] {
    load([SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
  }

  func addComment(_ comment: SaascieSeigComment) {
    var saascieSeigComments = load(
      [SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
    saascieSeigComments.append(comment)
    save(saascieSeigComments, forKey: Keys.saascieSeigComments)
  }
    
    func removeCurrentUserAllComments() {
        let currentUserId = getCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allComments = getAllComments()
        
        // 过滤掉当前用户的评论
        let filteredComments = allComments.filter {
            $0.saascieSeigCommentUserId != currentUserId
        }
        
        save(filteredComments, forKey: Keys.saascieSeigComments)
    }
}

//ChatRoom & Message
extension OrinxntqoStorageManager {

  private func initializeChatRoomsIfNeeded() {
    guard storage.data(forKey: Keys.zswqoveiNiegChatRooms) == nil else { return }
    save([ZswqoveiNiegChatRoom](), forKey: Keys.zswqoveiNiegChatRooms)
  }
    
    func saveChatRooms(_ chatRooms: [ZswqoveiNiegChatRoom]) {
        save(chatRooms, forKey: Keys.zswqoveiNiegChatRooms)
    }
    
    func saveChatMessageList(_ msgList: [ZswqoveiNiegMessage]) {
        save(msgList, forKey: Keys.zswqoveiNiegMessages)
    }

  func getChatRooms() -> [ZswqoveiNiegChatRoom] {
    load([ZswqoveiNiegChatRoom].self, forKey: Keys.zswqoveiNiegChatRooms, default: [])
  }

  // 创建聊天室
  func createChatRoom(chatUsersId: [String]) -> ZswqoveiNiegChatRoom {
    var zswqoveiNiegChatRooms: [ZswqoveiNiegChatRoom] = getChatRooms()
    let newRoom: ZswqoveiNiegChatRoom = ZswqoveiNiegChatRoom(
      zswqoveiNiegRoomId: "\(zswqoveiNiegChatRooms.count)",
      zswqoveiNiegChatUsers: chatUsersId,
      zswqoveiNiegLastSendMsg: "",
      zswqoveiNiegLastSendTime: Date(),
      zswqoveiNiegLastSendUser: getCurrentUserId(),
      zswqoveiNiegUnreadCount: 0
    )
    zswqoveiNiegChatRooms.append(newRoom)
    save(zswqoveiNiegChatRooms, forKey: Keys.zswqoveiNiegChatRooms)

    return newRoom
  }
  // 更新聊天室
  func updateChatRoom(roomId: String, update: (ZswqoveiNiegChatRoom) -> ZswqoveiNiegChatRoom) {
    var zswqoveiNiegChatRooms: [ZswqoveiNiegChatRoom] = getChatRooms()
    guard let index = zswqoveiNiegChatRooms.firstIndex(where: { $0.zswqoveiNiegRoomId == roomId })
    else {
      return
    }
    zswqoveiNiegChatRooms[index] = update(zswqoveiNiegChatRooms[index])
    save(zswqoveiNiegChatRooms, forKey: Keys.zswqoveiNiegChatRooms)
  }
    
    func removeCurrentUserChatRooms() {
        let currentUserId = getCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allRooms = getChatRooms()
        
        // 过滤掉包含当前用户的聊天室
        let filteredRooms = allRooms.filter {
            !$0.zswqoveiNiegChatUsers.contains(currentUserId)
        }
        
        save(filteredRooms, forKey: Keys.zswqoveiNiegChatRooms)
    }

    // message
  private func initializeMessagesIfNeeded() {
    guard storage.data(forKey: Keys.zswqoveiNiegMessages) == nil else { return }
    save([ZswqoveiNiegMessage](), forKey: Keys.zswqoveiNiegMessages)
  }
    
    func getAllMessages() -> [ZswqoveiNiegMessage] {
      return load([ZswqoveiNiegMessage].self, forKey: Keys.zswqoveiNiegMessages, default: [])
    }

  func getMessages(roomId: String) -> [ZswqoveiNiegMessage] {
    return load([ZswqoveiNiegMessage].self, forKey: Keys.zswqoveiNiegMessages, default: [])
      .filter { $0.zswqoveiNiegRoomId == roomId }
  }
    

  func addMessage(_ msg: ZswqoveiNiegMessage) {
    var zswqoveiNiegMessages = load(
      [ZswqoveiNiegMessage].self, forKey: Keys.zswqoveiNiegMessages, default: [])
    zswqoveiNiegMessages.append(msg)
    save(zswqoveiNiegMessages, forKey: Keys.zswqoveiNiegMessages)
  }
}

//底层通用存取（核心）
extension OrinxntqoStorageManager {

  fileprivate func save<T: Codable>(_ value: T, forKey key: String) {
    if let data = try? JSONEncoder().encode(value) {
      storage.set(data, forKey: key)
    }
  }

  fileprivate func load<T: Codable>(
    _ type: T.Type,
    forKey key: String,
    default defaultValue: T
  ) -> T {
    guard
      let data = storage.data(forKey: key),
      let value = try? JSONDecoder().decode(type, from: data)
    else {
      return defaultValue
    }
    return value
  }
}
