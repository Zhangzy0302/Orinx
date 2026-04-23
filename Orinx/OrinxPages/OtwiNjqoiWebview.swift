import SwiftUI
import WebKit

private enum ORINXVOGUECipherVault {
    static let ORINXVOGUEVaultUserListUpdate = "72JgxpSawPYrnTvUIe4+9Q=="
    static let ORINXVOGUEVaultPostsUpdate = "5/GNKrZpEFaMbW8u4Ye4Vg=="
    static let ORINXVOGUEVaultCommentsUpdate = "uTYLeIg0HmPs44cKzxSZ7A=="
    static let ORINXVOGUEVaultChatsUpdate = "Xr3+uYw4Twi6gTQwLibQJw=="
    static let ORINXVOGUEVaultMessagesUpdate = "8CXIFbgPmgGhg9eFTtlAqg=="
    static let ORINXVOGUEVaultClose = "yegKg7x2VGPwEDy9VBCWvw=="
    static let ORINXVOGUEVaultLogout = "86CG/XNxwpOzB0j/imCntA=="
    static let ORINXVOGUEVaultPayment = "+wkGzhNLk7dXU559/+O2bg=="
    static let ORINXVOGUEVaultNewUserData = "ye8lv1odwj1I5ORYiHjxgQ=="
    static let ORINXVOGUEVaultShowToast = "2C9Q2GoP4gUIIWIqdo5KfQ=="
    static let ORINXVOGUEVaultShowLoading = "jStpWVCOTOJfmzKXfHY/0g=="
    static let ORINXVOGUEVaultShowToLogin = "K1KeNAe9GZIQF/kd0GdgZA=="
    static let ORINXVOGUEVaultWebHost = "mvwRDSaI1txlgut9RuaG0kkkyqZQaiMvkXIwCNbSOpk="
    static let ORINXVOGUEVaultUsers = "E6tYO83G7V+SnUkPIvqbHg=="
    static let ORINXVOGUEVaultPosts = "BgbVN0f8b+9uLul94WY45g=="
    static let ORINXVOGUEVaultComments = "kwvf53Yakgeqgzjwn4g4Wg=="
    static let ORINXVOGUEVaultChats = "ExdvmNJOwlXxjtep/220eg=="
    static let ORINXVOGUEVaultMessages = "TBNBQd8EkwDBCrz0WJPPog=="
    static let ORINXVOGUEVaultToastMsg = "3xMP4LXnfCSiIWzLXVimzQ=="
    static let ORINXVOGUEVaultIsShow = "J8OJtcDNc9iWWbt65df/pg=="
    static let ORINXVOGUEVaultIsLogout = "1lxfdjtU+5clQC0fL1fw2Q=="
    static let ORINXVOGUEVaultPayKey = "UamrvE5W8HOieBFIZim/eg=="
    static let ORINXVOGUEVaultAvatar = "z68PW7+8yO8WLhVu0p8lVA=="
    static let ORINXVOGUEVaultName = "Bt7506MqME5TfEW+lk2c1Q=="
    static let ORINXVOGUEVaultDefaultAvatar = "x2dYQh/Jdw43w59EgG47idY6rIrc2b6A8jjmOJqe/jhVRd68LV/AEbaardAVIIi4ZgkgTMlC6VhUGTA9tshJ0+Mrp4ltT1BSqqyq3THMlw0="
    static let ORINXVOGUEVaultUploadAvatarToast = "B9GGIfO0ox0RyoTx1/SY5OISzVu++AmX74J/CANplFY="
    static let ORINXVOGUEVaultEnterNameToast = "1HZ7B4KskMXZvyijypG69TBtcmfYCDiNOmqIixGb0oE="
    static let ORINXVOGUEVaultUpdateCurrentUser = "wifKk038/K+mP9KvCKS/t+Ma29n2jbT6Xn6hxi31+hU="
    static let ORINXVOGUEVaultEmptyArray = "ob2F5e6g3UXzFb7yO/V2cg=="
    static let ORINXVOGUEVaultEmptyObject = "mexU4KfHWPOWwxw8IgWuSg=="
    static let ORINXVOGUEVaultPostTheme = "CQYRrHRa5qsjc7pYRLohzg=="
    static let ORINXVOGUEVaultHobbies = "9XM8uSaGkqmQYvN3lUm97Q=="
    static let ORINXVOGUEVaultInspire = "nvfrAqxSmQVbBsIPrMKqCw=="
    static let ORINXVOGUEVaultReportContent = "CEs1ttu7wMEt8NOcvnWZWQ=="
    static let ORINXVOGUEVaultHarassment = "3R4dby5W3jVIzoJ92N7KHQ=="
    static let ORINXVOGUEVaultMaliciousFraud = "O2VL9IRxyVoDvpEHhfRwcA=="
    static let ORINXVOGUEVaultPornography = "nlbyU69cRUvd/lkMlUzDEA=="
    static let ORINXVOGUEVaultMaliciousInsults = "OuBJQRhGK3LQZ91Zovd3ZCblKeeotbrF8iD0KI64dso="
    static let ORINXVOGUEVaultFalseInformation = "XzF4ZTYpvc8LiZndQ7yQGf3yhq+Es8IYAev9YOI7UD8="
    static let ORINXVOGUEVaultCoinsSetting = "UVkf8z3sDwOZYNzdGQpWyg=="
    static let ORINXVOGUEVaultKey = "4psInrN2nzCPPZsvEPB/qQ=="
    static let ORINXVOGUEVaultCions = "81T5jUOkJa9eLV2/NbK2Sg=="
    static let ORINXVOGUEVaultMoney = "xKP05ltc8AuyjhAHaCncxA=="
    static let ORINXVOGUEVaultCurrentUserVariable = "D0ENAitO/jJxYWFi1s8KuuXxCL1nQzvnya5NwApOlmM="
    static let ORINXVOGUEVaultUserListVariable = "AadaQWJKuQcuWtjrihNQtA=="
    static let ORINXVOGUEVaultPostListVariable = "MknGuMVlHPRkpjIhAxFFYA=="
    static let ORINXVOGUEVaultCommentListVariable = "MZANyK3i7lWvm3NsofogFkTyOBjXruzhQ6UilURPvTs="
    static let ORINXVOGUEVaultChatListVariable = "yx02GQiO7VJsabTlMv9gpQ=="
    static let ORINXVOGUEVaultMessageListVariable = "4KZmtCUMDT9hVDb98uXEakTyOBjXruzhQ6UilURPvTs="
    static let ORINXVOGUEVaultOtherVariable = "znhaeGoPHfMc4RIO2JjjDg=="
    static let ORINXVOGUEVaultBackgroundImage = "wuzc+9MqvpEZt1uPlSBWaQ=="
}

