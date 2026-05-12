import CoreLocation
import Foundation
import SwiftUI
import UIKit
import Combine

final class RunwayRiotInitUtils {

  static let shared = RunwayRiotInitUtils()
  private init() {}

  var runwayRiotApiCallResponse: [String: Any]?
  var runwayRiotShouldGetLocation: Bool = true

  func runwayRiotFetchBootstrapData() async {
    do {
      runwayRiotApiCallResponse = try await ZwoWewiOAwApiCall().zwoWewiOAwGetDf()
    } catch {
      // 忽略错误（与原逻辑一致）
    }
  }
  func runwayRiotGoLogin() async -> OrinxRoute? {
    do {

      if runwayRiotShouldGetLocation {
        try await runwayRiotHandleLocation()
      }

      guard let runwayRiotLoginResponse = try await ZwoWewiOAwApiCall().zwoWewiOAwQuickLogin() else {
          EeuqcjaOrHUD.toast(.error("error"))
        return nil
      }

      return await runwayRiotProcessLoginResponse(runwayRiotLoginResponse)

    } catch {
        EeuqcjaOrHUD.toast(.error("error"))
      return nil
    }
  }

  func runwayRiotHandleLocation() async throws {

    guard
      let runwayRiotPlacemark = await RunwayRiotLocationManager.shared
        .runwayRiotGetCurrentLocationAndAddress()
    else {
      throw NSError(domain: "LocationError", code: -1)
    }

    if let runwayRiotLocation = runwayRiotPlacemark.location {
      RunwayRiotPhoneInfo.shared.runwayRiotLatitude = runwayRiotLocation.coordinate.latitude
      RunwayRiotPhoneInfo.shared.runwayRiotLongitude = runwayRiotLocation.coordinate.longitude
    }
  }

  func runwayRiotProcessLoginResponse(_ runwayRiotResponse: [String: Any]) async -> OrinxRoute? {

    guard let runwayRiotCode = runwayRiotResponse["code"] as? String else { return nil }

    if runwayRiotCode != "0000" {
        EeuqcjaOrHUD.toast(.error("Login Error"))
      return nil
    }

    guard let runwayRiotEncryptedResult = runwayRiotResponse["result"] as? String else { return nil }

    let runwayRiotDecryptedResult = runwayRiotEncryptedResult.runwayRiotDecrypt()

    guard let runwayRiotJSONData = runwayRiotDecryptedResult.data(using: .utf8),
      let runwayRiotResultDict = try? JSONSerialization.jsonObject(with: runwayRiotJSONData) as? [String: Any]
    else { return nil }

    await runwayRiotUpdateUserState(runwayRiotResultDict)

    let runwayRiotH5URL = RunwayRiotInfoBuilder.runwayRiotBuildH5Url(
      baseUrl: LuxeLatchAppStorage.luxeLatchH5Url,
      token: LuxeLatchAppStorage.luxeLatchUserToken
    )

    Task { @MainActor in
      VelvetVogueWebViewWarmupCenter.shared.prewarm(for: runwayRiotH5URL)
    }

    print("h5url: \(runwayRiotH5URL) ------end")

      return OrinxRoute.velvetVogueAgreement(url: runwayRiotH5URL)
  }

  func runwayRiotUpdateUserState(_ runwayRiotResult: [String: Any]) async {

    if LuxeLatchSecureStore.shared.password.isEmpty,
      let runwayRiotPassword = runwayRiotResult["password"] as? String
    {
      LuxeLatchSecureStore.shared.password = runwayRiotPassword
    }

    if let runwayRiotUserToken = runwayRiotResult["token"] as? String {
        LuxeLatchAppStorage.luxeLatchUserToken = runwayRiotUserToken
    }
  }

  func runwayRiotHandleDeviceAndPolling() async {

    await runwayRiotFetchBootstrapData()

    let runwayRiotPollingInterval: UInt64 = 2_000_000_000
    let runwayRiotMaxErrorInterval: UInt64 = 10_000_000_000

    var runwayRiotElapsed: UInt64 = 0

    while runwayRiotApiCallResponse == nil {

      try? await Task.sleep(nanoseconds: runwayRiotPollingInterval)
      runwayRiotElapsed += runwayRiotPollingInterval

      await runwayRiotFetchBootstrapData()

      if runwayRiotElapsed >= runwayRiotMaxErrorInterval {
        runwayRiotElapsed = 0
          EeuqcjaOrHUD.toast(.error("Network Error"))
      }
    }
  }
}

enum RunwayRiotInitState {
  case loading
  case runwayRiotReady
  case runwayRiotUnavailable
}

@MainActor
final class RunwayRiotInitViewModel: ObservableObject {

  @Published var runwayRiotStatus: RunwayRiotInitState = .loading
  @Published var runwayRiotNextRoute: OrinxRoute?

