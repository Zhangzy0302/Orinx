import SwiftUI
import WebKit

struct OtwiNjqoiWebview: UIViewRepresentable {
    
    let otwiNjqoiWebNav: String
    @EnvironmentObject var navi: OrinxNaviManager
    @EnvironmentObject var uejaLIcjagIpa: QwoibtwkjJkIAPManager
    @EnvironmentObject var bcjeiLAcxiaUserVM: RexceaiPwvzwaUserViewModel
    
    static weak var currentWebView: WKWebView?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, navi: navi, ipaRecharge: uejaLIcjagIpa, userVM: bcjeiLAcxiaUserVM)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        let contentController = WKUserContentController()
        
        // ✅ 按文档注册事件
        let handlers = [
            "userListUpdate",
            "postsUpdate",
            "commentsUpdate",
            "chatsUpdate",
            "messagesUpdate",
            "close",
            "logout",
            "payment"
        ]
        
        handlers.forEach {
            contentController.add(context.coordinator, name: $0)
        }
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.allowsInlineMediaPlayback = true
        
        // ✅ 注入 JS 数据
        let js = context.coordinator.generateInitialJS()
//        print(js)
        let script = WKUserScript(
            source: js,
            injectionTime: .atDocumentStart,
            forMainFrameOnly: true
        )
        contentController.addUserScript(script)
        
        let orinxAwibaWebView = WKWebView(frame: .zero, configuration: config)
        
        orinxAwibaWebView.uiDelegate = context.coordinator
        orinxAwibaWebView.navigationDelegate = context.coordinator
        orinxAwibaWebView.isOpaque = false
        orinxAwibaWebView.backgroundColor = .clear
        orinxAwibaWebView.scrollView.backgroundColor = .clear
        orinxAwibaWebView.scrollView.contentInsetAdjustmentBehavior = .never
        orinxAwibaWebView.scrollView.contentInset = .zero
        orinxAwibaWebView.scrollView.isScrollEnabled = false
        orinxAwibaWebView.scrollView.scrollIndicatorInsets = .zero
        orinxAwibaWebView.allowsBackForwardNavigationGestures = true
        
        OtwiNjqoiWebview.currentWebView = orinxAwibaWebView
        
        let url = URL(string: "http://192.168.9.117:5173/\(otwiNjqoiWebNav)")!
        orinxAwibaWebView.load(URLRequest(url: url))
        
        return orinxAwibaWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
}

@MainActor
class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {
    
    // MARK: - Dependencies
    private let storage = OrinxntqoStorageManager.shared
    
    var parent: OtwiNjqoiWebview
    var navi: OrinxNaviManager
    var ipaRecharge: QwoibtwkjJkIAPManager
    var userVM: RexceaiPwvzwaUserViewModel
    
    // MARK: - Init
    init(_ parent: OtwiNjqoiWebview,
         navi: OrinxNaviManager,
         ipaRecharge: QwoibtwkjJkIAPManager,
         userVM: RexceaiPwvzwaUserViewModel) {
        
        self.parent = parent
        self.navi = navi
        self.ipaRecharge = ipaRecharge
        self.userVM = userVM
    }
    
    // MARK: - 权限（自动允许）
    func webView(
        _ orinxAwibaWebView: WKWebView,
        requestMediaCapturePermissionFor origin: WKSecurityOrigin,
        initiatedByFrame frame: WKFrameInfo,
        type: WKMediaCaptureType,
        decisionHandler: @escaping (WKPermissionDecision) -> Void
    ) {
        decisionHandler(.grant)
    }
    
    func webView(_ orinxAwibaWebView: WKWebView, didFinish navigation: WKNavigation!) {
        
        orinxAwibaWebView.evaluateJavaScript("window.currentUser") { result, error in
//            print("🧪 currentUser:", result ?? "nil")
        }
    }
    
