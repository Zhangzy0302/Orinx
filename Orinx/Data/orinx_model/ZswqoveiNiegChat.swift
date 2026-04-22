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

extension ZswqoveiNiegChatRoom {

    init(json: [String: Any]) {

        self.zswqoveiNiegRoomId = "\(json["chatId"] ?? "")"
        self.zswqoveiNiegLastSendMsg = json["lastSendContent"] as? String ?? ""
        self.zswqoveiNiegLastSendUser = "\(json["lastSendUserId"] ?? "")"
        self.zswqoveiNiegUnreadCount = json["unreadMsgCount"] as? Int ?? 0

        // 👇 用户数组
        self.zswqoveiNiegChatUsers = (json["chatUserIds"] as? [Any])?
            .map { "\($0)" } ?? []

        // 👇 时间转换（String → Date）
        let timeStr = json["lastSendTime"] as? String ?? ""
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

        self.zswqoveiNiegMsgId = "\(json["msgId"] ?? "")"
        self.zswqoveiNiegRoomId = "\(json["chatId"] ?? "")"
        self.zswqoveiNiegSendUserId = "\(json["userId"] ?? "")"

        self.zswqoveiNiegTextMsg = json["sendContent"] as? String ?? ""
        self.zswqoveiNiegImageMsg = json["sendPicUrl"] as? String ?? ""

        // 👇 时间
        let timeStr = json["sendTime"] as? String ?? ""
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
      let chatRoomInfo = storage.getChatRooms().first(where: {
        $0.zswqoveiNiegRoomId == chatRoomId
      })
    else {
      return nil
    }
    guard
      let chatUserId = chatRoomInfo.zswqoveiNiegChatUsers.first(where: {
        $0 != storage.getCurrentUserId()
      })
    else {
      return nil
    }

    return chatUserId
  }

  func getMyZswqoveiNiegChatRoomsNotBlock() -> [ZswqoveiNiegChatRoom] {
    let bhajaAllChatRooms = storage.getChatRooms()
    let loginUserId = storage.getCurrentUserId()
    guard let myInfo = storage.getUserById(userId: loginUserId) else {
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
    return storage.getUserById(userId: chatUserId)
  }

}
