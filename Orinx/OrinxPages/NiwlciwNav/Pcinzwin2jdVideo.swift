import SwiftUI

struct Pcinzwin2jdVideo: View {
    @EnvironmentObject var picinzwPostVM: VieoaVNneqoVideoViewModel
    @EnvironmentObject var piczOrinNavi: OrinxNaviManager
    @EnvironmentObject var picziwOrinUserVm: RexceaiPwvzwaUserViewModel
    
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ZStack(alignment: .bottomTrailing){
                        IwbhaluTagBtn(iwbhaluWidth: 99, iwbnhalHeight: 47) {
                            Text("Latest")
                                .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(20, weight: .bold))
                                .foregroundStyle(.black)
                                .transformEffect(
                                    CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
                                )
                                .padding(.leading, 5)
                        }
                        Image("cnwal_point_black")
                            .resizable()
                            .frame(width: 22, height: 23)
                            .offset(x: 11.5, y: 3)
                    }
                    
                }
            }.padding(.top, 12)
                .padding(.bottom, 20)
            let pcinzwinAllVideo = picinzwPostVM.getAllNotBlockVieoaVNneqoWorksByType(type: 1)
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 11),
                        GridItem(.flexible())
                    ], spacing: 10) {
                        ForEach(pcinzwinAllVideo) { vavideo in
                            Eiwch827PostItem(eiwchiPostInfo: vavideo)
                        }
                    }.padding(.bottom, 34)
                }
                
            }.padding(.horizontal, 20)
            
            
        }
    }
}