    // MARK: - Web -> Native 入口
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        
        guard let action = WebAction(rawValue: message.name) else {
            print("❌ 未知事件:", message.name)
            return
        }
        
        handle(action: action, body: message.body)
    }
}

// MARK: - Action Enum
extension Coordinator {
    
    enum WebAction: String {
        case close
        case userListUpdate
        case postsUpdate
        case commentsUpdate
        case chatsUpdate
        case messagesUpdate
        case logout
        case payment
    }
}

// MARK: - Action Dispatcher
extension Coordinator {
    
    private func handle(action: WebAction, body: Any) {
        switch action {
        case .close:
            handleClose()
            
        case .userListUpdate:
            handleUserUpdate(body)
            
        case .postsUpdate:
            handlePostUpdate(body)
            
        case .commentsUpdate:
            handleCommentUpdate(body)
            
        case .chatsUpdate:
            handleChatUpdate(body)
            
        case .messagesUpdate:
            handleMessageUpdate(body)
            
        case .logout:
            handleLogout(body)
            
        case .payment:
            handlePayment(body)
        }
    }
}

// MARK: - Actions
extension Coordinator {
    
    private func handleClose() {
        navi.pop()
    }
    
    private func handleUserUpdate(_ body: Any) {
        guard let users = extractArray(body, key: "users") else { return }
        storage.saveUsers(RexceaiPwvzwaUser.fromJsonArray(users))
    }
    
    private func handlePostUpdate(_ body: Any) {
        guard let posts = extractArray(body, key: "posts") else { return }
        storage.saveWorks(VieoaVNneqoVideo.fromJsonArray(posts))
    }
    
    private func handleCommentUpdate(_ body: Any) {
        guard let comments = extractArray(body, key: "comments") else { return }
        storage.saveComments(SaascieSeigComment.fromJsonArray(comments))
    }
    
    private func handleChatUpdate(_ body: Any) {
        guard let chats = extractArray(body, key: "chats") else { return }
        storage.saveChatRooms(ZswqoveiNiegChatRoom.fromJsonArray(chats))
    }
    
    private func handleMessageUpdate(_ body: Any) {
        guard let messages = extractArray(body, key: "messages") else { return }
        storage.saveChatMessageList(ZswqoveiNiegMessage.fromJsonArray(messages))
    }
    
    private func handleLogout(_ body: Any) {
        guard let dict = body as? [String: Any],
              let isLogout = dict["isLogout"] as? Bool else {
            return
        }
        
        if isLogout {
            // TODO: 删除账号逻辑
            
            userVM.deleteAccountRexceaiPwvzwa()
        } else {
            storage.setCurrentUserId("")
            userVM.loadLoginRexceaiPwvzwaUser()
        }
        
        navi.popToRoot()
    }
    
    private func handlePayment(_ body: Any) {
        guard let dict = body as? [String: Any],
              let payKey = dict["payKey"] as? String else {
            print("payment 数据错误")
            return
        }
        
        startIAP(payKey: payKey)
    }
}

// MARK: - IAP
extension Coordinator {
    
    /// 同步当前用户到 H5
        func syncCurrentUserToH5() {
            guard let currentUser = storage.getUserById(userId: storage.getCurrentUserId()) else {
                print("❌ 当前用户为空，无法同步到 H5")
                return
            }
            
            // 转成 H5 需要的 TargetUser JSON
            let targetUser = currentUser.toTargetUser()
            let userJSON = encode(targetUser, defaultValue: "{}")
            
            // 转义 \ 和 "
            let escapedJSON = userJSON
                .replacingOccurrences(of: "\\", with: "\\\\")
                .replacingOccurrences(of: "\"", with: "\\\"")
            
            // JS 调用 updateCurrentUser(JSON)
            let js = "updateCurrentUser(JSON.parse(\"\(escapedJSON)\"));"
            
            DispatchQueue.main.async {
                if let orinxAwibaWebView = OtwiNjqoiWebview.currentWebView {
                    orinxAwibaWebView.evaluateJavaScript(js) { result, error in
                        if let error = error {
                            print("❌", error.localizedDescription)
                        }
                    }
                }
            }
        }
    
