import SwiftUI

struct KiwoviqGuidePage: View {
    @AppStorage("ytjhlskJKitiwAgree") var kiwanvipqAgree: Bool = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("rutyauwc_guide_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
                    Text("EULA")
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .bold))
                        .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                        .frame(width: 53, height: 31)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                }.padding(.horizontal, 20)
                    .padding(.top, 11)
                Spacer()
                VStack(spacing: 0){
                    Button(action: {}) {
                        Text("Login by email")
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
                    Button(action: {}) {
                        Text("I'm new")
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
                        KiwooviqText(kwiqText: "Don't have an account? ", kiwqiIsUnderline: false)
                        Text("Sign up")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .bold))
                            .foregroundStyle(.white)
                            .underline()
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
                            KiwooviqText(kwiqText: "Agree with ", kiwqiIsUnderline: false)
                            KiwooviqText(kwiqText: "User Agreement", kiwqiIsUnderline: true)
                            KiwooviqText(kwiqText: " and ", kiwqiIsUnderline: false)
                            KiwooviqText(kwiqText: "Privacy Policy", kiwqiIsUnderline: true)
                        }
                    }
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
