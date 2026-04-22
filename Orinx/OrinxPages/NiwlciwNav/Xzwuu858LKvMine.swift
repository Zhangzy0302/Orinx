import SwiftUI

struct Xzwuu858LKvMine: View {
    @EnvironmentObject var xzwuuOrinUserVM: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var xianNAbvi: OrinxNaviManager
    @EnvironmentObject var xzwuuOrinxPOstVM: VieoaVNneqoVideoViewModel
    
    private let xzwuuFollowingText = "/SuEC2Zujz9WKtAssUQlOw=="
    private let xzwuuFansText = "4sYE52hB/sph4TkoMGBCFA=="
    private let xzwuuWalletBalanceText = "MnmBNSWMLtqS9QknpUoibw=="
    private let xzwuuWorksText = "vxLIZg6/IyOXRmi9+enZ/w=="
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    if let xzwuuLkvMyInfo = xzwuuOrinUserVM.currentUser {
                        HStack(alignment: .bottom){
                            ZStack{
                                Circle()
                                    .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                    .frame(width: 68, height: 68)
                                XaiwgMnoteImage(xzwuuLkvMyInfo.rexceaiPwvzwaAvatar, xaiwgMnoteWidth: 60, xaiwgMnoteHeight: 60, xaiwgMnoteIsCircle: true)
                            }
                            Spacer()
                            HStack{
                                VStack(alignment: .leading, spacing: 10){
                                    Text("\(xzwuuLkvMyInfo.rexceaiPwvzwaFollowing.count)")
                                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                        .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                    Text(XaiwgAesECBTool.xaiwgDecrypt(xzwuuFollowingText))
                                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                        .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                }.frame(maxWidth: .infinity)
                                    .onTapGesture {
                                        if xzwuuLkvMyInfo.isRexceaiPwvzwaGuest {
                                            xianNAbvi.showGuestAlert()
                                            return
                                        }
                                        xianNAbvi.push(.otwiNjqoWeb(url: "follow"))
                                    }
                                VStack(alignment: .leading, spacing: 10){
                                    Text("\(xzwuuLkvMyInfo.rexceaiPwvzwaFans.count)")
                                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                        .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                    Text(XaiwgAesECBTool.xaiwgDecrypt(xzwuuFansText))
                                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                        .foregroundStyle(Color(red: 99/255, green: 99/255, blue: 99/255))
                                }.frame(maxWidth: .infinity)
                                    .onTapGesture {
                                        if xzwuuLkvMyInfo.isRexceaiPwvzwaGuest {
                                            xianNAbvi.showGuestAlert()
                                            return
                                        }
                                        xianNAbvi.push(.otwiNjqoWeb(url: "fan"))
                                    }
                            }.frame(width: 170)
                        }
                        HStack(spacing: 12.5){
                            Text(xzwuuLkvMyInfo.rexceaiPwvzwaUserName)
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .regular))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                            Image("rutyauwc_icon_edit")
                                .resizable()
                                .frame(width: 21, height: 21)
                                
                        }.onTapGesture {
                            if xzwuuLkvMyInfo.isRexceaiPwvzwaGuest {
                                xianNAbvi.showGuestAlert()
                                return
                            }
                            xianNAbvi.push(.otwiNjqoWeb(url: "edit"))
                        }
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 2){
                                Text(XaiwgAesECBTool.xaiwgDecrypt(xzwuuWalletBalanceText))
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                    .transformEffect(
                                            CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                        ).padding(.leading, 5)
                                HStack {
                                    Image("xiejljbj_coin")
                                        .resizable()
                                        .frame(width: 42, height: 42)
                                    Text("\(xzwuuLkvMyInfo.rexceaiPwvzwaWalletBalance)")
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
                            ).onTapGesture {
                                if xzwuuLkvMyInfo.isRexceaiPwvzwaGuest {
                                    xianNAbvi.showGuestAlert()
                                    return
                                }
                                xianNAbvi.push(.otwiNjqoWeb(url: "coins"))
                            }.padding(.top, 17)
                            .padding(.bottom, 20)
                    }
                    
                    ZStack(alignment: .bottomTrailing){
                        IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47) {
                            Text(XaiwgAesECBTool.xaiwgDecrypt(xzwuuWorksText))
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
                    }.padding(.bottom, 18)
                    let xzwuuLkeMyWOrks = xzwuuOrinxPOstVM.getMyVieoaVNneqoWorks()
                    Group {
                        if (xzwuuLkeMyWOrks.isEmpty) {
                          LkjariaxEmptyData(lkajiwraTopPadding: 50)
                        } else {
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 11),
                                GridItem(.flexible())
                            ], spacing: 10) {
                                ForEach(xzwuuLkeMyWOrks) { work in
                                    Eiwch827PostItem(eiwchiPostInfo: work)
                                }
                            }
                        }
                    }.padding(.bottom, 70)
                    
                    
                }.padding(.horizontal, 20)
                    .padding(.top, 17)
            }
            
            HStack{
                Spacer()
                Image("rutyauwc_setting")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        xianNAbvi.push(.otwiNjqoWeb(url: "setting"))
                    }
            }.padding(.top, 10)
                .padding(.trailing, 20)
        }
        
    }
}