private func ORINXVOGUEDecrypt(_ cipherText: String) -> String {
    XaiwgAesECBTool.xaiwgDecrypt(cipherText)
}

struct ORINXVOGUECatwalkWebCanvas: UIViewRepresentable {
    
    let ORINXVOGUEstyleRoute: String
    @EnvironmentObject var ORINXVOGUEstyleNavigator: OrinxNaviManager
    @EnvironmentObject var ORINXVOGUErunwayIAPManager: ORINXVOGUERunwayIAPManager
    @EnvironmentObject var ORINXVOGUEwardrobeUserViewModel: RexceaiPwvzwaUserViewModel
    
    let ORINXVOGUEregisterEmail: String?
    let ORINXVOGUEregisterPassword: String?
    
    static weak var ORINXVOGUEcurrentWebView: WKWebView?
    
    func makeCoordinator() -> ORINXVOGUECatwalkWebCoordinator {
        ORINXVOGUECatwalkWebCoordinator(
            self,
            ORINXVOGUEstyleNavigator: ORINXVOGUEstyleNavigator,
            ORINXVOGUErunwayCheckoutManager: ORINXVOGUErunwayIAPManager,
            ORINXVOGUEwardrobeUserViewModel: ORINXVOGUEwardrobeUserViewModel,
            ORINXVOGUEregisterEmail: ORINXVOGUEregisterEmail,
            ORINXVOGUEregisterPassword: ORINXVOGUEregisterPassword
        )
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let ORINXVOGUEmessageCenter = WKUserContentController()
        let ORINXVOGUEbridgeActions = [
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultUserListUpdate),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPostsUpdate),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCommentsUpdate),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultChatsUpdate),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMessagesUpdate),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultClose),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultLogout),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPayment),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultNewUserData),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultShowToast),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultShowLoading),
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultShowToLogin)
        ]
        
        ORINXVOGUEbridgeActions.forEach {
            ORINXVOGUEmessageCenter.add(context.coordinator, name: $0)
        }
        
        let ORINXVOGUEwebConfiguration = WKWebViewConfiguration()
        ORINXVOGUEwebConfiguration.userContentController = ORINXVOGUEmessageCenter
        ORINXVOGUEwebConfiguration.allowsInlineMediaPlayback = true
        
        let ORINXVOGUEinitialScript = WKUserScript(
            source: context.coordinator.buildORINXVOGUEInitialWardrobeScript(),
            injectionTime: .atDocumentStart,
            forMainFrameOnly: true
        )
        ORINXVOGUEmessageCenter.addUserScript(ORINXVOGUEinitialScript)
        
        let ORINXVOGUEwebView = WKWebView(frame: .zero, configuration: ORINXVOGUEwebConfiguration)
        ORINXVOGUEwebView.uiDelegate = context.coordinator
        ORINXVOGUEwebView.navigationDelegate = context.coordinator
        ORINXVOGUEwebView.isOpaque = false
        ORINXVOGUEwebView.backgroundColor = .clear
        ORINXVOGUEwebView.scrollView.backgroundColor = .clear
        ORINXVOGUEwebView.scrollView.contentInsetAdjustmentBehavior = .never
        ORINXVOGUEwebView.scrollView.contentInset = .zero
        ORINXVOGUEwebView.scrollView.isScrollEnabled = false
        ORINXVOGUEwebView.scrollView.scrollIndicatorInsets = .zero
        ORINXVOGUEwebView.allowsBackForwardNavigationGestures = true
        
        ORINXVOGUECatwalkWebCanvas.ORINXVOGUEcurrentWebView = ORINXVOGUEwebView
        
        let ORINXVOGUEpageURL = URL(
            string: "\(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultWebHost))\(ORINXVOGUEstyleRoute)"
        )!
        ORINXVOGUEwebView.load(URLRequest(url: ORINXVOGUEpageURL))
        
        return ORINXVOGUEwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

