import SwiftUI

struct Teyuxh24aMessage: View {
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .bottomTrailing){
                Text("Message")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .bold))
                    .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    .transformEffect(
                            CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                    ).padding(.leading, 5)
                Image("cnwal_point_orange")
                    .resizable()
                    .frame(width: 22.5, height: 23)
                    .offset(x: 18.6, y: 0)
            }.padding(.horizontal, 20)
            IwbhaluTagBtn(iwbhaluWidth: 106, iwbnhalHeight: 47) {
                Text("Active")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                    .foregroundStyle(.black)
                    .transformEffect(
                            CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                    ).padding(.leading, 5)
            }.padding(.horizontal, 20)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15){
                    VStack(spacing: 0){
                        ZStack{
                            Circle()
                                .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                .frame(width: 68, height: 68)
                        }
                        Text("Josiri")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(15, weight: .bold))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                            .lineLimit(1)
                    }.padding(.top, 4)
                        .frame(width: 76, height: 98)
                        .background(
                            UnevenRoundedRectangle(topLeadingRadius: 100, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 100)
                                .fill(.white)
                        ).shadow(color: Color(red: 0.06, green: 0.48, blue: 0.57, opacity: 0.2), radius: 4)
                }.padding(.horizontal, 20)
            }
        }.navigationBarHidden(true)
            .background(LkjaurakjxSwipeBack())
    }
}

#Preview {
    Teyuxh24aMessage()
}
