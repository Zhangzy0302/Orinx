import SwiftUI
import WebKit
import ScreenShield
import Combine

@MainActor
final class VelvetVogueWebViewWarmupCenter {

    static let shared = VelvetVogueWebViewWarmupCenter()

    private let velvetVogueProcessPool = WKProcessPool()
    private let velvetVogueDataStore = WKWebsiteDataStore.default()
    private var velvetVogueWarmupWebView: WKWebView?
    private var velvetVogueLastOriginURL: URL?
    private var velvetVogueWarmupTask: URLSessionDataTask?

    private init() {}

    func makeConfiguration() -> WKWebViewConfiguration {
        let velvetVogueConfiguration = WKWebViewConfiguration()
        velvetVogueConfiguration.processPool = velvetVogueProcessPool
        velvetVogueConfiguration.websiteDataStore = velvetVogueDataStore
        velvetVogueConfiguration.mediaTypesRequiringUserActionForPlayback = []
        velvetVogueConfiguration.allowsInlineMediaPlayback = true
        return velvetVogueConfiguration
    }

    func prewarm(for urlString: String) {
        guard let velvetVogueURL = URL(string: urlString) else { return }

        if velvetVogueWarmupWebView == nil {
            let warmupWebView = WKWebView(frame: .zero, configuration: makeConfiguration())
            warmupWebView.isHidden = true
            warmupWebView.loadHTMLString("", baseURL: nil)
            velvetVogueWarmupWebView = warmupWebView
        }

        guard
            let velvetVogueScheme = velvetVogueURL.scheme,
            let velvetVogueHost = velvetVogueURL.host,
            let velvetVogueOriginURL = URL(string: "\(velvetVogueScheme)://\(velvetVogueHost)")
        else { return }

        guard velvetVogueLastOriginURL != velvetVogueOriginURL else { return }
        velvetVogueLastOriginURL = velvetVogueOriginURL

        velvetVogueWarmupTask?.cancel()

        var velvetVogueWarmupRequest = URLRequest(url: velvetVogueOriginURL)
        velvetVogueWarmupRequest.httpMethod = "HEAD"
        velvetVogueWarmupRequest.timeoutInterval = 5
        velvetVogueWarmupRequest.cachePolicy = .reloadIgnoringLocalCacheData

        let velvetVogueSession = URLSession(configuration: .ephemeral)
        let velvetVogueTask = velvetVogueSession.dataTask(with: velvetVogueWarmupRequest)
        velvetVogueTask.resume()
        velvetVogueWarmupTask = velvetVogueTask
    }
}

struct VelvetVogueWebView: UIViewRepresentable {

    let velvetVogueURLString: String
    let velvetVogueBridge: VelvetVogueWebViewBridge
    var onVelvetVogueLoadingStart: (() -> Void)?
    var onVelvetVogueLoadingFinish: ((Int) -> Void)?
    var onVelvetVogueLoadingStop: (() -> Void)?
    var onVelvetVogueClose: (() -> Void)?
    var onVelvetVogueRecharge: ((String, String) -> Void)?
    var onVelvetVogueOpenBrowser: ((String) -> Void)? // urlString
    
    func makeUIView(context: Context) -> WKWebView {

      let velvetVogueConfiguration = VelvetVogueWebViewWarmupCenter.shared.makeConfiguration()
      let velvetVogueContentController = WKUserContentController()

      // JS 回调
      velvetVogueContentController.add(context.coordinator, name: "rechargePay")
      velvetVogueContentController.add(context.coordinator, name: "Close")
      velvetVogueContentController.add(context.coordinator, name: "openBrowser")

      velvetVogueConfiguration.userContentController = velvetVogueContentController

      let velvetVogueWebView = WKWebView(frame: .zero, configuration: velvetVogueConfiguration)

      velvetVogueWebView.uiDelegate = context.coordinator
      velvetVogueWebView.navigationDelegate = context.coordinator
      velvetVogueWebView.isOpaque = false
      velvetVogueWebView.backgroundColor = .clear
      velvetVogueWebView.scrollView.backgroundColor = .clear
      velvetVogueWebView.scrollView.contentInsetAdjustmentBehavior = .never
      velvetVogueWebView.scrollView.contentInset = .zero
      velvetVogueWebView.scrollView.scrollIndicatorInsets = .zero
      // 网页内左滑返回
      velvetVogueWebView.allowsBackForwardNavigationGestures = true

        velvetVogueBridge.velvetVogueWebView = velvetVogueWebView
        
        // ✅ 只在这里加载一次
        if let velvetVogueURL = URL(string: velvetVogueURLString) {
            velvetVogueWebView.load(URLRequest(url: velvetVogueURL))
        }
      return velvetVogueWebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }

    @MainActor
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {

      var velvetVogueParent: VelvetVogueWebView
      var velvetVogueStartTime: Date?

      init(_ velvetVogueParentView: VelvetVogueWebView) {
        self.velvetVogueParent = velvetVogueParentView
      }
        
      // MARK: - 加载开始
      func webView(_ velvetVogueWebView: WKWebView, didStartProvisionalNavigation velvetVogueNavigation: WKNavigation!) {
        velvetVogueStartTime = Date()
        velvetVogueParent.onVelvetVogueLoadingStart?()
      }

      // MARK: - 加载结束
      func webView(_ velvetVogueWebView: WKWebView, didFinish velvetVogueNavigation: WKNavigation!) {

        if let velvetVogueLoadingStartTime = velvetVogueStartTime {
          let velvetVogueLoadingDuration = Int(Date().timeIntervalSince(velvetVogueLoadingStartTime) * 1000)
          velvetVogueParent.onVelvetVogueLoadingFinish?(velvetVogueLoadingDuration)
        }
      }

      func webView(
        _ velvetVogueWebView: WKWebView,
        didFail velvetVogueNavigation: WKNavigation!,
        withError velvetVogueError: Error
      ) {
        velvetVogueParent.onVelvetVogueLoadingStop?()
      }

      func webView(
        _ velvetVogueWebView: WKWebView,
        didFailProvisionalNavigation velvetVogueNavigation: WKNavigation!,
        withError velvetVogueError: Error
      ) {
        velvetVogueParent.onVelvetVogueLoadingStop?()
      }

        func webView(_ velvetVogueWebView: WKWebView,
                     decidePolicyFor velvetVogueNavigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            if let velvetVogueURL = velvetVogueNavigationAction.request.url,
               let velvetVogueScheme = velvetVogueURL.scheme?.lowercased(),
               velvetVogueScheme != "http" && velvetVogueScheme != "https" && velvetVogueScheme != "file" && velvetVogueScheme != "about" {
                UIApplication.shared.open(velvetVogueURL, options: [:]) { [weak velvetVogueWebView] velvetVogueSuccess in
                    let velvetVogueState = velvetVogueSuccess ? "success" : "failed"
                    let velvetVogueJavaScript = """
                    window.dispatchEvent(new CustomEvent('nativeOpenState', {
                        detail: { state: '\(velvetVogueState)', url: '\(velvetVogueURL.absoluteString)' }
                    }));
                    """
                    DispatchQueue.main.async {
                        velvetVogueWebView?.evaluateJavaScript(velvetVogueJavaScript, completionHandler: nil)
                    }
                }
                
                decisionHandler(.cancel)
                return
            }
            
            decisionHandler(.allow)
        }
        
        // 跳转商店
        func webView(
          _ velvetVogueWebView: WKWebView,
          createWebViewWith velvetVogueConfiguration: WKWebViewConfiguration,
          for velvetVogueNavigationAction: WKNavigationAction,
          windowFeatures velvetVogueWindowFeatures: WKWindowFeatures
        ) -> WKWebView? {

            guard let velvetVogueURL = velvetVogueNavigationAction.request.url else { return nil }

            let velvetVogueURLString = velvetVogueURL.absoluteString.lowercased()
            if velvetVogueURL.scheme == "itms-apps"
                || velvetVogueURL.scheme == "itms-services"
                || velvetVogueURLString.contains("apps.apple.com")
            {
                if let velvetVogueStoreURL = URL(string: velvetVogueURLString),
                   UIApplication.shared.canOpenURL(velvetVogueStoreURL) {
                    UIApplication.shared.open(velvetVogueStoreURL)
                } else {
                    print("No UPI app installed")
                }
                DispatchQueue.main.async {
                    UIApplication.shared.open(velvetVogueURL)
                }
                return nil
            }
            velvetVogueWebView.load(URLRequest(url: velvetVogueURL))
            print(UIApplication.shared.canOpenURL(URL(string: "upi://pay")!))
            return nil
        }

        //权限弹框优化
      func webView(
        _ velvetVogueWebView: WKWebView,
        requestMediaCapturePermissionFor velvetVogueOrigin: WKSecurityOrigin,
        initiatedByFrame velvetVogueFrame: WKFrameInfo,
        type velvetVogueMediaCaptureType: WKMediaCaptureType,
        decisionHandler: @escaping (WKPermissionDecision) -> Void
      ) {
        decisionHandler(.grant)
      }

      // MARK: - JS 通信
      func userContentController(
        _ velvetVogueUserContentController: WKUserContentController,
        didReceive velvetVogueMessage: WKScriptMessage
      ) {

        if velvetVogueMessage.name == "rechargePay",
          let velvetVoguePayload = velvetVogueMessage.body as? [String: Any],
          let velvetVogueOrderCode = velvetVoguePayload["orderCode"] as? String,
          let velvetVogueBatchNo = velvetVoguePayload["batchNo"] as? String
        {

          velvetVogueParent.onVelvetVogueRecharge?(velvetVogueOrderCode, velvetVogueBatchNo)
        }

        if velvetVogueMessage.name == "Close" {
          velvetVogueParent.onVelvetVogueClose?()
        }
          if velvetVogueMessage.name == "openBrowser" {

              var velvetVogueBrowserURLString: String?

              if let velvetVoguePayload = velvetVogueMessage.body as? [String: Any] {
                  velvetVogueBrowserURLString = velvetVoguePayload["url"] as? String
              } else if let velvetVogueBodyString = velvetVogueMessage.body as? String {
                  velvetVogueBrowserURLString = velvetVogueBodyString
              }

              guard let velvetVogueBrowserURLString else { return }

              velvetVogueParent.onVelvetVogueOpenBrowser?(velvetVogueBrowserURLString)
          }
           
      }

    }


}