    private func startIAP(payKey: String) {
        ipaRecharge.zwkAtihaLbhRecharge(payKey) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let diamond):
                self.userVM.increaseUserDiamond(diamond: diamond)
                self.userVM.loadLoginRexceaiPwvzwaUser()
                syncCurrentUserToH5()
                                            
            case .failed(let msg):
                EeuqcjaOrHUD.toast(.error(msg))
                
            case .cancelled, .pending:
                break
            }
        }
    }
}

// MARK: - JSON Helpers
extension Coordinator {
    
    /// 通用数组解析
    private func extractArray(_ body: Any, key: String) -> [[String: Any]]? {
        guard let dict = body as? [String: Any],
              let array = dict[key] as? [[String: Any]] else {
            print("❌ \(key) 数据错误:", body)
            return nil
        }
        return array
    }
    
    /// 通用编码
    private func encode<T: Encodable>(_ obj: T, defaultValue: String = "[]") -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601 // 👈 先加这个
        
        guard let data = try? encoder.encode(obj),
              let json = String(data: data, encoding: .utf8) else {
            return defaultValue
        }
        return json
    }
}

// MARK: - JS 注入
extension Coordinator {
    
    func generateInitialJS() -> String {
        
        let currentUser = storage.getUserById(userId: storage.getCurrentUserId())
        
        let currentUserJSON = currentUser
            .map { encode($0.toTargetUser(), defaultValue: "{}") }
            ?? "{}"
        
        return """
            window.currentUser = JSON.parse('\(escapeForJS(currentUserJSON))');
            window.userList = JSON.parse('\(escapeForJS(encode(storage.getUsers().map { $0.toTargetUser() })))');
            window.postList = JSON.parse('\(escapeForJS(encode(storage.getWorks().map { $0.toTargetPost() })))');
            window.commentList = JSON.parse('\(escapeForJS(encode(storage.getAllComments().map { $0.toTargetComment() })))');
            window.chatList = JSON.parse('\(escapeForJS(encode(storage.getChatRooms().map { $0.toTargetChatRoom() })))');
            window.messageList = JSON.parse('\(escapeForJS(encode(storage.getAllMessages().map { $0.toTargetMessage() })))');
            window.other = \(buildOtherConfig());
        """
    }
    
    func escapeForJS(_ json: String) -> String {
        return json
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "'", with: "\\'")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
    }
    
    private func buildOtherConfig() -> String {
        
        let obj: [String: Any] = [
            "postTheme": [
                "Hobbies",
                "Inspire"
            ],
            "reportContent": [
                    "Harassment",
                    "Malicious fraud",
                    "Pornography",
                    "Malicious insults",
                    "False Information"
                ],
            "coinsSetting": qwoibtwkjJkProducts.map {
                [
                    "key": $0.qwoibtwkjJkKeyId,
                    "cions": $0.qwoibtwkjJkGetDiamond,
                    "money": $0.qwoibtwkjJkPrice
                ]
            }
        ]
        
        let json = encodeAny(obj) // 👇 需要这个方法
        
        return "JSON.parse('\(escapeForJS(json))')"
    }
    
    func encodeAny(_ obj: Any) -> String {
        if let data = try? JSONSerialization.data(withJSONObject: obj),
           let json = String(data: data, encoding: .utf8) {
            return json
        }
        return "{}"
    }
}

struct OtwiNjqoiWeb: View {
    let aswuznaWebUrlString: String
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            OtwiNjqoiWebview(otwiNjqoiWebNav: aswuznaWebUrlString)
                .ignoresSafeArea()
        }.ignoresSafeArea()
            .navigationBarHidden(true)
                .background(LkjaurakjxSwipeBack())
    }
}
