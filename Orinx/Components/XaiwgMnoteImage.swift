import SwiftUI

struct XaiwgMnoteImage: View {

  let xaiwgMnoteImageUrl: String
  let xaiwgMnoteWidth: CGFloat?
  let xaiwgMnoteHeight: CGFloat?
  let xaiwgMnoteIsCircle: Bool
  let xaiwgMnoteContentMode: ContentMode

  init(
    _ xaiwgMnoteImageUrl: String,
    xaiwgMnoteWidth: CGFloat? = nil,
    xaiwgMnoteHeight: CGFloat? = nil,
    xaiwgMnoteIsCircle: Bool = false,
    xaiwgMnoteContentMode: ContentMode = .fill
  ) {
    self.xaiwgMnoteImageUrl = xaiwgMnoteImageUrl
    self.xaiwgMnoteWidth = xaiwgMnoteWidth
    self.xaiwgMnoteHeight = xaiwgMnoteHeight
    self.xaiwgMnoteIsCircle = xaiwgMnoteIsCircle
    self.xaiwgMnoteContentMode = xaiwgMnoteContentMode
  }

  var body: some View {
    buildImage()
      .frame(width: xaiwgMnoteWidth, height: xaiwgMnoteHeight)
      .clipped()
      .modifier(XaiwgMnoteCircleModifier(isCircle: xaiwgMnoteIsCircle))
  }
}

// MARK: - Modifier（让 body 更干净）
fileprivate struct XaiwgMnoteCircleModifier: ViewModifier {
  let isCircle: Bool

  func body(content: Content) -> some View {
    if isCircle {
      content.clipShape(Circle())
    } else {
      content
    }
  }
}

// MARK: - Build Image
extension XaiwgMnoteImage {

  fileprivate func isLocalFilePath(_ path: String) -> Bool {
    path.hasPrefix("/")
  }

  fileprivate func isNetworkUrl(_ path: String) -> Bool {
    path.hasPrefix("http://") || path.hasPrefix("https://")
  }

  @ViewBuilder
  fileprivate func buildImage() -> some View {

    if xaiwgMnoteImageUrl.isEmpty {
      placeholderView()
    }

    else if isNetworkUrl(xaiwgMnoteImageUrl),
            let url = URL(string: xaiwgMnoteImageUrl) {

      AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
          placeholderView()

        case .success(let image):
          buildResizableImage(image)

        case .failure:
          placeholderView()

        @unknown default:
          placeholderView()
        }
      }
    }

    else if isLocalFilePath(xaiwgMnoteImageUrl),
            let uiImage = UIImage(contentsOfFile: xaiwgMnoteImageUrl) {

      buildResizableImage(Image(uiImage: uiImage))
    }

    else {
      buildResizableImage(Image(xaiwgMnoteImageUrl))
    }
  }

  // ✅ 统一处理 resizable + contentMode
  fileprivate func buildResizableImage(_ image: Image) -> some View {
    image
      .resizable()
      .aspectRatio(contentMode: xaiwgMnoteContentMode)
  }

  fileprivate func placeholderView() -> some View {
    ZStack {
      Color(red: 23/255, green: 23/255, blue: 23/255)
      Image(systemName: "photo")
        .foregroundColor(.gray)
    }
  }
}
