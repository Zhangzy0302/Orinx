import SwiftUI

struct Xzwuu858LKvMine: View {
    var body: some View {
        ZStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    HStack(alignment: .bottom){
                        ZStack{
                            Circle()
                                .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                .frame(width: 68, height: 68)
                        }
                        Spacer()
                        HStack{
                            VStack(alignment: .leading, spacing: 10){
                                Text("258")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                    .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                Text("Following")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                    .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                            }.frame(maxWidth: .infinity)
                            VStack(alignment: .leading, spacing: 10){
                                Text("258")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                    .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                Text("Fans")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                    .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                            }.frame(maxWidth: .infinity)
                        }.frame(width: 170)
                    }
                    HStack(spacing: 12.5){
                        Text("Oliokn")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .regular))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    }
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 2){
                            Text("Wallet Balance:")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                    ).padding(.leading, 5)
                            HStack {
                                Image("xiejljbj_coin")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                Text("9999")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                    .foregroundStyle(Color(red: 68/255, green: 68/255, blue: 68/255))
                            }
                            
                        }
                        Spacer()
                        IwbhaluTagBtn(iwbhaluWidth: 47, iwbnhalHeight: 34) {
                            HStack(spacing: 7){
                                Image("rutyauwc_arrow_right")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }.padding(.bottom, 5)
                        
                    }.padding(.horizontal, 18)
                        .padding(.top, 7)
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
                        IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47) {
                            Text("Works")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                .foregroundStyle(.black)
                                .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                    )
                                .padding(.leading, 5)
                        }
                        Image("cnwal_point_black")
                            .resizable()
                            .frame(width: 22, height: 23)
                            .offset(x: 11.5, y: 3)
                    }
                    
                }.padding(.horizontal, 20)
                    .padding(.top, 17)
            }
            
        }
        
    }
}

#Preview {
    Xzwuu858LKvMine()
}
