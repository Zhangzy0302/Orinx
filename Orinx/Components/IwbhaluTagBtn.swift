import SwiftUI

struct IwbhaluTagBtn<Content: View>: View {
    let iwbhaluWidth: CGFloat
    let iwbnhalHeight: CGFloat
    let colorIsBlack: Bool
    
    @ViewBuilder let content: Content
    
    init(
            iwbhaluWidth: CGFloat,
            iwbnhalHeight: CGFloat,
            colorIsBlack: Bool = true, // 👈 默认值
            @ViewBuilder content: () -> Content
        ) {
            self.iwbhaluWidth = iwbhaluWidth
            self.iwbnhalHeight = iwbnhalHeight
            self.colorIsBlack = colorIsBlack
            self.content = content()
        }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .stroke(colorIsBlack ? .black : OrinxaYrueaTheme.OrinxColor.orinxMainPink, lineWidth: 2)
                .frame(width: iwbhaluWidth - 4, height: iwbnhalHeight - 4)
            content
        }.frame(width: iwbhaluWidth, height: iwbnhalHeight)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
    }
}
