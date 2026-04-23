import SwiftUI
import Combine

struct ZswqoveiNiegChatRoom: Codable, Identifiable, Equatable {

  let zswqoveiNiegRoomId: String
  var zswqoveiNiegChatUsers: [String]
  var zswqoveiNiegLastSendMsg: String
  var zswqoveiNiegLastSendTime: Date
    var zswqoveiNiegLastSendUser: String
  var zswqoveiNiegUnreadCount: Int

  var id: String { zswqoveiNiegRoomId }
    
    func toTargetChatRoom() -> TargetChatRoom {
        return TargetChatRoom(
            chatId: zswqoveiNiegRoomId,
            chatUserIds: zswqoveiNiegChatUsers,
            lastSendContent: zswqoveiNiegLastSendMsg,
            lastSendTime: zswqoveiNiegLastSendTime.toJSString(),
            unreadMsgCount: zswqoveiNiegUnreadCount,
            lastSendUserId: zswqoveiNiegLastSendUser
        )
    }
}

private enum ZswqoveiNiegChatRoomJsonCipherKeys {
    static let ORINXVougechatId = "lwgxCN4FASzSW3aitKhVkg=="
    static let ORINXVougelastSendContent = "yGpV3+qkPLctixBvxkU0pw=="
    static let ORINXVougelastSendUserId = "ZUq/2E/HgjRTM6lv11B3Bw=="
    static let ORINXVougeunreadMsgCount = "8erL8KvfDyEm4jKFBbywSA=="
    static let ORINXVougechatUserIds = "HnGbSygAN+U+RrnwIDIFIA=="
    static let ORINXVougelastSendTime = "X85G+a+PqS71EsA4s6vUfw=="
}

private enum ZswqoveiNiegMessageJsonCipherKeys {
    static let ORINXVougemsgId = "ryzua/q9NaMhFW2hOOgWaw=="
    static let ORINXVougechatId = "lwgxCN4FASzSW3aitKhVkg=="
    static let ORINXVougeuserId = "Ab9CmsrFLx2e3c69BZ9oiQ=="
    static let ORINXVougesendContent = "n0ljuhPPVwNwdYwC9qLVww=="
    static let ORINXVougesendPicUrl = "RD100ySzaxMl0FS7fs271g=="
    static let ORINXVougesendTime = "lgQvzfjmSXMr2lnMs50LJg=="
}

private func zswqoveiNiegJsonKey(_ cipherText: String) -> String {
    XaiwgAesECBTool.xaiwgDecrypt(cipherText)
}

extension ZswqoveiNiegChatRoom {

    init(json: [String: Any]) {

        self.zswqoveiNiegRoomId = "\(json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougechatId)] ?? "")"
        self.zswqoveiNiegLastSendMsg = json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougelastSendContent)] as? String ?? ""
        self.zswqoveiNiegLastSendUser = "\(json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougelastSendUserId)] ?? "")"
        self.zswqoveiNiegUnreadCount = json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougeunreadMsgCount)] as? Int ?? 0

        // 👇 用户数组
        self.zswqoveiNiegChatUsers = (json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougechatUserIds)] as? [Any])?
            .map { "\($0)" } ?? []

        // 👇 时间转换（String → Date）
        let timeStr = json[zswqoveiNiegJsonKey(ZswqoveiNiegChatRoomJsonCipherKeys.ORINXVougelastSendTime)] as? String ?? ""
        self.zswqoveiNiegLastSendTime = Date.fromJSString(timeStr)
    }
    
    static func fromJsonArray(_ array: [[String: Any]]) -> [ZswqoveiNiegChatRoom] {
            array.map { ZswqoveiNiegChatRoom(json: $0) }
        }
}

struct TargetChatRoom: Codable {
    let chatId: String
    let chatUserIds: [String]
    let lastSendContent: String
    let lastSendTime: String
    let unreadMsgCount: Int
    let lastSendUserId: String
}

struct ZswqoveiNiegMessage: Codable, Identifiable, Equatable {

  let zswqoveiNiegMsgId: String

