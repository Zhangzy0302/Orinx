import SwiftUI

struct VnziwbLiwNavPage: View {
    @State private var vnzisCurrentIndex: Int = 0
    
    @EnvironmentObject var vnziwbLiwNavi: OrinxNaviManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            VStack{
                GeometryReader { geo in
                    ZStack(alignment: .top){
                        BrNozhwiHome().opacity(vnzisCurrentIndex == 0 ? 1 : 0)
                        Pcinzwin2jdVideo().opacity(vnzisCurrentIndex == 1 ? 1 : 0)
                        Teyuxh24aMessage().opacity(vnzisCurrentIndex == 2 ? 1 : 0)
                        Xzwuu858LKvMine().opacity(vnzisCurrentIndex == 3 ? 1 : 0)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                HStack{
                    Image("rutyauwc_orinx")
                        .resizable()
                        .frame(width: 53, height: 37.5)
                        .padding(.horizontal, 24)
                    HStack{
                        VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_home", vnzinabIndex: 0, vnziwNavName: "Home")
                        VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_video", vnzinabIndex: 1, vnziwNavName: "Video")
                        VStack(spacing: 2){
                            Image("rutyauwc_publish")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .frame(width: 34, height: 34)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(.white.opacity(0.3))
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(LinearGradient(colors: [
                                                .white, .white.opacity(0)
                                            ], startPoint: .bottom, endPoint: .top), lineWidth: 1)
                                    }.shadow(color: Color(red: 0.06, green: 0.48, blue: 0.57, opacity: 0.06), radius: 8))
                            
                            Text("Publish")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(9, weight: .bold))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                        }.frame(maxWidth: .infinity)
                            .onTapGesture {
                                vnziwbLiwNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "publishPicPost"))
                            }
                        VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_message", vnzinabIndex: 2, vnziwNavName: "Message")
                        VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_mine", vnzinabIndex: 3, vnziwNavName: "Profile")
                    }.padding(.trailing, 20)
                }.frame(height: 77)
                    .frame(maxWidth: .infinity)
                    .background(
                    Image("cjlwibda_nav_bg")
                        .resizable()
                )
            }.ignoresSafeArea(edges: .bottom)
            
        }.navigationBarHidden(true)
            
    }
    
    struct VnziwbLiwnNavBtn: View {
        @Binding var vnaizjCurrentIndex: Int
        
        let vnziwbLiwNavIcon: String
        let vnzinabIndex: Int
        let vnziwNavName: String
        
        var body: some View {
            VStack(spacing: 2){
                Image(!(vnaizjCurrentIndex == vnzinabIndex) ? vnziwbLiwNavIcon : "\(vnziwbLiwNavIcon)_s")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .frame(width: 34, height: 34)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(.white.opacity(0.3))
                        .overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(LinearGradient(colors: [
                                    .white, .white.opacity(0)
                                ], startPoint: .bottom, endPoint: .top), lineWidth: 1)
                        }.shadow(color: Color(red: 0.06, green: 0.48, blue: 0.57, opacity: 0.06), radius: 8))
                
                Text(vnziwNavName)
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(9, weight: .bold))
                    .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
            }.frame(maxWidth: .infinity)
                .onTapGesture {
                    vnaizjCurrentIndex = vnzinabIndex
                }
            
        }
    }
}

#Preview {
    VnziwbLiwNavPage()
}
