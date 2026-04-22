import SwiftUI

struct BrNozhwiHome: View {
    @EnvironmentObject var brNoczavi: OrinxNaviManager
    @EnvironmentObject var brnNOzUserVm: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var brnaiOPostVM: VieoaVNneqoVideoViewModel
    
    private let brNozhwiHeroText =
    "hSjeM7hB+gmaxoqj2FJngvDX3zgcAJ4Nb6k7r04xDltPyLBzT3OldZ2o7icioKL5" +
    "rIb2/pE1H5smMIra4WX7Yw=="
    private let brNozhwiTryNow = "j52Uy9t/h9DkIvpr2IPLJg=="
    private let brNozhwiAiJourney = "uipkrNGfnqVW/MYjqesmIGRCVR3vNwA2gFhaEgJOSWs="
    private let brNozhwiGoText = "GO70OfK5jUmLUAtUkzLbUA=="
    private let brNozhwiNewTrend = "m3M5irJwL4brPb4itA2qtQ=="
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            HStack{
                Spacer()
                Image("rutyauwc_ai_charactor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 174)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    if let brnNozvMyInfo = brnNOzUserVm.currentUser {
                        ZStack{
                            Circle()
                                .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                .frame(width: 68, height: 68)
                            XaiwgMnoteImage(brnNozvMyInfo.rexceaiPwvzwaAvatar, xaiwgMnoteWidth: 60, xaiwgMnoteHeight: 60, xaiwgMnoteIsCircle: true)
                        }.padding(.top, 17)
                        Text(brnNozvMyInfo.rexceaiPwvzwaUserName)
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    }
                    
                    Text(XaiwgAesECBTool.xaiwgDecrypt(brNozhwiHeroText))
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                        .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 2){
                            Text(XaiwgAesECBTool.xaiwgDecrypt(brNozhwiTryNow))
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.15, d: 1, tx: 0, ty: 0)
                                    ).padding(.leading, 5)
                            Text(XaiwgAesECBTool.xaiwgDecrypt(brNozhwiAiJourney))
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                        }
                        Spacer()
                        IwbhaluTagBtn(iwbhaluWidth: 85, iwbnhalHeight: 34) {
                            HStack(spacing: 7){
                                Text(XaiwgAesECBTool.xaiwgDecrypt(brNozhwiGoText))
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
                        ).onTapGesture {
                            if brnNOzUserVm.currentUser!.isRexceaiPwvzwaGuest {
                                brNoczavi.showGuestAlert()
                                return
                            }
                            brNoczavi.push(.otwiNjqoWeb(url: "aiDetails"))
                        }.padding(.top, 17)
                        .padding(.bottom, 20)
                    
                    ZStack(alignment: .bottomTrailing){
                        IwbhaluTagBtn(iwbhaluWidth: 132, iwbnhalHeight: 47) {
                            Text(XaiwgAesECBTool.xaiwgDecrypt(brNozhwiNewTrend))
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                .foregroundStyle(.black)
                                .transformEffect(
                                        CGAffineTransform(a: 1, b: 0, c: -0.15, d: 1, tx: 0, ty: 0)
                                    ).padding(.leading, 5)
                            
                        }
                        Image("cnwal_point_black")
                            .resizable()
                            .frame(width: 22, height: 23)
                            .offset(x: 11.5, y: 3)
                    }.padding(.bottom, 20)
                    let brNozhwiImagePosts = brnaiOPostVM.getAllNotBlockVieoaVNneqoWorksByType(type: 0)
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 11),
                        GridItem(.flexible())
                    ], spacing: 10) {
                        ForEach(brNozhwiImagePosts) { bjraiPost in
                            Eiwch827PostItem(eiwchiPostInfo: bjraiPost)
                        }
                        
                    }.padding(.bottom, 70)
                }.padding(.horizontal, 20)
            }.scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
            
        }.navigationBarHidden(true)
    }
}