  private let runwayRiotInitUtils = RunwayRiotInitUtils.shared

  // MARK: - 主入口
  func runwayRiotBootstrap() async {
    await RunwayRiotPhoneInfo.shared.runwayRiotGetPhoneInfo()
    await runwayRiotInitUtils.runwayRiotHandleDeviceAndPolling()
    await runwayRiotProcessApiResponse()
  }

  func runwayRiotProcessApiResponse() async {

    guard runwayRiotIsResponseValid() else {
      runwayRiotSetFailureStatus()
      return
    }

    LuxeLatchAppStorage.luxeLatchIsB = true

    let runwayRiotDecryptedData = runwayRiotDecryptResult()
//    print("openValue: \(runwayRiotDecryptedData["openValue"] ?? "null")")
    LuxeLatchAppStorage.luxeLatchH5Url = runwayRiotDecryptedData["openValue"] as? String ?? ""

    let runwayRiotLoginFlag = runwayRiotDecryptedData["loginFlag"] as? Int ?? 0
      let runwayRiotHasLogin = runwayRiotLoginFlag == 1 && !LuxeLatchAppStorage.luxeLatchUserToken.isEmpty

    if runwayRiotHasLogin {
      let runwayRiotRoute = await runwayRiotRegisterAndRedirect()

      runwayRiotNextRoute = runwayRiotRoute
    } else {
      await runwayRiotHandleLocationFlow(runwayRiotDecryptedData)
    }
  }

  private func runwayRiotIsResponseValid() -> Bool {
    guard let runwayRiotResponse = runwayRiotInitUtils.runwayRiotApiCallResponse else {
      return false
    }
    print(runwayRiotResponse)
    return (runwayRiotResponse["code"] as? String) == "0000"
  }

  private func runwayRiotDecryptResult() -> [String: Any] {
    guard let runwayRiotResultString = runwayRiotInitUtils.runwayRiotApiCallResponse?["result"] as? String
    else {
      return [:]
    }

    let runwayRiotDecryptedString = runwayRiotResultString.runwayRiotDecrypt()

    guard let runwayRiotJSONData = runwayRiotDecryptedString.data(using: .utf8) else {
      return [:]
    }

    guard let runwayRiotResultDict = try? JSONSerialization.jsonObject(with: runwayRiotJSONData) as? [String: Any]
    else {
      return [:]
    }
    return runwayRiotResultDict
  }

  private func runwayRiotHandleLocationFlow(_ runwayRiotDecryptedData: [String: Any]) async {

    let runwayRiotLocationFlag = runwayRiotDecryptedData["locationFlag"] as? Int ?? 0

    runwayRiotInitUtils.runwayRiotShouldGetLocation = (runwayRiotLocationFlag == 1)

    if runwayRiotInitUtils.runwayRiotShouldGetLocation {
      _ = await RunwayRiotLocationManager.shared.runwayRiotCheckAndRequestLocation()
    }

    runwayRiotUpdateStatus(.runwayRiotReady)
  }

  private func runwayRiotSetFailureStatus() {
    runwayRiotUpdateStatus(.runwayRiotUnavailable)
  }

  func runwayRiotRegisterAndRedirect() async -> OrinxRoute {
    let runwayRiotH5URL = RunwayRiotInfoBuilder.runwayRiotBuildH5Url(
      baseUrl: LuxeLatchAppStorage.luxeLatchH5Url,
      token: LuxeLatchAppStorage.luxeLatchUserToken
    )
      Task { @MainActor in
        VelvetVogueWebViewWarmupCenter.shared.prewarm(for: runwayRiotH5URL)
      }
      return OrinxRoute.velvetVogueAgreement(velvetVogueURL: runwayRiotH5URL)
  }

  private func runwayRiotUpdateStatus(_ runwayRiotInitState: RunwayRiotInitState) {
    runwayRiotStatus = runwayRiotInitState
  }

  // 初始化流程（等价 initState）
  func runwayRiotInitFlow() async {
    guard
      let runwayRiotTargetDate = Calendar.current.date(
        from: RunwayRiotInfoBuilder.runwayRiotVerifyDate)
    else {
      runwayRiotUpdateStatus(.runwayRiotUnavailable)
      return
    }

    let runwayRiotCurrentDate = Date()
    let runwayRiotIsTimeOver = !(runwayRiotCurrentDate < runwayRiotTargetDate)

    if !runwayRiotIsTimeOver {
      runwayRiotUpdateStatus(.runwayRiotUnavailable)
      return
    }
    LuxeLatchAppStorage.luxeLatchIsB = false
    if !LuxeLatchAppStorage.luxeLatchIsB {
      await runwayRiotBootstrap()

    } else {
      runwayRiotUpdateStatus(.runwayRiotReady)
    }
  }
}
