
import CommonCrypto
import CoreLocation
import Foundation
import Network
import SwiftUI
import SystemConfiguration.CaptiveNetwork
import UIKit
import Combine

extension String {

  private static let dravKey = "h2dxrw3vz0452dmy"
  private static let dravIV = "s92i49w37r9xhd14"

  func runwayRiotEncode() -> String {
    guard let runwayRiotSourceData = self.data(using: .utf8),
      let runwayRiotEncryptedData = runwayRiotAesCrypt(
        data: runwayRiotSourceData,
        operation: CCOperation(kCCEncrypt)
      )
    else {
      return ""
    }

    return runwayRiotEncryptedData.map { String(format: "%02x", $0) }.joined()
  }

  func runwayRiotDecrypt() -> String {
    guard let encryptedData = Data(hexString: self),
      let runwayRiotDecryptedData = runwayRiotAesCrypt(
        data: encryptedData,
        operation: CCOperation(kCCDecrypt)
      ),
      let runwayRiotDecryptedString = String(data: runwayRiotDecryptedData, encoding: .utf8)
    else {
      return ""
    }

    return runwayRiotDecryptedString
  }

  private func runwayRiotAesCrypt(
    data runwayRiotSourceData: Data,
    operation runwayRiotOperation: CCOperation
  ) -> Data? {

    let runwayRiotKeyData = Self.dravKey.data(using: .utf8)!
    let runwayRiotIVData = Self.dravIV.data(using: .utf8)!

    let runwayRiotDataLength = runwayRiotSourceData.count
    let runwayRiotOutLength = runwayRiotDataLength + kCCBlockSizeAES128

    var runwayRiotOutBytes = Data(count: runwayRiotOutLength)
    var runwayRiotFinalLength = 0

    let runwayRiotCryptStatus = runwayRiotOutBytes.withUnsafeMutableBytes { runwayRiotOutBytesPtr -> CCCryptorStatus in

      guard let runwayRiotOutBase = runwayRiotOutBytesPtr.baseAddress else { return CCCryptorStatus(kCCMemoryFailure) }

      return runwayRiotSourceData.withUnsafeBytes { runwayRiotDataPtr in
        runwayRiotKeyData.withUnsafeBytes { runwayRiotKeyPtr in
          runwayRiotIVData.withUnsafeBytes { runwayRiotIVPtr in

            CCCrypt(
              runwayRiotOperation,
              CCAlgorithm(kCCAlgorithmAES),
              CCOptions(kCCOptionPKCS7Padding),
              runwayRiotKeyPtr.baseAddress,
              kCCKeySizeAES128,
              runwayRiotIVPtr.baseAddress,
              runwayRiotDataPtr.baseAddress,
              runwayRiotDataLength,
              runwayRiotOutBase,
              runwayRiotOutLength,
              &runwayRiotFinalLength
            )
          }
        }
      }
    }

    guard runwayRiotCryptStatus == kCCSuccess else { return nil }

    return runwayRiotOutBytes.prefix(runwayRiotFinalLength)
  }
}

extension Data {
  init?(hexString runwayRiotHexString: String) {
    let runwayRiotByteLength = runwayRiotHexString.count / 2
    var runwayRiotHexData = Data(capacity: runwayRiotByteLength)

    var runwayRiotIndex = runwayRiotHexString.startIndex
    for _ in 0..<runwayRiotByteLength {
      let runwayRiotNextIndex = runwayRiotHexString.index(runwayRiotIndex, offsetBy: 2)
      guard runwayRiotNextIndex <= runwayRiotHexString.endIndex else { return nil }

      let runwayRiotHexBytes = runwayRiotHexString[runwayRiotIndex..<runwayRiotNextIndex]
      guard let runwayRiotByteValue = UInt8(runwayRiotHexBytes, radix: 16) else { return nil }

      runwayRiotHexData.append(runwayRiotByteValue)
      runwayRiotIndex = runwayRiotNextIndex
    }

    self = runwayRiotHexData
  }
}

class RunwayRiotInfoBuilder {

    static let runwayRiotAppId: String = "11189307"
    static let runwayRiotAppVersion: String = "1.1.0"
    
    static let runwayRiotVerifyDate: DateComponents = DateComponents(
        year: 2026, month: 5, day: 13, hour: 9
      )

