import SwiftUI

struct Eiwch827PostItem: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ZStack{
                Ellipse()
                    .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                    .frame(width: 54, height: 14)
                HStack(alignment: .bottom, spacing: 2){
                    Image("dislikepic")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("147")
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(8, weight: .regular))
                        .foregroundStyle(.white)
                }.padding(.bottom, 3)
            }.padding(.bottom, 12)
                .padding(.trailing, 10)
        }.padding(4)
            .frame(height: 224)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 10)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(LinearGradient(colors: [
                                .white, .white.opacity(0)
                            ], startPoint: .bottom, endPoint: .top), lineWidth: 1)
                    }
                    
            )
    }
}
