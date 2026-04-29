//
//  OrinxApp.swift
//  Orinx
//
//  Created by yangyang on 2026/4/8.
//

import SwiftUI

@main
struct OrinxApp: App {
    @StateObject var rexceaiPwvzwaUserViewModel = RexceaiPwvzwaUserViewModel()
    @StateObject var vieoaVNneqoVideoViewModel = VieoaVNneqoVideoViewModel()
    @StateObject var zswqoveiNiegChatViewModel = ZswqoveiNiegChatViewModel()
    @StateObject var orinxNaviManager = OrinxNaviManager()
    @StateObject var oRINXVOGUERunwayIAPManager = ORINXVOGUERunwayIAPManager()
    
    private var orinxData = OrinxntqoStorageManager.shared
    @State private var orinxHasStartedBootstrap = false
    
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
                    await Task.detached(priority: .utility) {
                        orinxStorage.initializeAllDefaults()
                    }.value

                    rexceaiPwvzwaUserViewModel.loadLoginRexceaiPwvzwaUser()

                    Task(priority: .utility) {
                        try? await Task.sleep(nanoseconds: 800_000_000)
                        oRINXVOGUERunwayIAPManager.refreshORINXVOGUERunwayCatalog()
                    }
                }
        }
    }
}
