//
//  OrinxApp.swift
//  Orinx
//
//  Created by yangyang on 2026/4/8.
//

import SwiftUI
import AdjustSdk

@main
struct OrinxApp: App {
    @StateObject var rexceaiPwvzwaUserViewModel = RexceaiPwvzwaUserViewModel()
    @StateObject var vieoaVNneqoVideoViewModel = VieoaVNneqoVideoViewModel()
    @StateObject var zswqoveiNiegChatViewModel = ZswqoveiNiegChatViewModel()
    @StateObject var orinxNaviManager = OrinxNaviManager()
    @StateObject var oRINXVOGUERunwayIAPManager = ORINXVOGUERunwayIAPManager()
    
    private var orinxData = OrinxntqoStorageManager.shared
    @State private var orinxHasStartedBootstrap = false
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    init() {
        Task {
            _ = await RunwayRiotPhoneInfo.shared.runwayRiotEnsureDeviceId()
            ORINXWAvUbnaAdjustManager.shared.owoiinvzUbnaInitialize()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                NeqocOwibRouter()
                EeuqcjaOrHUDView()
                if orinxNaviManager.isShowBlock {
                    CoeeZenvReportBlock(coeeZenIsShowBlock: $orinxNaviManager.isShowBlock, coeeZenvBlockUID: orinxNaviManager.blockUserID!)
                }
                if orinxNaviManager.orinxShowGuestAlert {
                    WoxiaeioGuestAlert(woxiaeioIsShowing: $orinxNaviManager.orinxShowGuestAlert)
                }
            }.environmentObject(rexceaiPwvzwaUserViewModel)
                .environmentObject(vieoaVNneqoVideoViewModel)
                .environmentObject(zswqoveiNiegChatViewModel)
                .environmentObject(orinxNaviManager)
                .environmentObject(oRINXVOGUERunwayIAPManager)
                .task {
                    guard !orinxHasStartedBootstrap else { return }
                    orinxHasStartedBootstrap = true

                    // Load the current session immediately so the first screen can render fast.
                    rexceaiPwvzwaUserViewModel.loadLoginRexceaiPwvzwaUser()

                    let orinxStorage = orinxData
                    Task.detached(priority: .utility) {
                        orinxStorage.initializeAllDefaults()
                    }

                    Task(priority: .utility) {
                        try? await Task.sleep(nanoseconds: 800_000_000)
                        oRINXVOGUERunwayIAPManager.refreshORINXVOGUERunwayCatalog()
                    }
                }
        }
    }
}

final class ORINXWAvUbnaAdjustManager: UIResponder, UIApplicationDelegate, AdjustDelegate {

  static let shared = ORINXWAvUbnaAdjustManager()

  private let owoiinvzUbnaInstallToken = "hvhvnq"
  private let owoiinvzUbnaPurchaseToken = "uvoy7t"
  private let owoiinvzUbnaAppToken = "erbye8ha32f4"

  private override init() {}

  // MARK: - 初始化
  func owoiinvzUbnaInitialize() {
    guard
      let owoiinvzUbnaConfitg = ADJConfig(
        appToken: owoiinvzUbnaAppToken,
        environment: ADJEnvironmentProduction
      )
    else { return }

    owoiinvzUbnaConfitg.logLevel = ADJLogLevel.verbose
    owoiinvzUbnaConfitg.enableSendingInBackground()
    owoiinvzUbnaConfitg.delegate = self
//      print("Adjust:ta_distinct_id: \(LuxeLatchSecureStore.shared.luxeLatchDeviceId)")
      Adjust.addGlobalCallbackParameter(LuxeLatchSecureStore.shared.luxeLatchDeviceId, forKey: "ta_distinct_id")
    Adjust.attribution { attribution in
      self.adjustAttributionChanged(attribution)
    }
    Adjust.initSdk(owoiinvzUbnaConfitg)
  }

  // MARK: - 安装事件
  func adjustAttributionChanged(_ attribution: ADJAttribution?) {
    let event = ADJEvent(eventToken: owoiinvzUbnaInstallToken)
    Adjust.trackEvent(event)
  }

  // MARK: - 购买事件
  func owoiinvzUbnaTrackPurchase(dollar: Double) {
    let event = ADJEvent(eventToken: owoiinvzUbnaPurchaseToken)
    event?.setRevenue(dollar, currency: "USD")
    Adjust.trackEvent(event)
  }

}