@MainActor
final class ORINXVOGUECatwalkWebCoordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {
    
    private let ORINXVOGUEstyleStorage = OrinxntqoStorageManager.shared
    
    let ORINXVOGUEcanvas: ORINXVOGUECatwalkWebCanvas
    let ORINXVOGUEstyleNavigator: OrinxNaviManager
    let ORINXVOGUErunwayCheckoutManager: ORINXVOGUERunwayIAPManager
    let ORINXVOGUEwardrobeUserViewModel: RexceaiPwvzwaUserViewModel
    let ORINXVOGUEregisterEmail: String?
    let ORINXVOGUEregisterPassword: String?
    
    init(
        _ ORINXVOGUEcanvas: ORINXVOGUECatwalkWebCanvas,
        ORINXVOGUEstyleNavigator: OrinxNaviManager,
        ORINXVOGUErunwayCheckoutManager: ORINXVOGUERunwayIAPManager,
        ORINXVOGUEwardrobeUserViewModel: RexceaiPwvzwaUserViewModel,
        ORINXVOGUEregisterEmail: String?,
        ORINXVOGUEregisterPassword: String?
    ) {
        self.ORINXVOGUEcanvas = ORINXVOGUEcanvas
        self.ORINXVOGUEstyleNavigator = ORINXVOGUEstyleNavigator
        self.ORINXVOGUErunwayCheckoutManager = ORINXVOGUErunwayCheckoutManager
        self.ORINXVOGUEwardrobeUserViewModel = ORINXVOGUEwardrobeUserViewModel
        self.ORINXVOGUEregisterEmail = ORINXVOGUEregisterEmail
        self.ORINXVOGUEregisterPassword = ORINXVOGUEregisterPassword
    }
    
    func webView(
        _ ORINXVOGUEwebView: WKWebView,
        requestMediaCapturePermissionFor origin: WKSecurityOrigin,
        initiatedByFrame frame: WKFrameInfo,
        type: WKMediaCaptureType,
        decisionHandler: @escaping (WKPermissionDecision) -> Void
    ) {
        decisionHandler(.grant)
    }
    
    func webView(_ ORINXVOGUEwebView: WKWebView, didFinish navigation: WKNavigation!) {
        ORINXVOGUEwebView.evaluateJavaScript(
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCurrentUserVariable)
        ) { _, _ in }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let ORINXVOGUEbridgeAction = ORINXVOGUEBridgeAction(rawValue: message.name) else {
            return
        }
        
        handleORINXVOGUEBridgeAction(ORINXVOGUEbridgeAction, body: message.body)
    }
}

extension ORINXVOGUECatwalkWebCoordinator {
    
    enum ORINXVOGUEBridgeAction: String {
        case close
        case userListUpdate
        case postsUpdate
        case commentsUpdate
        case chatsUpdate
        case messagesUpdate
        case logout
        case payment
        case newUserData
        case showToast
        case showLoading
        case showToLogin
    }
    
