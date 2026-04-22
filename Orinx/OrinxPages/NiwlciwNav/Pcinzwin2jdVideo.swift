import SwiftUI

struct Pcinzwin2jdVideo: View {
    @EnvironmentObject var picinzwPostVM: VieoaVNneqoVideoViewModel
    @EnvironmentObject var piczOrinNavi: OrinxNaviManager
    @EnvironmentObject var picziwOrinUserVm: RexceaiPwvzwaUserViewModel
    
    @State private var pcinzwinIsLatest: Int = 0
    
    private let pcinzwinLatestText = "+PB+8V250hz4vQWJfoO5Dw=="
    private let pcinzwinNearbyText = "At2rlFKLqPoAlKvQHcNbDQ=="
    private let pcinzwinClockInText = "xQ4/iRgwxcUZrg7DXRXBwg=="
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            
            VStack{
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        ZStack(alignment: .bottomTrailing){
                            IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47, colorIsBlack: pcinzwinIsLatest == 1) {
                                Text(XaiwgAesECBTool.xaiwgDecrypt(pcinzwinLatestText))
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(pcinzwinIsLatest == 0 ? OrinxaYrueaTheme.OrinxColor.orinxMainPink : .black)
                                    .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                    )
                                    .padding(.leading, 5)
                            }
                            if pcinzwinIsLatest == 0 {
                                Image("cnwal_point_orange")
                                    .resizable()
                                    .frame(width: 22, height: 23)
                                    .offset(x: 11.5, y: 3)
                            }
                            
                        }.onTapGesture {
                            pcinzwinIsLatest = 0
                        }
                        ZStack(alignment: .bottomTrailing){
                            IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47, colorIsBlack: pcinzwinIsLatest == 0) {
                                Text(XaiwgAesECBTool.xaiwgDecrypt(pcinzwinNearbyText))
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(pcinzwinIsLatest == 1 ? OrinxaYrueaTheme.OrinxColor.orinxMainPink : .black)
                                    .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                    )
                                    .padding(.leading, 5)
                            }
                            if pcinzwinIsLatest == 1 {
                                Image("cnwal_point_orange")
                                    .resizable()
                                    .frame(width: 22, height: 23)
                                    .offset(x: 11.5, y: 3)
                            }
                        }.onTapGesture {
                            pcinzwinIsLatest = 1
                        }
                        IwbhaluTagBtn(iwbhaluWidth: 125, iwbnhalHeight: 47) {
                            HStack(spacing: 0){
                                Text(XaiwgAesECBTool.xaiwgDecrypt(pcinzwinClockInText))
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(.black)
                                    .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                    )
                                    .padding(.leading, 5)
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.black)
                            }
                            
                        }.onTapGesture {
                            if picziwOrinUserVm.currentUser!.isRexceaiPwvzwaGuest {
                                piczOrinNavi.showGuestAlert()
                                return
                            }
                            piczOrinNavi.push(.otwiNjqoWeb(url: "publishVideoPost"))
                        }
                    }.padding(.horizontal, 20)
                }.scrollContentBackground(.hidden)
                    .scrollIndicators(.hidden)
                    .padding(.top, 12)
                    .padding(.bottom, 20)
                let pcinzwinAllVideo = picinzwPostVM.getAllNotBlockVieoaVNneqoWorksByType(type: 1)
                let pcinzwinFilterdVideos = pcinzwinAllVideo.sorted{
                    $0.vieoaVNneqoLikeCount > $1.vieoaVNneqoLikeCount
                }
                GeometryReader { geo in
                    TabView(selection: $pcinzwinIsLatest){
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 11),
                                GridItem(.flexible())
                            ], spacing: 10) {
                                ForEach(pcinzwinAllVideo) { vavideo in
                                    Eiwch827PostItem(eiwchiPostInfo: vavideo)
                                }
                            }.padding(.bottom, 70)
                        }.scrollIndicators(.hidden).tag(0)
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 11),
                                GridItem(.flexible())
                            ], spacing: 10) {
                                ForEach(pcinzwinFilterdVideos) { vavideo in
                                    Eiwch827PostItem(eiwchiPostInfo: vavideo)
                                }
                            }.padding(.bottom, 70)
                        }.scrollIndicators(.hidden).tag(1)
                    }.tabViewStyle(.page)
                        .background(Color.clear)
                    
                    
                }.padding(.horizontal, 20)
                
                
            }
        }.navigationBarHidden(true)
        
    }
}
