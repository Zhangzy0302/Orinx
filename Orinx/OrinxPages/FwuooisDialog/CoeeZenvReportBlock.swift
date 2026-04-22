import SwiftUI

struct CoeeZenvReportBlock: View {
    @EnvironmentObject var coeeZenNavi: OrinxNaviManager
    @EnvironmentObject var coeeZenUSerV: RexceaiPwvzwaUserViewModel
    @Binding var coeeZenIsShowBlock: Bool
    let coeeZenvBlockUID: String
    
    private let coeeZenvReportText = "hXcjo7uM1s6a11xTphEA8g=="
    private let coeeZenvShieldText = "k5Rr6DW1AV/M9p2fQTpkLw=="
    private let coeeZenvBlockedSuccess = "Rf+rej0Aa0VCONJtV5FV5C40LXLxqqyL6SeDLewpIh8="
    private let coeeZenvCancelText = "csvlI9SbRkZ3oKN/YU+mNA=="
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.opacity(0.6).ignoresSafeArea()
                .onTapGesture {
                    coeeZenIsShowBlock = false
                }
            VStack(spacing: 0){
                Text(XaiwgAesECBTool.xaiwgDecrypt(coeeZenvReportText))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .regular))
                    .foregroundStyle(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .frame(width: 260, height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.white)
                    ).onTapGesture {
                        coeeZenIsShowBlock = false
                        coeeZenNavi.push(.otwiNjqoWeb(url: "report"))
                    }
                Text(XaiwgAesECBTool.xaiwgDecrypt(coeeZenvShieldText))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(18, weight: .regular))
                    .foregroundStyle(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .frame(width: 260, height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.white)
                    ).onTapGesture {
                        coeeZenUSerV.toggleUserIsBlocked(blockUserId: coeeZenvBlockUID)
                        coeeZenIsShowBlock = false
                        EeuqcjaOrHUD.toast(.success(XaiwgAesECBTool.xaiwgDecrypt(coeeZenvBlockedSuccess)))
                    }.padding(.top, 16)
                    .padding(.bottom, 22)
                
                Text(XaiwgAesECBTool.xaiwgDecrypt(coeeZenvCancelText))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 152, height: 53)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                            .overlay{
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(.white, lineWidth: 2)
                            }
                    ).onTapGesture {
                        coeeZenIsShowBlock = false
                    }
            }.padding(.top, 30)
                .padding(.bottom, 65)
                .frame(maxWidth: .infinity)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 40, topTrailingRadius: 40)
                        .fill(LinearGradient(colors: [
                            .white,
                            OrinxaYrueaTheme.OrinxColor.orinxMainPink
                        ], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
        }.ignoresSafeArea()
    }
}