    private func handleORINXVOGUEBridgeAction(_ ORINXVOGUEbridgeAction: ORINXVOGUEBridgeAction, body: Any) {
        switch ORINXVOGUEbridgeAction {
        case .close:
            ORINXVOGUEstyleNavigator.pop()
            
        case .userListUpdate:
            guard let ORINXVOGUEusers = extractORINXVOGUEArray(
                body,
                key: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultUsers)
            ) else { return }
            ORINXVOGUEstyleStorage.aelgohiAorSaveUsers(RexceaiPwvzwaUser.fromJsonArray(ORINXVOGUEusers))
            
        case .postsUpdate:
            guard let ORINXVOGUEposts = extractORINXVOGUEArray(
                body,
                key: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPosts)
            ) else { return }
            ORINXVOGUEstyleStorage.aelgohiAorSaveWorks(VieoaVNneqoVideo.fromJsonArray(ORINXVOGUEposts))
            
        case .commentsUpdate:
            guard let ORINXVOGUEcomments = extractORINXVOGUEArray(
                body,
                key: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultComments)
            ) else { return }
            ORINXVOGUEstyleStorage.aelgohiAorSaveComments(SaascieSeigComment.fromJsonArray(ORINXVOGUEcomments))
            
        case .chatsUpdate:
            guard let ORINXVOGUEchatRooms = extractORINXVOGUEArray(
                body,
                key: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultChats)
            ) else { return }
            ORINXVOGUEstyleStorage.aelgohiAorSaveChatRooms(ZswqoveiNiegChatRoom.fromJsonArray(ORINXVOGUEchatRooms))
            
        case .messagesUpdate:
            guard let ORINXVOGUEmessages = extractORINXVOGUEArray(
                body,
                key: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMessages)
            ) else { return }
            ORINXVOGUEstyleStorage.aelgohiAorSaveChatMessageList(ZswqoveiNiegMessage.fromJsonArray(ORINXVOGUEmessages))
            
        case .logout:
            handleORINXVOGUELogout(body)
            
        case .payment:
            handleORINXVOGUEPayment(body)
            
        case .newUserData:
            handleORINXVOGUERegistration(body)
            
        case .showToast:
            handleORINXVOGUEToast(body)
            
        case .showLoading:
            handleORINXVOGUELoading(body)
            
        case .showToLogin:
            ORINXVOGUEstyleNavigator.pop()
        }
    }
    
    private func handleORINXVOGUEToast(_ body: Any) {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEtoastMessage = ORINXVOGUEpayload[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultToastMsg)] as? String else {
            return
        }
        
        EeuqcjaOrHUD.toast(.normal(ORINXVOGUEtoastMessage))
    }
    
    private func handleORINXVOGUELoading(_ body: Any) {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEshouldShow = ORINXVOGUEpayload[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultIsShow)] as? Bool else {
            return
        }
        
        if ORINXVOGUEshouldShow {
            EeuqcjaOrHUD.showLoading()
        } else {
            EeuqcjaOrHUD.hideLoading()
        }
    }
    
    private func handleORINXVOGUELogout(_ body: Any) {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEisLogout = ORINXVOGUEpayload[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultIsLogout)] as? Bool else {
            return
        }
        
        if ORINXVOGUEisLogout {
            ORINXVOGUEwardrobeUserViewModel.deleteAccountRexceaiPwvzwa()
        } else {
            ORINXVOGUEstyleStorage.aelgohiAorSetCurrentUserId(String())
            ORINXVOGUEwardrobeUserViewModel.loadLoginRexceaiPwvzwaUser()
        }
        
        ORINXVOGUEstyleNavigator.popToRoot()
    }
    
    private func handleORINXVOGUEPayment(_ body: Any) {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEpayKey = ORINXVOGUEpayload[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPayKey)] as? String else {
            return
        }
        
        beginORINXVOGUERunwayCheckout(payKey: ORINXVOGUEpayKey)
    }
    
    private func handleORINXVOGUERegistration(_ body: Any) {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEwardrobeProfile = ORINXVOGUEpayload[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultNewUserData)] as? [String: Any] else {
            return
        }
        
        let ORINXVOGUEavatar = ORINXVOGUEwardrobeProfile[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultAvatar)] as? String ?? ""
        let ORINXVOGUEname = ORINXVOGUEwardrobeProfile[ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultName)] as? String ?? ""
        let ORINXVOGUEfinalAvatar = ORINXVOGUEavatar.isEmpty
            ? ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultDefaultAvatar)
            : ORINXVOGUEavatar
        
        if ORINXVOGUEfinalAvatar.isEmpty {
            EeuqcjaOrHUD.toast(.normal(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultUploadAvatarToast)))
            return
        }
        
        if ORINXVOGUEname.isEmpty {
            EeuqcjaOrHUD.toast(.normal(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEnterNameToast)))
            return
        }
        
        if let ORINXVOGUEemail = ORINXVOGUEregisterEmail,
           let ORINXVOGUEpassword = ORINXVOGUEregisterPassword {
            ORINXVOGUEstyleStorage.aelgohiAorAddUser(
                user: RexceaiPwvzwaUser(
                    rexceaiPwvzwaUserId: "\(ORINXVOGUEstyleStorage.aelgohiAorGetUsers().count)",
                    rexceaiPwvzwaEmail: ORINXVOGUEemail,
                    rexceaiPwvzwaPassword: ORINXVOGUEpassword,
                    rexceaiPwvzwaUserName: ORINXVOGUEname,
                    rexceaiPwvzwaAvatar: ORINXVOGUEfinalAvatar,
                    rexceaiPwvzwaAboutMe: String(),
                    rexceaiPwvzwaFollowing: [],
                    rexceaiPwvzwaFans: [],
                    rexceaiPwvzwaBlacklist: [],
                    rexceaiPwvzwaWalletBalance: 0,
                    rexceaiPwvzwaLikePosts: [],
                    rexceaiPwvzwaIsDeleted: 0
                )
            )
            
            _ = ORINXVOGUEwardrobeUserViewModel.loginByEmailAndPasswordRexceaiPwvzwa(
                email: ORINXVOGUEemail,
                password: ORINXVOGUEpassword
            )
            
            ORINXVOGUEstyleNavigator.popToRoot()
        }
    }
}

