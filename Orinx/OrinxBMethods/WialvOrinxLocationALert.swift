
import SwiftUI
import CoreLocation

struct WialvOrinxLocationALert: View {
    @Binding var woxiaeioIsShowing: Bool
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var erunxAKwlwqIsCheckingSettings = false
    
    func erunxAKwlwqlGoToSettings() {
            erunxAKwlwqIsCheckingSettings = true
            
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url)
        }

    func erunxAKwlwqlCheckLocatrion() {
        let manager = CLLocationManager()
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            woxiaeioIsShowing = false
        }
    }
    
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
                Text("This app needs location access for sharing, discovering events, and using location-based features. Location data is used responsibly with your consent. Privacy and security are our priorities.")
                    .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                    .foregroundStyle(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .padding(.bottom, 24)
                HStack(spacing: 12){
                    Text("Cancel")
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
                    Text("Go to settings")
                        .font(OrinxaYrueaTheme.OrinxFont.texgyreadventor(16))
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 55)
                                .fill(OrinxaYrueaTheme.OrinxColor.orinxMainPink)
                        ).onTapGesture {
                            erunxAKwlwqlGoToSettings()
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
