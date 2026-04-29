import SwiftUI
import Combine

enum EeuqcjaOrHUDAction {
    case normal(String)
    case success(String)
    case error(String)
}

enum EeuqcjaOrHUD {

    static func toast(_ action: EeuqcjaOrHUDAction) {
        EeuqcjaOrExecuteOnMain {
            switch action {
            case .normal(let text):
                EeuqcjaOrLoadingToast.shared.showToast(text)

            case .success(let text):
                EeuqcjaOrLoadingToast.shared.showToast(text, type: .success)

            case .error(let text):
                EeuqcjaOrLoadingToast.shared.showToast(text, type: .error)
            }
        }
    }

    static func showLoading(showBackground: Bool = false) {
            EeuqcjaOrExecuteOnMain {
                EeuqcjaOrLoadingToast.shared.showLoading(showBackground: showBackground)
            }
        }

        static func hideLoading() {
            EeuqcjaOrExecuteOnMain {
                EeuqcjaOrLoadingToast.shared.hideLoading()
            }
        }

        private static func EeuqcjaOrExecuteOnMain(
            _ action: @escaping @MainActor () -> Void
        ) {
            Task { @MainActor in
                action()
            }
        }
}

@MainActor
final class EeuqcjaOrLoadingToast: ObservableObject {

    static let shared = EeuqcjaOrLoadingToast()

    @Published var toast: EeuqcjaOrToast?
    @Published var eeuqcjaOrsLoading: Bool = false
    @Published var showBackground: Bool = false // ✅ 是否显示黑色半透明背景

    private init() {}

    func showToast(
        _ text: String,
        type: EeuqcjaOrToastType = .normal,
        duration: TimeInterval = 1.8
    ) {
        toast = EeuqcjaOrToast(text: text, type: type)

        Task {
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            self.toast = nil
        }
    }

    /// 显示 loading，可选择是否显示遮罩
    func showLoading(showBackground: Bool = false) {
        self.showBackground = showBackground
        eeuqcjaOrsLoading = true
    }

    func hideLoading() {
        eeuqcjaOrsLoading = false
        showBackground = false
    }
}


struct EeuqcjaOrHUDView: View {

  @ObservedObject private var eeuqcjaOrLoadingToast = EeuqcjaOrLoadingToast.shared

  var body: some View {
    ZStack {
    // 🚫 Loading 时的点击拦截层
          if eeuqcjaOrLoadingToast.eeuqcjaOrsLoading {
              if eeuqcjaOrLoadingToast.showBackground {
                  Color.black
                      .opacity(0.6) // 默认半透明，可调
                      .ignoresSafeArea()
              }else {
                  Color.black
                    .opacity(0.001) // 必须 > 0，否则不拦截事件
                    .ignoresSafeArea()
              }
            
          }
      // Loading
      if eeuqcjaOrLoadingToast.eeuqcjaOrsLoading {
        // 弹窗内容
        VStack(spacing: 22) {
          ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(1.4)
            .tint(.white)

          Text("Loading...")
            .foregroundColor(.white)
        }.frame(width: 130, height: 130)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(.black.opacity(0.8))
            .cornerRadius(20))
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        }
//        .shadow(color: KaelGhueauTheme.KaelColor.kaelMainYellow, radius: 4, y: 2)
        .padding(.horizontal, 40)

      }

      // Toast
      if let toast = eeuqcjaOrLoadingToast.toast {
        VStack {
          Spacer()
            VStack(spacing: 16) {

            if let eeuqcjaOrcon = toast.type.eeuqcjaOrcon {
              Image(systemName: eeuqcjaOrcon)
                    .font(.system(size: 30))
                    .frame(width: 30)
                    .foregroundColor(toast.type.eeuqcjaOrColor)
            }

            Text(toast.text)
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14))
              .foregroundColor(.white)
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 14)
          .background(.black.opacity(0.8))
          .cornerRadius(20)
          .overlay{
              RoundedRectangle(cornerRadius: 20)
                  .stroke(.white, lineWidth: 1)
          }
          .transition(.opacity.combined(with: .move(edge: .top)))

          Spacer()
        }
      }
    }
    .animation(.easeInOut, value: eeuqcjaOrLoadingToast.eeuqcjaOrsLoading)
  }
}

enum EeuqcjaOrToastType {
  case normal
  case success
  case error

  var eeuqcjaOrColor: Color {
    switch self {
    case .normal:
      return .white
    case .success:
      return .green
    case .error:
      return .red
    }
  }

  var eeuqcjaOrcon: String? {
    switch self {
    case .success:
      return "checkmark.circle.fill"
    case .error:
      return "xmark.circle.fill"
    default:
      return nil
    }
  }
}

struct EeuqcjaOrToast {
  let text: String
  let type: EeuqcjaOrToastType
}
