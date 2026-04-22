import SwiftUI

struct Eiwch827PostItem: View {
    let eiwchiPostInfo: VieoaVNneqoVideo
    
    @EnvironmentObject var eiwaOrinxNavi: OrinxNaviManager
    @EnvironmentObject var eiwavOrinUserVM: RexceaiPwvzwaUserViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            if !eiwchiPostInfo.vieoaVNneqoPic.isEmpty {
                XaiwgMnoteImage(eiwchiPostInfo.vieoaVNneqoPic[0], xaiwgMnoteWidth: .infinity, xaiwgMnoteHeight: 216)
                    .overlay{
                        if eiwchiPostInfo.vieoaVNneqoType == 1 {
                            Image("videopluse")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }.clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(4)
                
            }
            VStack(alignment: .trailing){
                if eiwchiPostInfo.vieoaVNneqoCreatorId != eiwavOrinUserVM.currentUserID {
                    Image("postpiccommentreport")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.top, 8)
                        .padding(.trailing, 12)
                        .onTapGesture {
                            if eiwavOrinUserVM.currentUser!.isRexceaiPwvzwaGuest {
                                eiwaOrinxNavi.showGuestAlert()
                                return
                            }
                            eiwaOrinxNavi.showReportBlock(eiwchiPostInfo.vieoaVNneqoCreatorId)
                        }
                }
                
                Spacer()
                ZStack(alignment: .bottom){
                    Ellipse()
                        .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                        .frame(width: 54, height: 14)
                    if let eiwchMyInfo = eiwavOrinUserVM.currentUser {
                        HStack(alignment: .bottom, spacing: 2){
                            Image(eiwchMyInfo.rexceaiPwvzwaLikePosts.contains(eiwchiPostInfo.vieoaVNneqoWorkId) ? "likepic" : "dislikepic")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("\(eiwchiPostInfo.vieoaVNneqoLikeCount)")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(8, weight: .regular))
                                .foregroundStyle(.white)
                        }.padding(.bottom, 3)
                    }
                    
                }.padding(.bottom, 12)
                    .padding(.trailing, 10)
            }
            
        }
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
                    
            ).onTapGesture {
                if eiwchiPostInfo.vieoaVNneqoType == 0 {
                    eiwaOrinxNavi.push(.otwiNjqoWeb(url: "picPostDetails/\(eiwchiPostInfo.vieoaVNneqoWorkId)"))
                }else {
                    eiwaOrinxNavi.push(.otwiNjqoWeb(url: "videoPostDetails/\(eiwchiPostInfo.vieoaVNneqoWorkId)"))
                }
                
            }
    }
}
