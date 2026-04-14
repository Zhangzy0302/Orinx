//
//  ContentView.swift
//  Orinx
//
//  Created by yangyang on 2026/4/8.
//

import SwiftUI
import Combine

struct NeqocOwibRouter: View {
    private var orinxStorage = OrinxntqoStorageManager.shared
    @EnvironmentObject var neqocNavi: OrinxNaviManager
    
    var body: some View {
        NavigationStack(path: $neqocNavi.orainxiALwiPath) {
            Group {
                if orinxStorage.getCurrentUserId().isEmpty {
                    KiwoviqGuidePage()
                } else {
                    VnziwbLiwNavPage()
                }
            }.navigationDestination(for: OrinxRoute.self) { orinxRoute in
                switch orinxRoute {
                case .ewioxaEula:
                    OpwicaVie29jhaEula()
                case .pxiwkfNavPage:
                    VnziwbLiwNavPage()
                case .otwiNjqoWeb(let otwiNjqoWebUrl):
                    OtwiNjqoiWeb(aswuznaWebUrlString: otwiNjqoWebUrl)
                case .wxiwiangSignPage(let wialcjSignType):
                    WxiwiangSignPage(wxiwiangType: wialcjSignType)
                }
            }
        }
    }
}

#Preview {
    NeqocOwibRouter()
}

enum OrinxRoute: Hashable {
    case ewioxaEula
    case wxiwiangSignPage(wialcjSignType: WxiwiangType)
    case otwiNjqoWeb(otwiNjqoWebUrl: String)
    case pxiwkfNavPage
}

class OrinxNaviManager: ObservableObject {
    // 核心：全局共享的导航路径
    @Published var orainxiALwiPath: NavigationPath = NavigationPath()
    @Published var isShowBlock: Bool = false
    @Published var blockUserID: String?
    
    // 便捷方法：跳转到指定路由
    func push(_ route: OrinxRoute) {
        orainxiALwiPath.append(route)
    }
    
    // 便捷方法：返回上一页
    func pop() {
        orainxiALwiPath.removeLast()
    }
    
    // 便捷方法：返回根页面
    func popToRoot() {
        orainxiALwiPath = NavigationPath()
    }
    
    // 弹出拉黑弹框
    func showReportBlock(_ blockId: String){
        blockUserID = blockId
        withAnimation(.easeOut) {
            isShowBlock = true
        }
    }
    
    // 关闭弹框
    func closeReportBlock() {
        withAnimation(.easeOut) {
            isShowBlock = false
        }
    }
}
