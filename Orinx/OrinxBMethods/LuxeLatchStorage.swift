
import Foundation
import Security

// MARK: - LuxeLatch Keys
enum LuxeLatchSecureKey {
    case luxeLatchDeviceId, password

    var key: String {
        switch self {
        case .luxeLatchDeviceId: return "luxeLatchDeviceId1"
        case .password: return "luxeLatchPassword1"
        }
    }
}

final class LuxeLatchSecureStore {

    static let shared = LuxeLatchSecureStore()
    private init() {}

    private func saveLuxeLatchSecureKey(_ value: String, for key: LuxeLatchSecureKey) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        delete(key) // 先删除旧值

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]

        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }

    private func readLuxeLatchSecureKey(_ key: LuxeLatchSecureKey) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var data: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &data)
        guard
            status == errSecSuccess,
            let resultData = data as? Data,
            let value = String(data: resultData, encoding: .utf8)
        else { return nil }
        return value
    }

    private func delete(_ key: LuxeLatchSecureKey) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key
        ]
        SecItemDelete(query as CFDictionary)
    }

    // MARK: - Secure Values
    var luxeLatchDeviceId: String {
        get { readLuxeLatchSecureKey(.luxeLatchDeviceId) ?? "" }
        set { saveLuxeLatchSecureKey(newValue, for: .luxeLatchDeviceId) }
    }

    var password: String {
        get { readLuxeLatchSecureKey(.password) ?? "" }
        set { saveLuxeLatchSecureKey(newValue, for: .password) }
    }
}

// MARK: - Ephemeral App Storage
enum LuxeLatchAppStorageKey {
  static let luxeLatchIsB = "luxeLatchIsB"
  static let luxeLatchPushToken = "luxeLatchPushToken"
  static let luxeLatchH5Url = "luxeLatchH5Url"
    static let luxeLatchUserToken = "luxeLatchUserToken"
}

final class LuxeLatchAppStorage {

  private static let ud = UserDefaults.standard

  static var luxeLatchIsB: Bool {
    get { ud.bool(forKey: LuxeLatchAppStorageKey.luxeLatchIsB) }
    set { ud.set(newValue, forKey: LuxeLatchAppStorageKey.luxeLatchIsB) }
  }
    
    static var luxeLatchUserToken: String {
      get { ud.string(forKey: LuxeLatchAppStorageKey.luxeLatchUserToken) ?? ""}
      set { ud.set(newValue, forKey: LuxeLatchAppStorageKey.luxeLatchUserToken) }
    }

  static var luxeLatchPushToken: String {
    get { ud.string(forKey: LuxeLatchAppStorageKey.luxeLatchPushToken) ?? "" }
    set { ud.set(newValue, forKey: LuxeLatchAppStorageKey.luxeLatchPushToken) }
  }

  static var luxeLatchH5Url: String {
    get { ud.string(forKey: LuxeLatchAppStorageKey.luxeLatchH5Url) ?? "" }
    set { ud.set(newValue, forKey: LuxeLatchAppStorageKey.luxeLatchH5Url) }
  }
}

var luxeLatchUsersOrderCode: String = ""
