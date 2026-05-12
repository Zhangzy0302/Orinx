
import AdjustSdk
import Alamofire
import Foundation
import StoreKit

final class ZwoWewiOAwApiCall {

  // MARK: - Base URL
  private let baseURL = "https://opi.ppbh0wdw.link"

  // MARK: - Headers
  private var headers: HTTPHeaders {
    [
      "Content-Type": "application/json",
      "appVersion": RunwayRiotInfoBuilder.runwayRiotAppVersion,
      "deviceNo": LuxeLatchSecureStore.shared.luxeLatchDeviceId,
      "pushToken": LuxeLatchAppStorage.luxeLatchPushToken,
      "loginToken": LuxeLatchAppStorage.luxeLatchUserToken,
      "appId": RunwayRiotInfoBuilder.runwayRiotAppId,
    ]
  }

  // MARK: - Session
  private lazy var session: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.headers = .default
    return Session(configuration: configuration)
  }()
}

extension ZwoWewiOAwApiCall {

  func zwoWewiOAwPayCall(
    purchaseID: String,
    serverVerificationData: String,
    orderCode: String
  ) async throws -> Bool {

    let body: [String: Any] = [
      "cakwKAkucsajt": purchaseID,
      "cl38jsLiUwwp": serverVerificationData,
      "befKwue28bnlpc": try jsonString(["orderCode": orderCode]),
    ]
    print("payload: \(body)")

    let data = try await zwoWewiOAwRequest(
      path: "/opi/v1/vjlo3jdLikjwp",
      body: body
    )
    print("pay code: \(data?["code"] ?? "null")")

    return data?["code"] as? String == "0000"
  }

  func zwoWewiOAwGetDf() async throws -> [String: Any]? {

    let btueLwuwlvPhoneInfo = RunwayRiotPhoneInfo.shared

    let body: [String: Any] = [
      "vada28rh98h21vd": 1,
      "veaLkjlieadn": btueLwuwlvPhoneInfo.runwayRiotIsVpnActive,
      "nLJdljJfnzce": btueLwuwlvPhoneInfo.runwayRiotLanguages,
      "bfjalHLwijaws": btueLwuwlvPhoneInfo.runwayRiotCoverAppList,
      "gesaLhjvueqt": btueLwuwlvPhoneInfo.runwayRiotTimezone,
      "Wjvijqljkvjek": btueLwuwlvPhoneInfo.runwayRiotKeyboards,
      "debug": 1,
    ]
      print(body)
      
    return try await zwoWewiOAwRequest(
      path: "/opi/v1/hgwqkIJlkfieo",
      body: body
    )
  }

  func zwoWewiOAwQuickLogin() async throws -> [String: Any]? {

    let btueLwuwlvPhoneInfo = RunwayRiotPhoneInfo.shared

    let vnwhLAjxalAdID = await Adjust.adid()
    var body: [String: Any] = [
        "gqqv83nlsuLJga": vnwhLAjxalAdID ?? "",  // adjust ID
        "veqh347kjavd": LuxeLatchSecureStore.shared.password,  // password
        "sdawvnnquywhggdn": LuxeLatchSecureStore.shared.luxeLatchDeviceId,
        "wascwmkibv": [
        "countryCode": btueLwuwlvPhoneInfo.runwayRiotCountryCode,
        "latitude": btueLwuwlvPhoneInfo.runwayRiotLatitude,
        "longitude": btueLwuwlvPhoneInfo.runwayRiotLongitude,
      ],
    ]

    if !LuxeLatchSecureStore.shared.password.isEmpty {
      body["veqh347kjavd"] = LuxeLatchSecureStore.shared.password
    }

    return try await zwoWewiOAwRequest(
      path: "/opi/v1/ghjlJJuvoieal",
      body: body
    )
  }

  func zwoWewiOAwLoadingTimeRecord(_ loadingTime: Int) async throws -> [String: Any]? {

    let body: [String: Any] = [
      "vcaw38fhaoiUIjvo": "\(loadingTime)"
    ]

    return try await zwoWewiOAwRequest(
      path: "/opi/v1/fqdiJLkjfoio2dt",
      body: body
    )
  }
}

extension ZwoWewiOAwApiCall {

  fileprivate func zwoWewiOAwRequest(
    path: String,
    body: [String: Any]
  ) async throws -> [String: Any]? {

    let jsonData = try JSONSerialization.data(withJSONObject: body)

    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
      return nil
    }

    // 🔐 AES CBC 加密 → hex
    let encryptedString = jsonString.runwayRiotEncode()

    let response = try await session.request(
      baseURL + path,
      method: .post,
      parameters: nil,
      encoding: RawStringEncoding(string: encryptedString),
      headers: headers
    )
    .serializingData()
    .value

    return try zwoWewiOAwParseResponse(response)
  }

  fileprivate func zwoWewiOAwParseResponse(_ data: Data) throws -> [String: Any]? {
    let object = try JSONSerialization.jsonObject(with: data)

    if let dict = object as? [String: Any] {
      return dict
    }

    if let string = object as? String,
      let data = string.data(using: .utf8)
    {
      return try JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

    return nil
  }

  fileprivate func jsonString(_ dict: [String: Any]) throws -> String {
    let data = try JSONSerialization.data(withJSONObject: dict)
    return String(data: data, encoding: .utf8) ?? ""
  }
}

struct RawStringEncoding: ParameterEncoding {

  let string: String

  func encode(
    _ urlRequest: URLRequestConvertible,
    with parameters: Parameters?
  ) throws -> URLRequest {

    var zwoWewiOAwRequest = try urlRequest.asURLRequest()
    zwoWewiOAwRequest.httpBody = string.data(using: .utf8)
    return zwoWewiOAwRequest
  }
}
