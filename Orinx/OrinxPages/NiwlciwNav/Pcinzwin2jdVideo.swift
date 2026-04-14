import SwiftUI

struct Pcinzwin2jdVideo: View {
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ZStack(alignment: .bottomTrailing){
                        IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47) {
                            Text("Latest")
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
                    
                }
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 11),
                GridItem(.flexible())
            ], spacing: 10) {
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
                        }
                    }
                }.padding(4)
                    .frame(height: 224)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.05))
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
    }
}
