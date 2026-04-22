import SwiftUI

struct KiwoviqGuidePage: View {
    @AppStorage("ytjhlskJKitiwAgree") var kiwanvipqAgree: Bool = false
    @AppStorage("ytjhlskJKitiwAgreeEULA") var kiwanvipqAgreeEULA: Bool = false
    
    @EnvironmentObject private var kiwowNavi: OrinxNaviManager
    @EnvironmentObject private var kiwoviqUserVM: RexceaiPwvzwaUserViewModel
    
    private let kiwoviqEulaTitle = "2exKLknTDxvMh/wmWCl95Q=="
    private let kiwoviqAgreeToast = "PmSSSasyZYJSZLzYN4hHNcG0mS7RifnS+i2D/ybitM6EAzBa5BPMWJKIFwV2PMsq"
    private let kiwoviqLoginByEmail = "E6KLWbp0J7xwoqswI3FVUQ=="
    private let kiwoviqNewUser = "Db6avOhCbYtDwenKrtIgNQ=="
    private let kiwoviqNoAccount = "vsQRGqqe6HFu5Er4Trq9Pf82eHSp3CkHBLQ/pg4eai0="
    private let kiwoviqSignUp = "5HMxFASmkUno/0BPVd2snQ=="
    private let kiwoviqAgreeWith = "kLVs7F0zWRavoVUxxwQlWw=="
    private let kiwoviqUserAgreement = "ePXkrWnEpw3F+juVgLDdsQ=="
    private let kiwoviqAndText = "ThAxGB5t2uygQjLVoF5SGg=="
    private let kiwoviqPrivacyPolicy = "Iyr4iuThDGafqNzXK96AjQ=="
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("rutyauwc_guide_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                LinearGradient(colors: [
                    OrinxaYrueaTheme.OrinxColor.orinxMainPink,
                    .white.opacity(0)
                ], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            }
            VStack{
                HStack{
                    Image("orinx_logo")
                        .resizable()
                        .frame(width: 68, height: 68)
                        .cornerRadius(16)
                    Spacer()
                    Text(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqEulaTitle))
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .bold))
                        .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                        .frame(width: 53, height: 31)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .onTapGesture {
                            kiwowNavi.push(.ewioxaEula)
                        }
                }.padding(.horizontal, 20)
                    .padding(.top, 11)
                Spacer()
                VStack(spacing: 0){
                    Button(action: {
                        if !kiwanvipqAgreeEULA {
                            kiwowNavi.push(.ewioxaEula)
                            return
                        }
                        if !kiwanvipqAgree {
                            EeuqcjaOrHUD.toast(.error(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqAgreeToast)))
                            return
                        }
                        kiwowNavi.push(.wxiwiangSignPage(wialcjSignType: .wxiwiangSignIn))
                    }) {
                        Text(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqLoginByEmail))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 267, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(.white, lineWidth: 2)
                                    }
                            )
                    }
                    Button(action: {
                        if !kiwanvipqAgreeEULA {
                            kiwowNavi.push(.ewioxaEula)
                            return
                        }
                        if !kiwanvipqAgree {
                            EeuqcjaOrHUD.toast(.error(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqAgreeToast)))
                            return
                        }
                        Task{
                            EeuqcjaOrHUD.showLoading()
                            await delay(0.55)
                            EeuqcjaOrHUD.hideLoading()
                            kiwoviqUserVM.visitorLoginRexceaiPwvzwa()
                            kiwowNavi.popToRoot()
                        }
                    }) {
                        Text(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqNewUser))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 267, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(.white, lineWidth: 2)
                        }
                            )
                    }.padding(.top, 18)
                        .padding(.bottom, 22)
                    
                    HStack(spacing: 0){
                        KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(kiwoviqNoAccount), kiwqiIsUnderline: false)
                        Text(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqSignUp))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .bold))
                            .foregroundStyle(.white)
                            .underline()
                            .onTapGesture {
                                if !kiwanvipqAgreeEULA {
                                    kiwowNavi.push(.ewioxaEula)
                                    return
                                }
                                if !kiwanvipqAgree {
                                    EeuqcjaOrHUD.toast(.error(XaiwgAesECBTool.xaiwgDecrypt(kiwoviqAgreeToast)))
                                    return
                                }
                                kiwowNavi.push(.wxiwiangSignPage(wialcjSignType: .wxiwiangSignUp))
                            }
                    }.padding(.bottom, 57)
                    
                    HStack(){
                        Image(kiwanvipqAgree ? "ciahitiw_agree_circle_check" : "ciahitiw_agree_circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 0.2)){
                                    kiwanvipqAgree = !kiwanvipqAgree
                                }
                                
                            }
                        HStack(spacing: 0){
                            KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(kiwoviqAgreeWith), kiwqiIsUnderline: false)
                            KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(kiwoviqUserAgreement), kiwqiIsUnderline: true)
                                .onTapGesture {
                                    kiwowNavi.push(.otwiNjqoWeb(url: "userAgreement"))
                                }
                            KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(kiwoviqAndText), kiwqiIsUnderline: false)
                            KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(kiwoviqPrivacyPolicy), kiwqiIsUnderline: true)
                                .onTapGesture {
                                    kiwowNavi.push(.otwiNjqoWeb(url: "privacyPolicy"))
                                }
                        }
                    }.padding(.bottom, 30)
                }
            }
        }
    }
    
    struct KiwooviqText: View {
        let kwiqText: String
        let kiwqiIsUnderline: Bool
        var body: some View {
            Text(kwiqText)
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                .foregroundStyle(.white)
                .underline(kiwqiIsUnderline)
        }
    }
}

#Preview {
    KiwoviqGuidePage()
}
