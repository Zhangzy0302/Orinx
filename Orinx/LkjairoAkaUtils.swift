import SwiftUI
import CommonCrypto

// 桥接 UIKit 恢复手势
struct LkjaurakjxSwipeBack: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        
        DispatchQueue.main.async {
            if let xlkjywiwjkc = controller.navigationController {
                xlkjywiwjkc.interactivePopGestureRecognizer?.isEnabled = true
                xlkjywiwjkc.interactivePopGestureRecognizer?.delegate = nil
            }
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

func delay(_ seconds: Double) async {
  try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
}

struct LkjariaxEmptyData: View {
    let lkajiwraTopPadding: CGFloat
    var body: some View {
        VStack{
            Image("empty")
                .resizable()
                .frame(width: 200, height: 200)
            Text("NO Data")
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                .foregroundStyle(.black)
        }.frame(maxWidth: .infinity)
            .padding(.top, lkajiwraTopPadding)
    }
}


struct XaiwgAesECBTool {

    /// 固定16字节key（128bit）
    private static let xaiwgKey = "orinx67890abcdef" // 必须16字符

    /// 加密（返回 Base64）
    static func xaiwgEncrypt(_ text: String) -> String? {
        guard let data = text.data(using: .utf8),
              let encrypted = xaiwgAES(data: data, operation: CCOperation(kCCEncrypt)) else {
            return nil
        }
        return encrypted.base64EncodedString()
    }

    /// 解密（Base64 → String）
    static func xaiwgDecrypt(_ base64: String) -> String {
        guard let data = Data(base64Encoded: base64),
              let decrypted = xaiwgAES(data: data, operation: CCOperation(kCCDecrypt)) else {
            return "error"
        }
        return String(data: decrypted, encoding: .utf8) ?? "error"
    }

    /// 核心 AES 方法
    private static func xaiwgAES(data: Data, operation: CCOperation) -> Data? {

        let keyData = xaiwgKey.data(using: .utf8)!
        let keyLength = size_t(kCCKeySizeAES128)

        let dataLength = data.count
        let bufferSize = dataLength + kCCBlockSizeAES128
        var buffer = Data(count: bufferSize)

        var numBytesProcessed: size_t = 0

        let cryptStatus = buffer.withUnsafeMutableBytes { bufferBytes in
            data.withUnsafeBytes { dataBytes in
                keyData.withUnsafeBytes { keyBytes in

                    CCCrypt(
                        operation,                 // 加密/解密
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding | kCCOptionECBMode), // 👈 ECB + PKCS7
                        keyBytes.baseAddress,
                        keyLength,
                        nil,                      // ECB 不需要 IV
                        dataBytes.baseAddress,
                        dataLength,
                        bufferBytes.baseAddress,
                        bufferSize,
                        &numBytesProcessed
                    )
                }
            }
        }

        if cryptStatus == kCCSuccess {
            return buffer.prefix(numBytesProcessed)
        } else {
            print("AES失败:", cryptStatus)
            return nil
        }
    }
}
