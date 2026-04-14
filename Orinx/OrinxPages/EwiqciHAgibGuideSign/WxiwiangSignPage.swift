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
    
    func siaoibOnSign() {
        if wxiwaingEmail.isEmpty {
            EeuqcjaOrHUD.toast(.normal("Email is required"))
            return
        }else if wxiwaingPwd.isEmpty {
            EeuqcjaOrHUD.toast(.normal("Password is required"))
            return
        }else if (wxiwaingRepwd.isEmpty && wxiwiangCurrentType != .wxiwiangSignIn){
            EeuqcjaOrHUD.toast(.normal("Repassword is required"))
            return
        }
        switch wxiwiangCurrentType {
        case .wxiwiangSignIn:
            let resutla = orinxUserVM.loginByEmailAndPasswordRexceaiPwvzwa(email: wxiwaingEmail, password: wxiwaingPwd)
            if resutla == nil {
                EeuqcjaOrHUD.toast(.error("Incorrect email or password"))
                return
            }
            orinxNavi.popToRoot()
        case .wxiwiangSignUp:
            <#code#>
        case .wxiwiangForgotPwd:
            <#code#>
        }
    }
    
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
            }
            VStack(spacing: 0){
                HStack{
                    Image("back")
                        .resizable()
                        .frame(width: 36, height: 36)
                    Spacer()
                }.padding(.horizontal, 20)
                    .padding(.vertical, 12)
                Text("Sign in")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(36, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.bottom, 55)
                
                VStack(spacing: 30){
                    WxiwiangInputTextField(wixaigText: $wxiwaingEmail, wxianwwaIsFocus: $wxiangIsFocus1, wxiwainPlaceholder: "Email")
                    WxiwiangInputTextField(wixaigText: $wxiwaingPwd, wxianwwaIsFocus: $wxiangIsFocus2, wxiwainPlaceholder: "Password")
                    if wxiwiangCurrentType != .wxiwiangSignIn {
                        WxiwiangInputTextField(wixaigText: $wxiwaingRepwd, wxianwwaIsFocus: $wxiangIsFocus3, wxiwainPlaceholder: "Enter the password again")
                    }
                    
                }.padding(.horizontal, 40)
                HStack{
                    Spacer()
                    Text("Forgot ？")
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
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Sign in")
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
        }.navigationBarHidden(true)
            .background(LkjaurakjxSwipeBack())
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