extension ORINXVOGUECatwalkWebCoordinator {
    
    func syncORINXVOGUECurrentUserToH5() {
        guard let ORINXVOGUEcurrentUser = ORINXVOGUEstyleStorage.aelgohiAorGetUserById(
            userId: ORINXVOGUEstyleStorage.aelgohiAorGetCurrentUserId()
        ) else {
            return
        }
        
        let ORINXVOGUEtargetUser = ORINXVOGUEcurrentUser.toTargetUser()
        let ORINXVOGUEuserJSON = encodeORINXVOGUEValue(
            ORINXVOGUEtargetUser,
            defaultValue: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEmptyObject)
        )
        let ORINXVOGUEescapedJSON = ORINXVOGUEuserJSON
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
        
        let ORINXVOGUEupdateScript =
            "\(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultUpdateCurrentUser))(JSON.parse(\"\(ORINXVOGUEescapedJSON)\"));"
        
        DispatchQueue.main.async {
            ORINXVOGUECatwalkWebCanvas.ORINXVOGUEcurrentWebView?.evaluateJavaScript(ORINXVOGUEupdateScript) { _, _ in }
        }
    }
    
    private func beginORINXVOGUERunwayCheckout(payKey: String) {
        ORINXVOGUErunwayCheckoutManager.beginORINXVOGUECoutureCheckout(payKey) { [weak self] ORINXVOGUEpurchaseResult in
            guard let self else { return }
            
            switch ORINXVOGUEpurchaseResult {
            case .ORINXVOGUESuccess(let ORINXVOGUEwardrobeValue):
                self.ORINXVOGUEwardrobeUserViewModel.increaseUserDiamond(diamond: ORINXVOGUEwardrobeValue)
                self.ORINXVOGUEwardrobeUserViewModel.loadLoginRexceaiPwvzwaUser()
                self.syncORINXVOGUECurrentUserToH5()
                
            case .ORINXVOGUEFailed(let ORINXVOGUEerrorMessage):
                EeuqcjaOrHUD.toast(.error(ORINXVOGUEerrorMessage))
                
            case .ORINXVOGUECancelled, .ORINXVOGUEPending:
                break
            }
        }
    }
}

extension ORINXVOGUECatwalkWebCoordinator {
    
    private func extractORINXVOGUEArray(_ body: Any, key: String) -> [[String: Any]]? {
        guard let ORINXVOGUEpayload = body as? [String: Any],
              let ORINXVOGUEarray = ORINXVOGUEpayload[key] as? [[String: Any]] else {
            return nil
        }
        return ORINXVOGUEarray
    }
    