  static func runwayRiotBuildH5Url(
    baseUrl runwayRiotBaseURL: String,
    token runwayRiotUserToken: String
  ) -> String {
    let runwayRiotTimestamp = Int(Date().timeIntervalSince1970 * 1000)

    let runwayRiotOpenParams: [String: Any] = [
      "token": runwayRiotUserToken,
      "timestamp": runwayRiotTimestamp,
    ]
    print(runwayRiotUserToken)
    guard let runwayRiotJSONData = try? JSONSerialization.data(withJSONObject: runwayRiotOpenParams),
      let runwayRiotJSONString = String(data: runwayRiotJSONData, encoding: .utf8)
    else {
      return ""
    }

    let runwayRiotEncodedParams = runwayRiotJSONString.runwayRiotEncode()

    return "\(runwayRiotBaseURL)?openParams=\(runwayRiotEncodedParams)&appId=\(runwayRiotAppId)"
  }
}

class RunwayRiotLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {

  static let shared = RunwayRiotLocationManager()
  @Published var runwayRiotShowLocationDialog: Bool = false
  private let runwayRiotCoreLocationManager = CLLocationManager()
  private var runwayRiotLocationContinuation: CheckedContinuation<CLLocation, Error>?

  override init() {
    super.init()
    runwayRiotCoreLocationManager.delegate = self
    runwayRiotCoreLocationManager.desiredAccuracy = kCLLocationAccuracyBest
  }

  func runwayRiotGetCurrentLocationAndAddress() async -> CLPlacemark? {

    let runwayRiotPermissionGranted = await runwayRiotCheckAndRequestLocation()
    if !runwayRiotPermissionGranted { return nil }

    do {
      let runwayRiotLocation = try await runwayRiotGetCurrentLocation()
      let runwayRiotPlacemark = try await reverseGeocode(runwayRiotLocation)
      return runwayRiotPlacemark
    } catch {
        EeuqcjaOrHUD.toast(.error("Positioning failed"))
      return nil
    }
  }

  func runwayRiotCheckAndRequestLocation() async -> Bool {

    // 1️⃣ 检查系统定位开关
    guard CLLocationManager.locationServicesEnabled() else {
      await showPermissionDialog()

      if !CLLocationManager.locationServicesEnabled() {
        showLocationServiceDisabledToast()
        return false
      }
      return false
    }

    // 2️⃣ 检查权限
    let runwayRiotAuthorizationStatus = runwayRiotCoreLocationManager.authorizationStatus

    if runwayRiotAuthorizationStatus == .denied || runwayRiotAuthorizationStatus == .restricted {
      await showPermissionDialog()

      let runwayRiotNewAuthorizationStatus = runwayRiotCoreLocationManager.authorizationStatus
      if runwayRiotNewAuthorizationStatus == .denied || runwayRiotNewAuthorizationStatus == .restricted {
        return false
      }
    }

    if runwayRiotAuthorizationStatus == .notDetermined {
      runwayRiotCoreLocationManager.requestWhenInUseAuthorization()
      return true
    }

    return true
  }

  private func runwayRiotGetCurrentLocation() async throws -> CLLocation {
    try await withCheckedThrowingContinuation { runwayRiotLocationContinuation in
      self.runwayRiotLocationContinuation = runwayRiotLocationContinuation
      runwayRiotCoreLocationManager.requestLocation()
    }
  }

  func locationManager(
    _ runwayRiotLocationManager: CLLocationManager,
    didUpdateLocations runwayRiotLocations: [CLLocation]
  ) {

    guard let runwayRiotLocation = runwayRiotLocations.first else {
      runwayRiotLocationContinuation?.resume(throwing: NSError())
      return
    }

    runwayRiotLocationContinuation?.resume(returning: runwayRiotLocation)
    runwayRiotLocationContinuation = nil
  }

  func locationManager(
    _ runwayRiotLocationManager: CLLocationManager,
    didFailWithError runwayRiotError: Error
  ) {

    runwayRiotLocationContinuation?.resume(throwing: runwayRiotError)
    runwayRiotLocationContinuation = nil
  }

  private func reverseGeocode(_ runwayRiotLocation: CLLocation) async throws -> CLPlacemark? {

    try await withCheckedThrowingContinuation { runwayRiotContinuation in

      CLGeocoder().reverseGeocodeLocation(runwayRiotLocation) { runwayRiotPlacemarks, runwayRiotError in

        if let runwayRiotError = runwayRiotError {
          runwayRiotContinuation.resume(throwing: runwayRiotError)
          return
        }

        runwayRiotContinuation.resume(returning: runwayRiotPlacemarks?.first)
      }
    }
  }

  private func showLocationServiceDisabledToast() {
      EeuqcjaOrHUD.toast(.error("Please enable system location services."))
  }

  @MainActor
  private func showPermissionDialog() async {
    // 这里触发你的 SwiftUI 弹窗
    runwayRiotShowLocationDialog = true
  }
}

class RunwayRiotPhoneInfo {

