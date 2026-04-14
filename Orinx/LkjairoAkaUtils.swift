import SwiftUI

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
