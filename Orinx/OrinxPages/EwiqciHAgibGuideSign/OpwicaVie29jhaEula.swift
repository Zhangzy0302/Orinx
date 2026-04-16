import SwiftUI

struct OpwicaVie29jhaEula: View {
    @AppStorage("ytjhlskJKitiwAgree") var kiwanvipqAgree: Bool = false
    @AppStorage("ytjhlskJKitiwAgreeEULA") var kiwaiAgreeEula: Bool = false
    
    @EnvironmentObject var opowaNavi: OrinxNaviManager
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("rutyauwc_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
            }
            VStack{
                Text("EULA")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(24, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                VStack{
                    ScrollView {
                        Text("Welcome to Orinx! To make a better place,the following content is not allowed in the app in particular.\n\n1.Any content about child harm,pornography related detrimental to children.\n2. Fake and harmful messages about recent or current events.\n3. Any violence,bullying content, publicly promotes pornography and other content.\n\nIf we find any content including and not limited to the above violations your content will be deleted and account will be banned.By clicking the above button,you agreeto the Terms of Use and Privacy Policy")
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 20)
                            
                    }.background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    ).padding(12)
                    
                    VStack(spacing: 24){
                        HStack(spacing: 49){
                            Text("Terms of Use")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                                .foregroundStyle(.black)
                                .underline()
                                .onTapGesture {
                                    opowaNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "userAgreement"))
                                }
                            Text("Privacy Policy")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                                .foregroundStyle(.black)
                                .underline()
                                .onTapGesture {
                                    opowaNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "privacyPolice"))
                                }
                        }
                        HStack(spacing: 24){
                            Button(action: {
                                opowaNavi.pop()
                            }) {
                                Text("Cancel")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame( height: 53)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 40)
                                                    .stroke(.white, lineWidth: 2)
                                            }.shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                                    )
                            }
                            Button(action: {
                                kiwaiAgreeEula = true
                                kiwanvipqAgree = true
                                opowaNavi.pop()
                            }) {
                                Text("I agree")
                                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame(height: 53)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 40)
                                                    .stroke(.white, lineWidth: 2)
                                            }.shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                                    )
                            }
                        }.padding(.horizontal, 30)
                            .padding(.bottom, 30)
                    }
                }.background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                ).padding(.horizontal, 20)
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
                            .onTapGesture {
                                opowaNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "userAgreement"))
                            }
                        KiwooviqText(kwiqText: " and ", kiwqiIsUnderline: false)
                        KiwooviqText(kwiqText: "Privacy Policy", kiwqiIsUnderline: true)
                            .onTapGesture {
                                opowaNavi.push(.otwiNjqoWeb(otwiNjqoWebUrl: "privacyPolicy"))
                            }
                    }
                }.padding(.vertical, 20)
            }
            HStack{
                Image("back")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        opowaNavi.pop()
                    }
                Spacer()
            }.padding(.horizontal, 20)
                .padding(.vertical, 12)
        }.navigationBarHidden(true)
            .background(LkjaurakjxSwipeBack())
    }
    
    struct KiwooviqText: View {
        let kwiqText: String
        let kiwqiIsUnderline: Bool
        var body: some View {
            Text(kwiqText)
                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(14, weight: .regular))
                .foregroundStyle(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                .underline(kiwqiIsUnderline)
        }
    }
}

#Preview {
    OpwicaVie29jhaEula()
}