  static let shared = RunwayRiotPhoneInfo()

  var runwayRiotLanguages: [String] = []
  var runwayRiotCountryCode: String = ""
  var runwayRiotLatitude: Double = 0
  var runwayRiotLongitude: Double = 0
  var runwayRiotCoverAppList: [String] = []
  var runwayRiotKeyboards: [String] = []
  var runwayRiotTimezone: String = ""
  var runwayRiotIsVpnActive: Int = 0

  func runwayRiotEnsureDeviceId() async -> String {
    if !LuxeLatchSecureStore.shared.luxeLatchDeviceId.isEmpty {
      return LuxeLatchSecureStore.shared.luxeLatchDeviceId
    }

    let runwayRiotDeviceId = await runwayRiotGetDeviceId(
      appId: RunwayRiotInfoBuilder.runwayRiotAppId
    )
    LuxeLatchSecureStore.shared.luxeLatchDeviceId = runwayRiotDeviceId
    return runwayRiotDeviceId
  }

  func runwayRiotGetPhoneInfo() async {

    await withTaskGroup(of: Void.self) { runwayRiotTaskGroup in

      runwayRiotTaskGroup.addTask { await self.runwayRiotGetLanguages() }
      runwayRiotTaskGroup.addTask { await self.runwayRiotGetTimezone() }
      runwayRiotTaskGroup.addTask { await self.runwayRiotGetInstalledApps() }
      runwayRiotTaskGroup.addTask { await self.runwayRiotCheckVPN() }
      runwayRiotTaskGroup.addTask {
        await self.runwayRiotGetSystemKeyboards()
      }
      runwayRiotTaskGroup.addTask {
        _ = await self.runwayRiotEnsureDeviceId()
      }
      
    }
  }

  func runwayRiotGetLanguages() async {
    self.runwayRiotLanguages = Locale.preferredLanguages
  }

  func runwayRiotGetTimezone() async {
    self.runwayRiotTimezone = TimeZone.current.identifier
  }

  func runwayRiotCheckVPN() async {

    var runwayRiotIsVPNEnabled = false

    if let runwayRiotProxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
      let runwayRiotScopedSettings = runwayRiotProxySettings["__SCOPED__"] as? [String: Any]
    {

      for runwayRiotScopeKey in runwayRiotScopedSettings.keys {
        if runwayRiotScopeKey.contains("tap") || runwayRiotScopeKey.contains("tun") || runwayRiotScopeKey.contains("ppp")
          || runwayRiotScopeKey.contains("ipsec")
        {
          runwayRiotIsVPNEnabled = true
          break
        }
      }
    }

    self.runwayRiotIsVpnActive = runwayRiotIsVPNEnabled ? 1 : 0
  }

  func runwayRiotGetInstalledApps() async {

    var runwayRiotInstalledApps: [String] = []

    for runwayRiotApp in runwayRiotApps {
      if let runwayRiotAppURL = URL(string: "\(runwayRiotApp.scheme)://"),
        await UIApplication.shared.canOpenURL(runwayRiotAppURL)
      {
        runwayRiotInstalledApps.append(runwayRiotApp.name)
      }
    }

    self.runwayRiotCoverAppList = runwayRiotInstalledApps
  }

  func runwayRiotGetSystemKeyboards() async {
      await MainActor.run {
              let runwayRiotActiveLanguages = UITextInputMode.activeInputModes.compactMap {
                  $0.primaryLanguage
              }
              self.runwayRiotKeyboards = runwayRiotActiveLanguages
          }
  }

  func runwayRiotGetDeviceId(appId runwayRiotAppId: String) async -> String {

    let runwayRiotVendorIdentifier = await UIDevice.current.identifierForVendor?.uuidString ?? ""
    return runwayRiotVendorIdentifier + runwayRiotAppId
  }
}

struct RunwayRiotApp {
  let name: String
  let scheme: String
}

let runwayRiotApps = [
  RunwayRiotApp(name: "WhatsApp", scheme: "whatsapp"),
  RunwayRiotApp(name: "Instagram", scheme: "instagram"),
  RunwayRiotApp(name: "Facebook", scheme: "fb"),
  RunwayRiotApp(name: "TikTok", scheme: "tiktok"),
  RunwayRiotApp(name: "GoogleMaps", scheme: "comgooglemaps"),
  RunwayRiotApp(name: "twitter", scheme: "tweetie"),
  RunwayRiotApp(name: "qq", scheme: "mqq"),
  RunwayRiotApp(name: "weiChat", scheme: "wechat"),
  RunwayRiotApp(name: "Aliapp", scheme: "alipay"),
]
