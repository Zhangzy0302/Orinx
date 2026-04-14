import SwiftUI

struct BrNozhwiHome: View {
    var body: some View {
        ZStack(alignment: .top){
            HStack{
                Spacer()
                Image("rutyauwc_ai_charactor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 174)
            }
            VStack(alignment: .leading, spacing: 0){
                ZStack{
                    Circle()
                        .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                        .frame(width: 68, height: 68)
                }.padding(.top, 17)
                Text("Oliokn")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36))
                    .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                Text("Confused about \nFashion? Let AI \nStyling Assistant \nSolve It!")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                    .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text("Try it now")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                        Text("Embark on an AI journey")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                    }
                    Spacer()
                    IwbhaluTagBtn(iwbhaluWidth: 85, iwbnhalHeight: 34) {
                        HStack(spacing: 7){
                            Text("GO")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                .foregroundStyle(.black)
                                .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.3, d: 1, tx: 0, ty: 0)
                                    ).padding(.leading, 5)
                            Image("rutyauwc_arrow_right")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                }.padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(LinearGradient(colors: [
                                        .white, .white.opacity(0)
                                    ], startPoint: .bottom, endPoint: .top), lineWidth: 1)
                            }
                    ).padding(.top, 17)
                    .padding(.bottom, 20)
                
                ZStack(alignment: .bottomTrailing){
                    IwbhaluTagBtn(iwbhaluWidth: 132, iwbnhalHeight: 47) {
                        Text("New Trend")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                            .foregroundStyle(.black)
                            .transformEffect(
                                    CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                ).padding(.leading, 5)
                        
                    }
                    Image("cnwal_point_black")
                        .resizable()
                        .frame(width: 22, height: 23)
                        .offset(x: 11.5, y: 3)
                }
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 11),
                    GridItem(.flexible())
                ], spacing: 10) {
                    Eiwch827PostItem()
                }
            }.padding(.horizontal, 20)
        }
    }
}


