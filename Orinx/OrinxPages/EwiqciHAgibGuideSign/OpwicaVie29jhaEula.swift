import SwiftUI

struct OpwicaVie29jhaEula: View {
    @AppStorage("ytjhlskJKitiwAgree") var kiwanvipqAgree: Bool = false
    @AppStorage("ytjhlskJKitiwAgreeEULA") var kiwaiAgreeEula: Bool = false
    
    @EnvironmentObject var opowaNavi: OrinxNaviManager
    
    private let opwicaEulaTitle = "2exKLknTDxvMh/wmWCl95Q=="
    private let opwicaEulaBody =
    "VpKkWlg9o15jVguuSeaceTO5qImQsznCq3RFqoDr8JExGYnTmSmQi0aMR4D2bGNz" +
    "Rxt0LCSgFzgrHT8lv8lDQZ0n77FxYMl1zv3oabMpARxPgWtG3yVndAewHbj/RgXC" +
    "3NE4oI/cg7NzwgJQbqB/H3Pl3s1Aj3mdgqAsNVFvQF8NXl5hVdnp+Q3cnAO5H4IL" +
    "S8qHWrTJkAsh4Yh99k49pq5I0kmKh4SRQ4dRv0pZ35/cgqoffUHeuGlXHwjEMk0P" +
    "ytHFVRdoifCswE/LM2Pse48SUnBEXzwdSVbBn8cr4Ru2zSajpmucsav/kWM31ht4" +
    "rUVfcqiDhbINDWBGmn7mvyYd2M8UT153J3GY+PhtBXdBAyhQdpsxbhGylww0OWbl" +
    "Xov2Ep4iXJHMLhZDvBOzAfro9mw+x8EsI9fJ1m3PmRdv5QKmm0zip3tBkOBtFQjX" +
    "QIKAz9c9TbqvglCeMMSXVE7Tqu/sZGKv6Inyl52i8X1SPTDLPvJsjve0EOtcsfUu" +
    "Wzr6T0s2A5ROxItDUS0KhY0yqH0yHJLqvCsClXV1RSU/mPq4kTUN5rJGn42dOqiU" +
    "vRF1Llv3T5j0VIcYU+vro2V4H7Wxd0veVxR+xgxtZXr+4evhf9R+5eA1l8YS/hMG" +
    "J4GYqC3Hr358URneBef67LuX0CtETH5tUWV4t7Ky5ljPqr/i98OVYhNsY/+IE1yF" +
    "u4jMyA4jkzB+GTJaDgJzoQ=="
    private let opwicaTermsOfUse = "gl52FPV/eeo22wZYQ4CAsQ=="
    private let opwicaPrivacyPolicy = "Iyr4iuThDGafqNzXK96AjQ=="
    private let opwicaCancel = "csvlI9SbRkZ3oKN/YU+mNA=="
    private let opwicaIAgree = "az2+qJIrVHONgg+tKhWFqA=="
    private let opwicaAgreeWith = "kLVs7F0zWRavoVUxxwQlWw=="
    private let opwicaUserAgreement = "ePXkrWnEpw3F+juVgLDdsQ=="
    private let opwicaAndText = "ThAxGB5t2uygQjLVoF5SGg=="
    
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
                Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaEulaTitle))
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(24, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                VStack{
                    ScrollView {
                        Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaEulaBody))
                            .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 20)
                            
                    }.background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(OrinxaYrueaTheme.OrinxColor.orinxMainBlue)
                    ).padding(12)
                    
                    VStack(spacing: 24){
                        HStack(spacing: 49){
                            Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaTermsOfUse))
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                                .foregroundStyle(.black)
                                .underline()
                                .onTapGesture {
                                    opowaNavi.push(.otwiNjqoWeb(url: "userAgreement"))
                                }
                            Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaPrivacyPolicy))
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16, weight: .regular))
                                .foregroundStyle(.black)
                                .underline()
                                .onTapGesture {
                                    opowaNavi.push(.otwiNjqoWeb(url: "privacyPolicy"))
                                }
                        }
                        HStack(spacing: 24){
                            Button(action: {
                                opowaNavi.pop()
                            }) {
                                Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaCancel))
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
                                Text(XaiwgAesECBTool.xaiwgDecrypt(opwicaIAgree))
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
                        KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(opwicaAgreeWith), kiwqiIsUnderline: false)
                        KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(opwicaUserAgreement), kiwqiIsUnderline: true)
                            .onTapGesture {
                                opowaNavi.push(.otwiNjqoWeb(url: "userAgreement"))
                            }
                        KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(opwicaAndText), kiwqiIsUnderline: false)
                        KiwooviqText(kwiqText: XaiwgAesECBTool.xaiwgDecrypt(opwicaPrivacyPolicy), kiwqiIsUnderline: true)
                            .onTapGesture {
                                opowaNavi.push(.otwiNjqoWeb(url: "privacyPolicy"))
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
