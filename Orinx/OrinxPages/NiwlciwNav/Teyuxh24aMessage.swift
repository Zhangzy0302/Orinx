import SwiftUI

struct Teyuxh24aMessage: View {
    @EnvironmentObject var tuOrinxUserVM: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var turOrinChatVm: ZswqoveiNiegChatViewModel
    @EnvironmentObject var turNAvi: OrinxNaviManager
    
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
            
            let teyuxhUserLsit = tuOrinxUserVM.getAllNotBlockRexceaiPwvzwaUsers().filter{
                $0.rexceaiPwvzwaUserId != tuOrinxUserVM.currentUserID
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15){
                    ForEach(teyuxhUserLsit) { roinzUser in
                        VStack(spacing: 0){
                            ZStack{
                                Circle()
                                    .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                    .frame(width: 68, height: 68)
                                XaiwgMnoteImage(roinzUser.rexceaiPwvzwaAvatar, xaiwgMnoteWidth: 60, xaiwgMnoteHeight: 60, xaiwgMnoteIsCircle: true)
                            }
                            Text(roinzUser.rexceaiPwvzwaUserName)
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(15, weight: .bold))
                                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                                .lineLimit(1)
                        }.padding(.top, 4)
                            .frame(width: 76, height: 98)
                            .background(
                                UnevenRoundedRectangle(topLeadingRadius: 100, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 100)
                                    .fill(.white)
                            ).shadow(color: Color(red: 0.06, green: 0.48, blue: 0.57, opacity: 0.2), radius: 4)
                            .onTapGesture {
                                turNAvi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "otherHome/\(roinzUser.rexceaiPwvzwaUserId)"))
                            }
                    }
                    
                }.padding(.horizontal, 20)
            }.scrollIndicators(.hidden)
                .frame(height: 100)
            
            IwbhaluTagBtn(iwbhaluWidth: 106, iwbnhalHeight: 47) {
                Text("Active")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                    .foregroundStyle(.black)
                    .transformEffect(
                            CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                    ).padding(.leading, 5)
            }.padding(.horizontal, 20)
            
            let teyuexMyRoom = turOrinChatVm.getMyZswqoveiNiegChatRoomsNotBlock()
            
            LazyVStack(spacing: 10) {
                ForEach(teyuexMyRoom) { room in
                    HStack(spacing: 0){
                        ZStack{
                            Circle()
                                .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                                .frame(width: 54, height: 54)
                            
                        }.padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 4){
                            Text("Wynter")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                                .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                            Text("Wynter")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(12, weight: .regular))
                                .foregroundStyle(Color(red: 51/255, green: 51/255, blue: 51/255))
                        }
                    }
                }
            }.padding(.bottom, 33)
            
        }.navigationBarHidden(true)
            .background(LkjaurakjxSwipeBack())
    }
}

#Preview {
    Teyuxh24aMessage()
}
