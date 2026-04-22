import SwiftUI

struct Teyuxh24aMessage: View {
    @EnvironmentObject var tuOrinxUserVM: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var turOrinChatVm: ZswqoveiNiegChatViewModel
    @EnvironmentObject var turNAvi: OrinxNaviManager
    
    private var teyuxhUserList: [RexceaiPwvzwaUser] {
        tuOrinxUserVM.getAllNotBlockRexceaiPwvzwaUsers().filter {
            $0.rexceaiPwvzwaUserId != tuOrinxUserVM.currentUserID
        }
    }
    
    private var teyuexMyRoom: [ZswqoveiNiegChatRoom] {
        turOrinChatVm.getMyZswqoveiNiegChatRoomsNotBlock()
    }
    
    private let teyuxhActiveText = "hgj2wcG4UkRsg/sZxmOxXw=="
    private let teyuxhMessageText = "wqAqCtqekxNQCPEXdMtQww=="
    
    var body: some View {
        ZStack {
            teyuxhBackgroundView
            
            VStack(alignment: .leading, spacing: 0) {
                teyuxhHeaderView
                teyuxhSectionTag(title: XaiwgAesECBTool.xaiwgDecrypt(teyuxhActiveText))
                    .padding(.horizontal, 20)
                    .padding(.top, 14)
                    .padding(.bottom, 18)
                teyuxhActiveUsersView
                teyuxhSectionTag(title: XaiwgAesECBTool.xaiwgDecrypt(teyuxhActiveText))
                    .padding(20)
                teyuxhRoomListView
            }
        }
        .navigationBarHidden(true)
        .background(LkjaurakjxSwipeBack())
    }
}

private extension Teyuxh24aMessage {
    var teyuxhBackgroundView: some View {
        GeometryReader { _ in
            Image("rutyauwc_bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
    
    var teyuxhHeaderView: some View {
        ZStack(alignment: .bottomTrailing) {
            Text(XaiwgAesECBTool.xaiwgDecrypt(teyuxhMessageText))
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .bold))
                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                .transformEffect(CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0))
                .padding(.leading, 5)
            Image("cnwal_point_orange")
                .resizable()
                .frame(width: 22.5, height: 23)
                .offset(x: 18.6, y: 0)
        }
        .padding(.horizontal, 20)
    }
    
    func teyuxhSectionTag(title: String) -> some View {
        IwbhaluTagBtn(iwbhaluWidth: 106, iwbnhalHeight: 47) {
            Text(title)
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                .foregroundStyle(.black)
                .transformEffect(CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0))
                .padding(.leading, 5)
        }
    }
    
    var teyuxhActiveUsersView: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 15) {
                ForEach(teyuxhUserList) { roinzUser in
                    TeyuxhActiveUserCard(user: roinzUser)
                        .onTapGesture {
                            turNAvi.push(.otwiNjqoWeb(url: "otherHome/\(roinzUser.rexceaiPwvzwaUserId)"))
                        }
                }
            }
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
        .frame(height: 100)
    }
    
    var teyuxhRoomListView: some View {
        ScrollView {
            Group {
                if teyuexMyRoom.isEmpty {
                    LkjariaxEmptyData(lkajiwraTopPadding: 50)
                }else {
                    LazyVStack(spacing: 10) {
                        ForEach(teyuexMyRoom) { room in
                            if let chatUser = turOrinChatVm.getZswqoveiNiegChatUserInfo(chatRoomId: room.zswqoveiNiegRoomId) {
                                TeyuxhRoomRow(room: room, user: chatUser)
                                    .onTapGesture {
                                        turNAvi.push(.otwiNjqoWeb(url: "chat/\(room.zswqoveiNiegRoomId)"))
                                    }
                            }
                        }
                    }.padding(.horizontal, 20)
                    .padding(.bottom, 70)
                }
            }
            
        }
    }
}

private struct TeyuxhActiveUserCard: View {
    let user: RexceaiPwvzwaUser
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                    .frame(width: 68, height: 68)
                XaiwgMnoteImage(user.rexceaiPwvzwaAvatar, xaiwgMnoteWidth: 60, xaiwgMnoteHeight: 60, xaiwgMnoteIsCircle: true)
            }
            Text(user.rexceaiPwvzwaUserName)
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(15, weight: .bold))
                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                .lineLimit(1)
        }
        .padding(.top, 4)
        .frame(width: 76, height: 98)
        .background(
            UnevenRoundedRectangle(topLeadingRadius: 100, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 100)
                .fill(.white)
        )
        .shadow(color: Color(red: 0.06, green: 0.48, blue: 0.57, opacity: 0.2), radius: 4)
    }
}

private struct TeyuxhRoomRow: View {
    let room: ZswqoveiNiegChatRoom
    let user: RexceaiPwvzwaUser
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Circle()
                    .stroke(OrinxaYrueaTheme.OrinxColor.orinxMainBlue, lineWidth: 1.4)
                    .frame(width: 54, height: 54)
                XaiwgMnoteImage(user.rexceaiPwvzwaAvatar, xaiwgMnoteWidth: 46, xaiwgMnoteHeight: 46, xaiwgMnoteIsCircle: true)
            }
            .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.rexceaiPwvzwaUserName)
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .bold))
                    .foregroundStyle(Color(red: 102 / 255, green: 102 / 255, blue: 102 / 255))
                Text(room.zswqoveiNiegLastSendMsg)
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(12, weight: .regular))
                    .foregroundStyle(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
            }
            
            Spacer()
            if room.zswqoveiNiegUnreadCount > 0 && room.zswqoveiNiegLastSendUser == user.rexceaiPwvzwaUserId {
                Text("\(room.zswqoveiNiegUnreadCount)")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(9, weight: .regular))
                    .foregroundStyle(.white)
                    .background(
                        Circle()
                            .fill(Color(red: 1, green: 31 / 255, blue: 31 / 255))
                    )
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 12)
        .frame(height: 78)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.3))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .leading, endPoint: .trailing),
                            lineWidth: 1.4
                        )
                }
        )
    }
}

#Preview {
    Teyuxh24aMessage()
}
