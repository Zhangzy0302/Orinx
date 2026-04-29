import SwiftUI

struct VnziwbLiwNavPage: View {
    @State private var vnzisCurrentIndex: Int = 0
    
    @EnvironmentObject var vnziwbLiwNavi: OrinxNaviManager
    @EnvironmentObject var vnaziwUserVM: RexceaiPwvzwaUserViewModel
    
    private let vnziwbHomeText = "6gn2Fon9j0C32Vv8DnwWcQ=="
    private let vnziwbVideoText = "/k/55fWKyUlobOVQKvzNdw=="
    private let vnziwbPublishText = "/XgDKj0PbWH5sax8OWMXiA=="
    private let vnziwbMessageText = "wqAqCtqekxNQCPEXdMtQww=="
    private let vnziwbProfileText = "5yrRAURTPPKaXGKt7Q/Wag=="
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            
            VStack {
                TabView(selection: $vnzisCurrentIndex) {
                    BrNozhwiHome().tag(0)
                    Pcinzwin2jdVideo().tag(1)
                    Teyuxh24aMessage().tag(2)
                    Xzwuu858LKvMine().tag(3)
                }
                .background(Color.clear.ignoresSafeArea())
                    .safeAreaInset(edge: .bottom) {
                        ZStack {
                            
                            Image("cjlwibda_nav_bg")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 77)
                                .clipped()
                            
                            HStack {
                                Image("rutyauwc_orinx")
                                    .resizable()
                                    .frame(width: 53, height: 37.5)
                                    .padding(.horizontal, 24)
                                HStack {
                                    VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_home", vnzinabIndex: 0, vnziwNavName: XaiwgAesECBTool.xaiwgDecrypt(vnziwbHomeText))
                                    VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_video", vnzinabIndex: 1, vnziwNavName: XaiwgAesECBTool.xaiwgDecrypt(vnziwbVideoText))
                                    VStack(spacing: 2) {
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
                                        
                                        Text(XaiwgAesECBTool.xaiwgDecrypt(vnziwbPublishText))
                                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(9, weight: .bold))
                                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                                    }.frame(maxWidth: .infinity)
                                        .onTapGesture {
                                            if vnaziwUserVM.currentUser!.isRexceaiPwvzwaGuest {
                                                vnziwbLiwNavi.showGuestAlert()
                                                return
                                            }
                                            vnziwbLiwNavi.push(.otwiNjqoWeb(url: "publishPicPost"))
                                        }
                                    VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_message", vnzinabIndex: 2, vnziwNavName: XaiwgAesECBTool.xaiwgDecrypt(vnziwbMessageText))
                                    VnziwbLiwnNavBtn(vnaizjCurrentIndex: $vnzisCurrentIndex, vnziwbLiwNavIcon: "rutyauwc_nav_mine", vnzinabIndex: 3, vnziwNavName: XaiwgAesECBTool.xaiwgDecrypt(vnziwbProfileText))
                                }.padding(.trailing, 20)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 77)
                    }
            }
            .ignoresSafeArea(edges: .bottom)
            
        }
        .navigationBarHidden(true)
            .task {
                try? await Task.sleep(nanoseconds: 1_200_000_000)
                ORINXVOGUECatwalkWebCanvas.ORINXVOGUEpreloadRootPageIfNeeded()
            }
            .onChange(of: vnziwbLiwNavi.orainxiALwiPath) { route in
                vnaziwUserVM.loadLoginRexceaiPwvzwaUser()
                
            }
            
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
