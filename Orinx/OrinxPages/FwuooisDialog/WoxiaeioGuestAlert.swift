import SwiftUI

struct WoxiaeioGuestAlert: View {
    @Binding var woxiaeioIsShowing: Bool
    @EnvironmentObject var woxiaeoiUserVM: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var woxiaeioGestNAvi: OrinxNaviManager
    
    private let woxiaeioGuestTip =
    "b04vj9knK308n3B+B+Qa0FtiB516BqpX1DzzMZw+vU6z1EWly5P0TKPC//4lXqCM" +
    "Qzc36GDH+j9hpuhdG84Z7sGDzEmJ8DCXFq1O3+L6/DhGjH19XolxbKXySYx39nEq"
    private let woxiaeioCancel = "csvlI9SbRkZ3oKN/YU+mNA=="
    private let woxiaeioLogin = "CoWCXzML/A4/jtMQk3Tlyw=="
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5).ignoresSafeArea()
                .onTapGesture {
                    woxiaeioIsShowing = false
                }
            VStack{
                Image("orinxwi_alert_logo")
                    .resizable()
                    .frame(width: 88, height: 88)
                Text(XaiwgAesECBTool.xaiwgDecrypt(woxiaeioGuestTip))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                    .foregroundStyle(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .padding(.bottom, 24)
                HStack(spacing: 12){
                    Text(XaiwgAesECBTool.xaiwgDecrypt(woxiaeioCancel))
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 55)
                                .fill(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                        ).onTapGesture {
                            woxiaeioIsShowing = false
                        }
                    Text(XaiwgAesECBTool.xaiwgDecrypt(woxiaeioLogin))
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 55)
                                .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                        ).onTapGesture {
                            woxiaeioIsShowing = false
                            woxiaeoiUserVM.logoutRexceaiPwvzwa()
                            woxiaeioGestNAvi.popToRoot()
                        }
                }
            }.padding(24)
                .padding(.bottom, 6)
                .frame(width: 300)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                )
        }
    }
}
