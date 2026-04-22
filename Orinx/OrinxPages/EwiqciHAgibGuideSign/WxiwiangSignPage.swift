import SwiftUI

enum WxiwiangType {
    case wxiwiangSignIn
    case wxiwiangSignUp
    case wxiwiangForgotPwd
}

struct WxiwiangSignPage: View {
    let wxiwiangType: WxiwiangType
    
    @State private var wxiwaingEmail: String = ""
    @State private var wxiwaingPwd: String = ""
    @State private var wxiwaingRepwd: String = ""
    
    @FocusState var wxiangIsFocus1: Bool
    @FocusState var wxiangIsFocus2: Bool
    @FocusState var wxiangIsFocus3: Bool
    
    @State private var wxiwiangCurrentType: WxiwiangType = .wxiwiangSignIn
    @EnvironmentObject var orinxUserVM: RexceaiPwvzwaUserViewModel
    @EnvironmentObject var orinxNavi: OrinxNaviManager
    
    private let wxiwiangEmailRequired = "y7fTyIut1l4S6K6sq+cuj6MtqXbpete5hSQOddvQcow="
    private let wxiwiangPasswordRequired = "syl3SvLB8CsGZGSUCoT2nMW7dgk9WFbKRlTiOrOnpFg="
    private let wxiwiangRepasswordRequired = "ZfbCGv301FVM6upTpsa8YvUH1vrRpAJ+kihN8KAhNE8="
    private let wxiwiangIncorrectCredential = "t7+t+XnDfr0Vlf1ZAppGpUnHi2tu1nwWm+mfHVZqy48="
    private let wxiwiangPasswordNotMatch = "7tTp1jQ9Mlez5zbSxscJSq8wA0GEdL9Ej9BuTA6I9yE="
    private let wxiwiangSignInText = "KyZNFdyKb3jdmx8tKYN85Q=="
    private let wxiwiangSignUpText = "5HMxFASmkUno/0BPVd2snQ=="
    private let wxiwiangForgotPasswordText = "JmQAHnJNLHUitvQLK/q3uw=="
    private let wxiwiangEmailPlaceholder = "hC2Dv8F5Khw/ON2MQuoi4g=="
    private let wxiwiangPasswordPlaceholder = "LBx3mLI/KzWSyEEqt6nhsA=="
    private let wxiwiangEnterPasswordAgain = "KP+JCxUFQ48I0mCwSsT8ECbxuhIBx+yyUMmgW15qezc="
    private let wxiwiangForgotText = "5BDsvOi2eVDOaFqzPkKDXg=="
    private let wxiwiangSaveText = "GlIWA7IQlSgrSgjvEkZMOg=="
    
    func siaoibOnSign() {
        if wxiwaingEmail.isEmpty {
            EeuqcjaOrHUD.toast(.normal(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangEmailRequired)))
            return
        }else if wxiwaingPwd.isEmpty {
            EeuqcjaOrHUD.toast(.normal(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangPasswordRequired)))
            return
        }else if (wxiwaingRepwd.isEmpty && wxiwiangCurrentType != .wxiwiangSignIn){
            EeuqcjaOrHUD.toast(.normal(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangRepasswordRequired)))
            return
        }
        switch wxiwiangCurrentType {
        case .wxiwiangSignIn:
            let resutla = orinxUserVM.loginByEmailAndPasswordRexceaiPwvzwa(email: wxiwaingEmail, password: wxiwaingPwd)
            if resutla == nil {
                EeuqcjaOrHUD.toast(.error(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangIncorrectCredential)))
                return
            }
            orinxNavi.popToRoot()
        case .wxiwiangSignUp:
            if wxiwaingPwd != wxiwaingRepwd {
                EeuqcjaOrHUD.toast(.error(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangPasswordNotMatch)))
                return
            }
            orinxNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "register", otrwiNjaEmail: wxiwaingEmail, otrwiNjaPassword: wxiwaingPwd))
        case .wxiwiangForgotPwd:
            return
        }
    }
    
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            VStack(spacing: 0){
                HStack{
                    Image("back")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            orinxNavi.pop()
                        }
                    Spacer()
                }.padding(.horizontal, 20)
                    .padding(.vertical, 12)
                Text(wxiwiangCurrentType == .wxiwiangSignIn ? XaiwgAesECBTool.xaiwgDecrypt(wxiwiangSignInText) : wxiwiangCurrentType == .wxiwiangSignUp ? XaiwgAesECBTool.xaiwgDecrypt(wxiwiangSignUpText) : XaiwgAesECBTool.xaiwgDecrypt(wxiwiangForgotPasswordText))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.bottom, 55)
                
                VStack(spacing: 30){
                    WxiwiangInputTextField(wixaigText: $wxiwaingEmail, wxianwwaIsFocus: $wxiangIsFocus1, wxiwainPlaceholder: XaiwgAesECBTool.xaiwgDecrypt(wxiwiangEmailPlaceholder))
                    WxiwiangInputTextField(wixaigText: $wxiwaingPwd, wxianwwaIsFocus: $wxiangIsFocus2, wxiwainPlaceholder: XaiwgAesECBTool.xaiwgDecrypt(wxiwiangPasswordPlaceholder))
                    if wxiwiangCurrentType != .wxiwiangSignIn {
                        WxiwiangInputTextField(wixaigText: $wxiwaingRepwd, wxianwwaIsFocus: $wxiangIsFocus3, wxiwainPlaceholder: XaiwgAesECBTool.xaiwgDecrypt(wxiwiangEnterPasswordAgain))
                    }
                    
                }.padding(.horizontal, 40)
                if wxiwiangCurrentType == .wxiwiangSignIn {
                    HStack{
                        Spacer()
                        Text(XaiwgAesECBTool.xaiwgDecrypt(wxiwiangForgotText))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .bold))
                            .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                            .transformEffect(.init(1, 0, -0.2, 1, 0, 0))
                            .onTapGesture {
                                withAnimation{
                                    wxiwiangCurrentType = .wxiwiangForgotPwd
                                }
                            }
                    }.padding(.top, 20)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                if (!wxiangIsFocus1 && !wxiangIsFocus2 && !wxiangIsFocus3){
                    Button(action: {
                        siaoibOnSign()
                    }) {
                        Text(wxiwiangCurrentType == .wxiwiangSignIn ? XaiwgAesECBTool.xaiwgDecrypt(wxiwiangSignInText) : wxiwiangCurrentType == .wxiwiangSignUp ? XaiwgAesECBTool.xaiwgDecrypt(wxiwiangSignUpText) : XaiwgAesECBTool.xaiwgDecrypt(wxiwiangSaveText))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 198, height: 53)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(.white, lineWidth: 2)
                                    }
                            )
                    }.padding(.bottom, 150)
                }
                
            }
        }.navigationBarHidden(true)
            .background(LkjaurakjxSwipeBack())
            .onTapGesture {
                wxiangIsFocus1 = false
                wxiangIsFocus2 = false
                wxiangIsFocus3 = false
            }.onAppear{
                wxiwiangCurrentType = wxiwiangType
            }
    }
    
    struct WxiwiangInputTextField: View {
        @Binding var wixaigText: String
        @FocusState.Binding var wxianwwaIsFocus: Bool
        let wxiwainPlaceholder: String
        
        var body: some View {
            TextField("", text: $wixaigText,
                      prompt: Text(wxiwainPlaceholder)
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255).opacity(0.8)))
            .focused($wxianwwaIsFocus)
            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
            .foregroundColor(.black)
            .tint(.black)
            .textInputAutocapitalization(.never)
            .frame(height: 52)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.1))
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                            .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
                    }
            )
        }
    }
}