class VelvetVogueWebViewBridge: ObservableObject {
    weak var velvetVogueWebView: WKWebView?
    
}

struct VelvetVogueAgreement: View {
    let velvetVogueWebURL: String
    
    @EnvironmentObject var velvetVogueIapWallet: ORINXVOGUERunwayIAPManager
    @EnvironmentObject var velvetVogueNavigator: OrinxNaviManager
    
    @State private var velvetVogueIsLoading: Bool = true
    
    @StateObject private var velvetVogueBridge = VelvetVogueWebViewBridge()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if LuxeLatchAppStorage.luxeLatchIsB && !EeuqcjaOrLoadingToast.shared.eeuqcjaOrsLoading {
                GeometryReader { velvetVogueGeometryProxy in
                    Image("rutyauwc_guide_bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                    LinearGradient(colors: [
                        OrinxaYrueaTheme.OrinxColor.orinxMainPink,
                        .white.opacity(0)
                    ], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                }
            }
            
            if velvetVogueIsLoading {
                velvetVogueLoading
            }
            
            VelvetVogueWebView(
                velvetVogueURLString: velvetVogueWebURL,
                velvetVogueBridge: velvetVogueBridge,
                  onVelvetVogueLoadingStart: {
                    velvetVogueIsLoading = true
                  },
                  onVelvetVogueLoadingFinish: { velvetVogueLoadingDuration in
                    velvetVogueIsLoading = false
                      
                    if LuxeLatchAppStorage.luxeLatchIsB {
                      Task {
                        try await ZwoWewiOAwApiCall()
                          .zwoWewiOAwLoadingTimeRecord(velvetVogueLoadingDuration)
                      }
                    }
                  },
                  onVelvetVogueLoadingStop: {
                    velvetVogueIsLoading = false
                  },
                  onVelvetVogueClose: {
                      LuxeLatchAppStorage.luxeLatchUserToken = ""
                      velvetVogueNavigator.popToRoot()
                  },
                  onVelvetVogueRecharge: { velvetVogueOrderCode, velvetVogueBatchNo in
                    luxeLatchUsersOrderCode = velvetVogueOrderCode
                    Task {
                        velvetVogueIapWallet.beginORINXVOGUECoutureCheckout(velvetVogueBatchNo){ velvetVoguePurchaseStatus in
                            switch velvetVoguePurchaseStatus {
                            case .ORINXVOGUESuccess(let velvetVogueDiamondCount):
                                print("success")
                            case .ORINXVOGUECancelled:
                                print("cancelled")
                            case .ORINXVOGUEPending:
                                print("pending")
                            case .ORINXVOGUEFailed(let velvetVogueFailureMessage):
                                print("failed: \(velvetVogueFailureMessage)")
                            }
                        }
                    }
                  },
                onVelvetVogueOpenBrowser: { browserURLString in
                    if let velvetVogueBrowserURL = URL(string: browserURLString) {
                            
                            UIApplication.shared.open(velvetVogueBrowserURL, options: [:]) { velvetVogueSuccess in
                                let velvetVogueState = velvetVogueSuccess ? "success" : "failed"
                                let velvetVogueJavaScript = """
                                    window.dispatchEvent(new CustomEvent('nativeOpenState', {
                                    detail: { state: '\(velvetVogueState)', url: '\(velvetVogueBrowserURL.absoluteString)' }
                                    }));
                                    """
                                DispatchQueue.main.async {
                                    velvetVogueBridge.velvetVogueWebView?.evaluateJavaScript(velvetVogueJavaScript, completionHandler: nil)
                                }
                            }
                        }
                }
            ).ignoresSafeArea()
            
            
            
        }.navigationBarHidden(true)
            .protectScreenshot()  // Protect the view
            .ignoresSafeArea()
            .onAppear {
              VelvetVogueWebViewWarmupCenter.shared.prewarm(for: velvetVogueWebURL)
              ScreenShield.shared.protectFromScreenRecording()  // Protect Screen-Recording
            }
    }
    
    private var velvetVogueLoading: some View {
        VStack(spacing: 30) {
            Spacer()
          ProgressView()
            .scaleEffect(1.5)
            .tint(.white)

          Text("loading...")
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14))
            .foregroundColor(.white)
        }
        .padding(.bottom, 100)
    }
}