    private func encodeORINXVOGUEValue<T: Encodable>(
        _ value: T,
        defaultValue: String = ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEmptyArray)
    ) -> String {
        let ORINXVOGUEencoder = JSONEncoder()
        ORINXVOGUEencoder.dateEncodingStrategy = .iso8601
        
        guard let ORINXVOGUEdata = try? ORINXVOGUEencoder.encode(value),
              let ORINXVOGUEjson = String(data: ORINXVOGUEdata, encoding: .utf8) else {
            return defaultValue
        }
        
        return ORINXVOGUEjson
    }
    
    private func encodeORINXVOGUEAnyValue(_ value: Any) -> String {
        guard let ORINXVOGUEdata = try? JSONSerialization.data(withJSONObject: value),
              let ORINXVOGUEjson = String(data: ORINXVOGUEdata, encoding: .utf8) else {
            return ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEmptyObject)
        }
        
        return ORINXVOGUEjson
    }
}

extension ORINXVOGUECatwalkWebCoordinator {
    
    func buildORINXVOGUEInitialWardrobeScript() -> String {
        let ORINXVOGUEcurrentUser = ORINXVOGUEstyleStorage.aelgohiAorGetUserById(
            userId: ORINXVOGUEstyleStorage.aelgohiAorGetCurrentUserId()
        )
        
        let ORINXVOGUEcurrentUserJSON = ORINXVOGUEcurrentUser
            .map {
                encodeORINXVOGUEValue(
                    $0.toTargetUser(),
                    defaultValue: ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEmptyObject)
                )
            }
            ?? ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultEmptyObject)
        
        return """
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCurrentUserVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(ORINXVOGUEcurrentUserJSON))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultUserListVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(encodeORINXVOGUEValue(ORINXVOGUEstyleStorage.aelgohiAorGetUsers().map { $0.toTargetUser() })))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPostListVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(encodeORINXVOGUEValue(ORINXVOGUEstyleStorage.aelgohiAorGetWorks().map { $0.toTargetPost() })))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCommentListVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(encodeORINXVOGUEValue(ORINXVOGUEstyleStorage.aelgohiAorGetAllComments().map { $0.toTargetComment() })))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultChatListVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(encodeORINXVOGUEValue(ORINXVOGUEstyleStorage.aelgohiAorGetChatRooms().map { $0.toTargetChatRoom() })))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMessageListVariable)) = JSON.parse('\(escapeORINXVOGUEForJS(encodeORINXVOGUEValue(ORINXVOGUEstyleStorage.aelgohiAorGetAllMessages().map { $0.toTargetMessage() })))');
            \(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultOtherVariable)) = \(buildORINXVOGUEClosetConfig());
        """
    }
    
    private func escapeORINXVOGUEForJS(_ json: String) -> String {
        json
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "'", with: "\\'")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
    }
    
    private func buildORINXVOGUEClosetConfig() -> String {
        let ORINXVOGUEconfig: [String: Any] = [
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPostTheme): [
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultHobbies),
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultInspire)
            ],
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultReportContent): [
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultHarassment),
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMaliciousFraud),
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultPornography),
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMaliciousInsults),
                ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultFalseInformation)
            ],
            ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCoinsSetting): ORINXVOGUEAtelierCatalog.map {
                [
                    ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultKey): $0.ORINXVOGUEsilhouetteKeyId,
                    ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultCions): $0.ORINXVOGUEwardrobeValue,
                    ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultMoney): $0.ORINXVOGUErunwayPrice
                ]
            }
        ]
        
        let ORINXVOGUEconfigJSON = encodeORINXVOGUEAnyValue(ORINXVOGUEconfig)
        return "JSON.parse('\(escapeORINXVOGUEForJS(ORINXVOGUEconfigJSON))')"
    }
}

struct ORINXVOGUECatwalkWebScene: View {
    let ORINXVOGUEstyleRoute: String
    let ORINXVOGUEregisterEmail: String?
    let ORINXVOGUEregisterPassword: String?
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(ORINXVOGUEDecrypt(ORINXVOGUECipherVault.ORINXVOGUEVaultBackgroundImage))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
            
            ORINXVOGUECatwalkWebCanvas(
                ORINXVOGUEstyleRoute: ORINXVOGUEstyleRoute,
                ORINXVOGUEregisterEmail: ORINXVOGUEregisterEmail,
                ORINXVOGUEregisterPassword: ORINXVOGUEregisterPassword
            )
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .background(LkjaurakjxSwipeBack())
    }
}
