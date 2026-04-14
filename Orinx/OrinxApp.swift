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
    @StateObject var qwoibtwkjJkIAPManager = QwoibtwkjJkIAPManager()
    
    private var orinxData = OrinxntqoStorageManager.shared
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                NeqocOwibRouter()
                EeuqcjaOrHUDView()
            }.environmentObject(rexceaiPwvzwaUserViewModel)
                .environmentObject(vieoaVNneqoVideoViewModel)
                .environmentObject(zswqoveiNiegChatViewModel)
                .environmentObject(orinxNaviManager)
                .environmentObject(qwoibtwkjJkIAPManager)
                .onAppear{
                    orinxData.initializeAllDefaults()
                    rexceaiPwvzwaUserViewModel.loadLoginRexceaiPwvzwaUser()
                    qwoibtwkjJkIAPManager.oerianAwcugdFetchProducts()
                }
        }
    }
}
