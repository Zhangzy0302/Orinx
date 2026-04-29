import Foundation
import SwiftUI

private enum AelgohiAorCipherVault {
  static let aelgohiAorAssetBaseURL =
    "http://huanniuchat.oss-accelerate.aliyuncs.com/Orinx2026/"
}

private func aelgohiAorAssetURL(_ path: String) -> String {
    AelgohiAorCipherVault.aelgohiAorAssetBaseURL + path
}

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
        rexceaiPwvzwaEmail: "orinx@gmail.com",
        rexceaiPwvzwaPassword: "123123",
        rexceaiPwvzwaUserName: "Lebreeon",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_0.jpg"),
        rexceaiPwvzwaAboutMe: "Fashion is my daily language, and every outfit tells a little story",
        rexceaiPwvzwaFollowing: ["4", "5"],
        rexceaiPwvzwaFans: ["4", "5"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "1",
        rexceaiPwvzwaEmail: "ariawdsxa@gmail.com",
        rexceaiPwvzwaPassword: "u3iashs8f",
        rexceaiPwvzwaUserName: "aria",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_1.jpg"),
        rexceaiPwvzwaAboutMe: "Styling simple pieces into standout looks is kind of my thing.",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "2",
        rexceaiPwvzwaEmail: "cvq3i8ha2@gmail.com",
        rexceaiPwvzwaPassword: "cva3dat3",
        rexceaiPwvzwaUserName: "Nicole",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_2.jpg"),
        rexceaiPwvzwaAboutMe: "I believe great outfits start with confidence and a good eye for detail",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "3",
        rexceaiPwvzwaEmail: "xc*2hkajs@gmail.com",
        rexceaiPwvzwaPassword: "c2uhiaKAuw3",
        rexceaiPwvzwaUserName: "RyderSketch",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_3.jpg"),
        rexceaiPwvzwaAboutMe: "Soft tones, clean fits, and effortless vibes are my style essentials",
        rexceaiPwvzwaFollowing: [],
        rexceaiPwvzwaFans: [],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "4",
        rexceaiPwvzwaEmail: "baKzuku@gmail.com",
        rexceaiPwvzwaPassword: "Kkx829hsa",
        rexceaiPwvzwaUserName: "OllieVerse",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_4.jpg"),
        rexceaiPwvzwaAboutMe: "Dressing well is not about trends, it is about expressing who you are",
        rexceaiPwvzwaFollowing: ["0"],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
      RexceaiPwvzwaUser(
        rexceaiPwvzwaUserId: "5",
        rexceaiPwvzwaEmail: "xc28jhvra@gmail.com",
        rexceaiPwvzwaPassword: "xcak2us",
        rexceaiPwvzwaUserName: "kitsue_",
        rexceaiPwvzwaAvatar:
          aelgohiAorAssetURL("ORINXUAva_5.jpg"),
        rexceaiPwvzwaAboutMe: "I mix comfort with style and call it my everyday aesthetic",
        rexceaiPwvzwaFollowing: ["0"],
        rexceaiPwvzwaFans: ["0"],
        rexceaiPwvzwaBlacklist: [],
        rexceaiPwvzwaWalletBalance: 0,
        rexceaiPwvzwaLikePosts: [],
        rexceaiPwvzwaIsDeleted: 0
      ),
    ]

    save(users, forKey: Keys.rexceaiPwvzwaUsers)
  }

  func aelgohiAorGetUsers() -> [RexceaiPwvzwaUser] {
    load([RexceaiPwvzwaUser].self, forKey: Keys.rexceaiPwvzwaUsers, default: [])
  }

  func aelgohiAorSaveUsers(_ users: [RexceaiPwvzwaUser]) {
    save(users, forKey: Keys.rexceaiPwvzwaUsers)
  }

  func aelgohiAorGetUserById(userId: String) -> RexceaiPwvzwaUser? {
    let allUsers = aelgohiAorGetUsers()
    // 查找第一个 userId 匹配的用户
    return allUsers.first { $0.rexceaiPwvzwaUserId == userId }
  }

  func aelgohiAorUpdateUser(
    uid: String,
    update: (RexceaiPwvzwaUser) -> RexceaiPwvzwaUser
  ) {
    var users = aelgohiAorGetUsers()
    guard let index = users.firstIndex(where: { $0.rexceaiPwvzwaUserId == uid }) else { return }
    users[index] = update(users[index])
    aelgohiAorSaveUsers(users)
  }

  // add user
  func aelgohiAorAddUser(user: RexceaiPwvzwaUser) {
    var users: [RexceaiPwvzwaUser] = aelgohiAorGetUsers()
    users.append(user)
    aelgohiAorSaveUsers(users)
  }

  // MARK: Login State
  func aelgohiAorSetCurrentUserId(_ uid: String) {
    storage.set(uid, forKey: Keys.orinxCurrentUId)
  }

  func aelgohiAorGetCurrentUserId() -> String {
    return storage.object(forKey: Keys.orinxCurrentUId) as? String ?? ""
  }
    
    func isCurrentLoginUserGuestRexceaiPwvzwa() -> Bool {
        let currentUserId = aelgohiAorGetCurrentUserId()
        guard !currentUserId.isEmpty,
              let currentUser = aelgohiAorGetUserById(userId: currentUserId) else {
            return false
        }
        
        return currentUser.isRexceaiPwvzwaGuest
    }
    
    func aelgohiAorMarkCurrentUserDeleted() {
        let currentUserId = aelgohiAorGetCurrentUserId()
        
        aelgohiAorUpdateUser(uid: currentUserId) { user in
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
        vieoaVNneqoTextContent: "I love this trend ",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          aelgohiAorAssetURL("ORINXPosVideo_0.mp4"),
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPosVideo_covr_0.png")],
        vieoaVNneqoLikeCount: 397,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "1",
        vieoaVNneqoCreatorId: "1",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent:
          "joining this fit trend <3 my new fav way to film fit checks",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          aelgohiAorAssetURL("ORINXPosVideo_1.mp4"),
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPosVideo_covr_1.png")],
        vieoaVNneqoLikeCount: 1713,
        vieoaVNneqoCommentCount: 2),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "2",
        vieoaVNneqoCreatorId: "2",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent:
          "Fit checkk",
        vieoaVNneqoTitleType: 2,
        vieoaVNneqoVideoUrl:
          aelgohiAorAssetURL("ORINXPosVideo_2.mp4"),
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPosVideo_covr_2.png")],
        vieoaVNneqoLikeCount: 362,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "3",
        vieoaVNneqoCreatorId: "3",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "Who are you in this?",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          aelgohiAorAssetURL("ORINXPosVideo_3.mp4"),
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPosVideo_covr_3.png")],
        vieoaVNneqoLikeCount: 422,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "4",
        vieoaVNneqoCreatorId: "4",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "Hey there",
        vieoaVNneqoTitleType: 2,
        vieoaVNneqoVideoUrl:
          aelgohiAorAssetURL("ORINXPosVideo_4.mp4"),
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPosVideo_covr_4.png")],
        vieoaVNneqoLikeCount: 1397,
        vieoaVNneqoCommentCount: 0),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "5",
        vieoaVNneqoCreatorId: "5",
        vieoaVNneqoType: 1,
        vieoaVNneqoTextContent: "The combination of classic men's clothing and practical workwear emphasizes the simplification of details for a more comfortable body feel, showcasing calmness and elegance. In terms of color, it blends transparent and pure warm apricot with light blue, retro and elegant dark green with brown red, creating a layered visual melody. The printing adopts a semi-structured and semi realistic technique, drawing inspiration from ancient paintings and depicting the graceful movements of animals and plants in a pure white environment. In terms of materials, materials such as cotton corduroy and textured wool are used to restore the soft and smooth texture of the rough ground and the crisp texture of walking on it in both visual and tactile senses, reproducing the dynamic poetic effect of snow light on the environment in the single product.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
          [aelgohiAorAssetURL("ORINXPostPic_0.jpg"),
          aelgohiAorAssetURL("ORINXPostPic_1.jpg"),
          aelgohiAorAssetURL("ORINXPostPic_2.jpg")],
        vieoaVNneqoLikeCount: 456,
        vieoaVNneqoCommentCount: 0),
      //image
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "6",
        vieoaVNneqoCreatorId: "2",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "The fusion of timeless western attire and contemporary casual elements highlights the refinement of simplicity for a more relaxed fit, exuding confidence and sophistication. In terms of color, it harmonizes crisp white with classic denim blue, and rich brown with subtle metallic accents, crafting a visually engaging contrast. The styling incorporates minimalist yet functional accessories, drawing inspiration from modern urban trends while showcasing sleek, understated elegance in a neutral setting. In terms of materials, the use of supple leather, breathable cotton, and sturdy denim aims to replicate the tactile and visual textures of rugged terrains and the effortless flow of movement, evoking a dynamic yet serene ambiance in every piece.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
            [aelgohiAorAssetURL("ORINXPostPic_3.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_4.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_5.jpg")],
        vieoaVNneqoLikeCount: 957,
        vieoaVNneqoCommentCount: 1),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "7",
        vieoaVNneqoCreatorId: "1",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "The ensemble merges bold, contemporary streetwear with a touch of vintage flair, emphasizing a daring yet chic aesthetic that exudes self-assurance and individuality. In terms of color, the monochromatic black palette creates a sleek, unified look, punctuated by metallic accents that add a hint of edgy sophistication. The outfit features a cropped, tied shirt that reveals a subtle hint of skin, paired with high-waisted, wide-leg trousers that elongate the silhouette. The addition of a studded belt and fingerless gloves enhances the rebellious, rock-inspired vibe. The details, such as the visible tattoos and the casual placement of the bag on the ground, contribute to an effortlessly cool, urban charm, while the textures of the fabrics add depth and richness to the overall look.",
        vieoaVNneqoTitleType: 1,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
            [aelgohiAorAssetURL("ORINXPostPic_6.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_7.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_8.jpg")],
        vieoaVNneqoLikeCount: 763,
        vieoaVNneqoCommentCount: 2),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "8",
        vieoaVNneqoCreatorId: "0",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "The newsboy cap has a vintage - inspired and somewhat casual yet stylish vibe. It can be paired with a wide range of outfits. In the picture, it is matched with a brown checkered blazer and dark trousers, creating a sophisticated and coordinated look. It can also go well with jeans and a simple sweater for a more laid - back style, or with a long coat for a fashionable winter ensemble.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
            [aelgohiAorAssetURL("ORINXPostPic_9.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_10.jpg")],
        vieoaVNneqoLikeCount: 352,
        vieoaVNneqoCommentCount: 0),
      VieoaVNneqoVideo(
        vieoaVNneqoWorkId: "9",
        vieoaVNneqoCreatorId: "5",
        vieoaVNneqoType: 0,
        vieoaVNneqoTextContent: "Generally, such leather shoes are made of high - quality leather for the upper. Leather is flexible and durable, able to withstand the wear and tear of daily wearing. The sole may be made of a composite material such as rubber, which provides certain elasticity and non - slip performance while ensuring thickness. These leather shoes are versatile in style and have a vintage charm. In the picture, they are paired with an off - white shirt, brown shorts, and white socks, creating a look that combines a school - style and a casual vibe. They can also be matched with dress pants or jeans. When paired with dress pants, they look more formal and steady, suitable for business occasions; when paired with jeans, they can create a casual yet fashionable daily outfit.",
        vieoaVNneqoTitleType: 0,
        vieoaVNneqoVideoUrl:
          "",
        vieoaVNneqoPic:
            [aelgohiAorAssetURL("ORINXPostPic_11.jpg"),
            aelgohiAorAssetURL("ORINXPostPic_12.jpg"),
             aelgohiAorAssetURL("ORINXPostPic_13.jpg")],
        vieoaVNneqoLikeCount: 543,
        vieoaVNneqoCommentCount: 0),
    ]
    save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
  }

  func aelgohiAorGetWorks() -> [VieoaVNneqoVideo] {
    load([VieoaVNneqoVideo].self, forKey: Keys.vieoaVNneqoWorks, default: [])
  }
    
    func aelgohiAorSaveWorks(_ works: [VieoaVNneqoVideo]) {
        save(works, forKey: Keys.vieoaVNneqoWorks)
    }

  func aelgohiAorGetWorksNotBlock() -> [VieoaVNneqoVideo] {
    let allWorks = aelgohiAorGetWorks()
    let currentUserInfo = aelgohiAorGetUserById(userId: aelgohiAorGetCurrentUserId())

    // 用 $0 指代遍历的每个 work 元素
    return allWorks.filter {
      guard let blacklist = currentUserInfo?.rexceaiPwvzwaBlacklist else { return true }
      return !blacklist.contains($0.vieoaVNneqoCreatorId)
    }
  }

  func aelgohiAorGetWorkDetailById(workId: String) -> VieoaVNneqoVideo? {
    let allWorks = aelgohiAorGetWorks()
    guard
      let workDetail = allWorks.first(where: {
        $0.vieoaVNneqoWorkId == workId
      })
    else {
      return nil
    }

    return workDetail
  }

  func aelgohiAorAddWork(_ work: VieoaVNneqoVideo) {
    var vieoaVNneqoWorks = aelgohiAorGetWorks()
    vieoaVNneqoWorks.insert(work, at: 0)
    save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
  }

  func aelgohiAorUpdateWork(_ work: VieoaVNneqoVideo) {
    var vieoaVNneqoWorks = aelgohiAorGetWorks()
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
    func aelgohiAorIncreaseLikeCount(workId: String) {
        var vieoaVNneqoWorks = aelgohiAorGetWorks()
        
        guard let index = vieoaVNneqoWorks.firstIndex(where: {
            $0.vieoaVNneqoWorkId == workId
        }) else {
            return
        }
        
        vieoaVNneqoWorks[index].vieoaVNneqoLikeCount += 1
        
        save(vieoaVNneqoWorks, forKey: Keys.vieoaVNneqoWorks)
    }
    
    // like - 1
    func aelgohiAorDecreaseLikeCount(workId: String) {
        var vieoaVNneqoWorks = aelgohiAorGetWorks()
        
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
    func aelgohiAorRemoveCurrentUserAllWorks() {
        let currentUserId = aelgohiAorGetCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allWorks = aelgohiAorGetWorks()
        
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
            saascieSeigCommentText: "Love how effortlessly you pulled this look together"),
        SaascieSeigComment(
            saascieSeigCommentId: "1",
            saascieSeigCommentWorkId: "1",
            saascieSeigCommentUserId: "5",
            saascieSeigCommentText: "This outfit is such a perfect mix of chic and comfy"),
        SaascieSeigComment(
            saascieSeigCommentId: "2",
            saascieSeigCommentWorkId: "2",
            saascieSeigCommentUserId: "3",
            saascieSeigCommentText: "You always make simple pieces look so stylish"),
        SaascieSeigComment(
            saascieSeigCommentId: "3",
            saascieSeigCommentWorkId: "3",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "The color combination here is absolutely beautiful"),
        SaascieSeigComment(
            saascieSeigCommentId: "4",
            saascieSeigCommentWorkId: "1",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "Obsessed with the vibe of this whole outfit"),
        SaascieSeigComment(
            saascieSeigCommentId: "5",
            saascieSeigCommentWorkId: "6",
            saascieSeigCommentUserId: "4",
            saascieSeigCommentText: "This look is clean, classy, and so well styled"),
        SaascieSeigComment(
            saascieSeigCommentId: "6",
            saascieSeigCommentWorkId: "7",
            saascieSeigCommentUserId: "3",
            saascieSeigCommentText: "You really know how to make every detail work"),
        SaascieSeigComment(
            saascieSeigCommentId: "7",
            saascieSeigCommentWorkId: "7",
            saascieSeigCommentUserId: "2",
            saascieSeigCommentText: "Such a cool outfit, it looks both trendy and timeless"),
        SaascieSeigComment(
            saascieSeigCommentId: "8",
            saascieSeigCommentWorkId: "8",
            saascieSeigCommentUserId: "1",
            saascieSeigCommentText: "Everything about this styling is just on point"),
      ]
    save(saascieSeigCommentList, forKey: Keys.saascieSeigComments)
  }
    
    func aelgohiAorSaveComments(_ commentsList: [SaascieSeigComment]) {
        save(commentsList, forKey: Keys.saascieSeigComments)
    }

  func aelgohiAorGetComments(for workId: String) -> [SaascieSeigComment] {
    load([SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
      .filter { $0.saascieSeigCommentWorkId == workId }
  }

  // 获取所有评论
  func aelgohiAorGetAllComments() -> [SaascieSeigComment] {
    load([SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
  }

  func aelgohiAorAddComment(_ comment: SaascieSeigComment) {
    var saascieSeigComments = load(
      [SaascieSeigComment].self, forKey: Keys.saascieSeigComments, default: [])
    saascieSeigComments.append(comment)
    save(saascieSeigComments, forKey: Keys.saascieSeigComments)
  }
    
    func aelgohiAorRemoveCurrentUserAllComments() {
        let currentUserId = aelgohiAorGetCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allComments = aelgohiAorGetAllComments()
        
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
    
    func aelgohiAorSaveChatRooms(_ chatRooms: [ZswqoveiNiegChatRoom]) {
        save(chatRooms, forKey: Keys.zswqoveiNiegChatRooms)
    }
    
    func aelgohiAorSaveChatMessageList(_ msgList: [ZswqoveiNiegMessage]) {
        save(msgList, forKey: Keys.zswqoveiNiegMessages)
    }

  func aelgohiAorGetChatRooms() -> [ZswqoveiNiegChatRoom] {
    load([ZswqoveiNiegChatRoom].self, forKey: Keys.zswqoveiNiegChatRooms, default: [])
  }

  // 创建聊天室
  func aelgohiAorCreateChatRoom(chatUsersId: [String]) -> ZswqoveiNiegChatRoom {
    var zswqoveiNiegChatRooms: [ZswqoveiNiegChatRoom] = aelgohiAorGetChatRooms()
    let newRoom: ZswqoveiNiegChatRoom = ZswqoveiNiegChatRoom(
      zswqoveiNiegRoomId: "\(zswqoveiNiegChatRooms.count)",
      zswqoveiNiegChatUsers: chatUsersId,
      zswqoveiNiegLastSendMsg: "",
      zswqoveiNiegLastSendTime: Date(),
      zswqoveiNiegLastSendUser: aelgohiAorGetCurrentUserId(),
      zswqoveiNiegUnreadCount: 0
    )
    zswqoveiNiegChatRooms.append(newRoom)
    save(zswqoveiNiegChatRooms, forKey: Keys.zswqoveiNiegChatRooms)

    return newRoom
  }
  // 更新聊天室
  func aelgohiAorUpdateChatRoom(roomId: String, update: (ZswqoveiNiegChatRoom) -> ZswqoveiNiegChatRoom) {
    var zswqoveiNiegChatRooms: [ZswqoveiNiegChatRoom] = aelgohiAorGetChatRooms()
    guard let index = zswqoveiNiegChatRooms.firstIndex(where: { $0.zswqoveiNiegRoomId == roomId })
    else {
      return
    }
    zswqoveiNiegChatRooms[index] = update(zswqoveiNiegChatRooms[index])
    save(zswqoveiNiegChatRooms, forKey: Keys.zswqoveiNiegChatRooms)
  }
    
    func aelgohiAorRemoveCurrentUserChatRooms() {
        let currentUserId = aelgohiAorGetCurrentUserId()
        
        guard !currentUserId.isEmpty else { return }
        
        let allRooms = aelgohiAorGetChatRooms()
        
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
    
    func aelgohiAorGetAllMessages() -> [ZswqoveiNiegMessage] {
      return load([ZswqoveiNiegMessage].self, forKey: Keys.zswqoveiNiegMessages, default: [])
    }

  func aelgohiAorGetMessages(roomId: String) -> [ZswqoveiNiegMessage] {
    return load([ZswqoveiNiegMessage].self, forKey: Keys.zswqoveiNiegMessages, default: [])
      .filter { $0.zswqoveiNiegRoomId == roomId }
  }
    

  func aelgohiAorAddMessage(_ msg: ZswqoveiNiegMessage) {
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