  var zswqoveiNiegRoomId: String
  var zswqoveiNiegSendUserId: String
  var zswqoveiNiegTextMsg: String
  var zswqoveiNiegImageMsg: String
  var zswqoveiNiegDate: Date
    
    var id: String { zswqoveiNiegMsgId }
    
    func toTargetMessage() -> TargetMessage {
        return TargetMessage(
            msgId: zswqoveiNiegMsgId,
            chatId: zswqoveiNiegRoomId,
            userId: zswqoveiNiegSendUserId,
            sendContent: zswqoveiNiegTextMsg,
            sendPicUrl: zswqoveiNiegImageMsg,
            sendTime: zswqoveiNiegDate.toJSString()
        )
    }
}

extension ZswqoveiNiegMessage {

    init(json: [String: Any]) {

        self.zswqoveiNiegMsgId = "\(json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougemsgId)] ?? "")"
        self.zswqoveiNiegRoomId = "\(json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougechatId)] ?? "")"
        self.zswqoveiNiegSendUserId = "\(json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougeuserId)] ?? "")"

        self.zswqoveiNiegTextMsg = json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougesendContent)] as? String ?? ""
        self.zswqoveiNiegImageMsg = json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougesendPicUrl)] as? String ?? ""

        // 👇 时间
        let timeStr = json[zswqoveiNiegJsonKey(ZswqoveiNiegMessageJsonCipherKeys.ORINXVougesendTime)] as? String ?? ""
        self.zswqoveiNiegDate = Date.fromJSString(timeStr)
    }
    
    static func fromJsonArray(_ array: [[String: Any]]) -> [ZswqoveiNiegMessage] {
            array.map { ZswqoveiNiegMessage(json: $0) }
        }
}

struct TargetMessage: Codable {
    let msgId: String
    let chatId: String
    let userId: String
    let sendContent: String
    let sendPicUrl: String
    let sendTime: String
}

extension Date {
    
    func toJSString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
    
    static func fromJSString(_ str: String) -> Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter.date(from: str) ?? Date()
        }
}

@MainActor
final class ZswqoveiNiegChatViewModel: ObservableObject {

  @Published var myChatRooms: [ZswqoveiNiegChatRoom] = []
  @Published var chatMessageList: [ZswqoveiNiegMessage] = []

  private let storage = OrinxntqoStorageManager.shared

  func getZswqoveiNiegChatUserId(chatRoomId: String) -> String? {
    guard
      let chatRoomInfo = storage.aelgohiAorGetChatRooms().first(where: {
        $0.zswqoveiNiegRoomId == chatRoomId
      })
    else {
      return nil
    }
    guard
      let chatUserId = chatRoomInfo.zswqoveiNiegChatUsers.first(where: {
        $0 != storage.aelgohiAorGetCurrentUserId()
      })
    else {
      return nil
    }

    return chatUserId
  }

  func getMyZswqoveiNiegChatRoomsNotBlock() -> [ZswqoveiNiegChatRoom] {
    let bhajaAllChatRooms = storage.aelgohiAorGetChatRooms()
    let loginUserId = storage.aelgohiAorGetCurrentUserId()
    guard let myInfo = storage.aelgohiAorGetUserById(userId: loginUserId) else {
      return []
    }

    let myZswqoveiNiegChatRooms = bhajaAllChatRooms.filter {
      if let chatUserId = getZswqoveiNiegChatUserId(chatRoomId: $0.zswqoveiNiegRoomId) {
        $0.zswqoveiNiegChatUsers.contains(loginUserId)
          && !myInfo.rexceaiPwvzwaBlacklist.contains(chatUserId)
      } else {
        false
      }

    }
      
      return myZswqoveiNiegChatRooms
  }

  // 获取聊天用户信息
  func getZswqoveiNiegChatUserInfo(chatRoomId: String) -> RexceaiPwvzwaUser? {
    guard let chatUserId = getZswqoveiNiegChatUserId(chatRoomId: chatRoomId) else {
      return nil
    }
    return storage.aelgohiAorGetUserById(userId: chatUserId)
  }

}
