import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "back" asset catalog image resource.
    static let back = ImageResource(name: "back", bundle: resourceBundle)

    /// The "ciahitiw_agree_circle" asset catalog image resource.
    static let ciahitiwAgreeCircle = ImageResource(name: "ciahitiw_agree_circle", bundle: resourceBundle)

    /// The "ciahitiw_agree_circle_check" asset catalog image resource.
    static let ciahitiwAgreeCircleCheck = ImageResource(name: "ciahitiw_agree_circle_check", bundle: resourceBundle)

    /// The "cjlwibda_nav_bg" asset catalog image resource.
    static let cjlwibdaNavBg = ImageResource(name: "cjlwibda_nav_bg", bundle: resourceBundle)

    /// The "cnwal_point_black" asset catalog image resource.
    static let cnwalPointBlack = ImageResource(name: "cnwal_point_black", bundle: resourceBundle)

    /// The "cnwal_point_orange" asset catalog image resource.
    static let cnwalPointOrange = ImageResource(name: "cnwal_point_orange", bundle: resourceBundle)

    /// The "coin" asset catalog image resource.
    static let coin = ImageResource(name: "coin", bundle: resourceBundle)

    /// The "commentsend" asset catalog image resource.
    static let commentsend = ImageResource(name: "commentsend", bundle: resourceBundle)

    /// The "dislikepic" asset catalog image resource.
    static let dislikepic = ImageResource(name: "dislikepic", bundle: resourceBundle)

    /// The "likepic" asset catalog image resource.
    static let likepic = ImageResource(name: "likepic", bundle: resourceBundle)

    /// The "orinx_launch_page" asset catalog image resource.
    static let orinxLaunchPage = ImageResource(name: "orinx_launch_page", bundle: resourceBundle)

    /// The "orinx_logo" asset catalog image resource.
    static let orinxLogo = ImageResource(name: "orinx_logo", bundle: resourceBundle)

    /// The "orinxwi_alert_logo" asset catalog image resource.
    static let orinxwiAlertLogo = ImageResource(name: "orinxwi_alert_logo", bundle: resourceBundle)

    /// The "postpiccommentreport" asset catalog image resource.
    static let postpiccommentreport = ImageResource(name: "postpiccommentreport", bundle: resourceBundle)

    /// The "rutyauwc_ai_charactor" asset catalog image resource.
    static let rutyauwcAiCharactor = ImageResource(name: "rutyauwc_ai_charactor", bundle: resourceBundle)

    /// The "rutyauwc_arrow_right" asset catalog image resource.
    static let rutyauwcArrowRight = ImageResource(name: "rutyauwc_arrow_right", bundle: resourceBundle)

    /// The "rutyauwc_bg" asset catalog image resource.
    static let rutyauwcBg = ImageResource(name: "rutyauwc_bg", bundle: resourceBundle)

    /// The "rutyauwc_camara" asset catalog image resource.
    static let rutyauwcCamara = ImageResource(name: "rutyauwc_camara", bundle: resourceBundle)

    /// The "rutyauwc_comment" asset catalog image resource.
    static let rutyauwcComment = ImageResource(name: "rutyauwc_comment", bundle: resourceBundle)

    /// The "rutyauwc_empty" asset catalog image resource.
    static let rutyauwcEmpty = ImageResource(name: "rutyauwc_empty", bundle: resourceBundle)

    /// The "rutyauwc_guide_bg" asset catalog image resource.
    static let rutyauwcGuideBg = ImageResource(name: "rutyauwc_guide_bg", bundle: resourceBundle)

    /// The "rutyauwc_icon_edit" asset catalog image resource.
    static let rutyauwcIconEdit = ImageResource(name: "rutyauwc_icon_edit", bundle: resourceBundle)

    /// The "rutyauwc_launch_page" asset catalog image resource.
    static let rutyauwcLaunchPage = ImageResource(name: "rutyauwc_launch_page", bundle: resourceBundle)

    /// The "rutyauwc_nav_home" asset catalog image resource.
    static let rutyauwcNavHome = ImageResource(name: "rutyauwc_nav_home", bundle: resourceBundle)

    /// The "rutyauwc_nav_home_s" asset catalog image resource.
    static let rutyauwcNavHomeS = ImageResource(name: "rutyauwc_nav_home_s", bundle: resourceBundle)

    /// The "rutyauwc_nav_message" asset catalog image resource.
    static let rutyauwcNavMessage = ImageResource(name: "rutyauwc_nav_message", bundle: resourceBundle)

    /// The "rutyauwc_nav_message_s" asset catalog image resource.
    static let rutyauwcNavMessageS = ImageResource(name: "rutyauwc_nav_message_s", bundle: resourceBundle)

    /// The "rutyauwc_nav_mine" asset catalog image resource.
    static let rutyauwcNavMine = ImageResource(name: "rutyauwc_nav_mine", bundle: resourceBundle)

    /// The "rutyauwc_nav_mine_s" asset catalog image resource.
    static let rutyauwcNavMineS = ImageResource(name: "rutyauwc_nav_mine_s", bundle: resourceBundle)

    /// The "rutyauwc_nav_video" asset catalog image resource.
    static let rutyauwcNavVideo = ImageResource(name: "rutyauwc_nav_video", bundle: resourceBundle)

    /// The "rutyauwc_nav_video_s" asset catalog image resource.
    static let rutyauwcNavVideoS = ImageResource(name: "rutyauwc_nav_video_s", bundle: resourceBundle)

    /// The "rutyauwc_orinx" asset catalog image resource.
    static let rutyauwcOrinx = ImageResource(name: "rutyauwc_orinx", bundle: resourceBundle)

    /// The "rutyauwc_publish" asset catalog image resource.
    static let rutyauwcPublish = ImageResource(name: "rutyauwc_publish", bundle: resourceBundle)

    /// The "rutyauwc_setting" asset catalog image resource.
    static let rutyauwcSetting = ImageResource(name: "rutyauwc_setting", bundle: resourceBundle)

    /// The "videopluse" asset catalog image resource.
    static let videopluse = ImageResource(name: "videopluse", bundle: resourceBundle)

    /// The "xiejljbj_coin" asset catalog image resource.
    static let xiejljbjCoin = ImageResource(name: "xiejljbj_coin", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "back" asset catalog image.
    static var back: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .back)
#else
        .init()
#endif
    }

    /// The "ciahitiw_agree_circle" asset catalog image.
    static var ciahitiwAgreeCircle: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ciahitiwAgreeCircle)
#else
        .init()
#endif
    }

    /// The "ciahitiw_agree_circle_check" asset catalog image.
    static var ciahitiwAgreeCircleCheck: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ciahitiwAgreeCircleCheck)
#else
        .init()
#endif
    }

    /// The "cjlwibda_nav_bg" asset catalog image.
    static var cjlwibdaNavBg: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cjlwibdaNavBg)
#else
        .init()
#endif
    }

    /// The "cnwal_point_black" asset catalog image.
    static var cnwalPointBlack: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cnwalPointBlack)
#else
        .init()
#endif
    }

    /// The "cnwal_point_orange" asset catalog image.
    static var cnwalPointOrange: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cnwalPointOrange)
#else
        .init()
#endif
    }

    /// The "coin" asset catalog image.
    static var coin: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .coin)
#else
        .init()
#endif
    }

    /// The "commentsend" asset catalog image.
    static var commentsend: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .commentsend)
#else
        .init()
#endif
    }

    /// The "dislikepic" asset catalog image.
    static var dislikepic: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .dislikepic)
#else
        .init()
#endif
    }

    /// The "likepic" asset catalog image.
    static var likepic: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .likepic)
#else
        .init()
#endif
    }

    /// The "orinx_launch_page" asset catalog image.
    static var orinxLaunchPage: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .orinxLaunchPage)
#else
        .init()
#endif
    }

    /// The "orinx_logo" asset catalog image.
    static var orinxLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .orinxLogo)
#else
        .init()
#endif
    }

    /// The "orinxwi_alert_logo" asset catalog image.
    static var orinxwiAlertLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .orinxwiAlertLogo)
#else
        .init()
#endif
    }

    /// The "postpiccommentreport" asset catalog image.
    static var postpiccommentreport: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .postpiccommentreport)
#else
        .init()
#endif
    }

    /// The "rutyauwc_ai_charactor" asset catalog image.
    static var rutyauwcAiCharactor: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcAiCharactor)
#else
        .init()
#endif
    }

    /// The "rutyauwc_arrow_right" asset catalog image.
    static var rutyauwcArrowRight: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcArrowRight)
#else
        .init()
#endif
    }

    /// The "rutyauwc_bg" asset catalog image.
    static var rutyauwcBg: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcBg)
#else
        .init()
#endif
    }

    /// The "rutyauwc_camara" asset catalog image.
    static var rutyauwcCamara: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcCamara)
#else
        .init()
#endif
    }

    /// The "rutyauwc_comment" asset catalog image.
    static var rutyauwcComment: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcComment)
#else
        .init()
#endif
    }

    /// The "rutyauwc_empty" asset catalog image.
    static var rutyauwcEmpty: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcEmpty)
#else
        .init()
#endif
    }

    /// The "rutyauwc_guide_bg" asset catalog image.
    static var rutyauwcGuideBg: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcGuideBg)
#else
        .init()
#endif
    }

    /// The "rutyauwc_icon_edit" asset catalog image.
    static var rutyauwcIconEdit: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcIconEdit)
#else
        .init()
#endif
    }

    /// The "rutyauwc_launch_page" asset catalog image.
    static var rutyauwcLaunchPage: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcLaunchPage)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_home" asset catalog image.
    static var rutyauwcNavHome: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavHome)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_home_s" asset catalog image.
    static var rutyauwcNavHomeS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavHomeS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_message" asset catalog image.
    static var rutyauwcNavMessage: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavMessage)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_message_s" asset catalog image.
    static var rutyauwcNavMessageS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavMessageS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_mine" asset catalog image.
    static var rutyauwcNavMine: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavMine)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_mine_s" asset catalog image.
    static var rutyauwcNavMineS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavMineS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_video" asset catalog image.
    static var rutyauwcNavVideo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavVideo)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_video_s" asset catalog image.
    static var rutyauwcNavVideoS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcNavVideoS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_orinx" asset catalog image.
    static var rutyauwcOrinx: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcOrinx)
#else
        .init()
#endif
    }

    /// The "rutyauwc_publish" asset catalog image.
    static var rutyauwcPublish: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcPublish)
#else
        .init()
#endif
    }

    /// The "rutyauwc_setting" asset catalog image.
    static var rutyauwcSetting: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rutyauwcSetting)
#else
        .init()
#endif
    }

    /// The "videopluse" asset catalog image.
    static var videopluse: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .videopluse)
#else
        .init()
#endif
    }

    /// The "xiejljbj_coin" asset catalog image.
    static var xiejljbjCoin: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .xiejljbjCoin)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "back" asset catalog image.
    static var back: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .back)
#else
        .init()
#endif
    }

    /// The "ciahitiw_agree_circle" asset catalog image.
    static var ciahitiwAgreeCircle: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ciahitiwAgreeCircle)
#else
        .init()
#endif
    }

    /// The "ciahitiw_agree_circle_check" asset catalog image.
    static var ciahitiwAgreeCircleCheck: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ciahitiwAgreeCircleCheck)
#else
        .init()
#endif
    }

    /// The "cjlwibda_nav_bg" asset catalog image.
    static var cjlwibdaNavBg: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cjlwibdaNavBg)
#else
        .init()
#endif
    }

    /// The "cnwal_point_black" asset catalog image.
    static var cnwalPointBlack: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cnwalPointBlack)
#else
        .init()
#endif
    }

    /// The "cnwal_point_orange" asset catalog image.
    static var cnwalPointOrange: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cnwalPointOrange)
#else
        .init()
#endif
    }

    /// The "coin" asset catalog image.
    static var coin: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .coin)
#else
        .init()
#endif
    }

    /// The "commentsend" asset catalog image.
    static var commentsend: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .commentsend)
#else
        .init()
#endif
    }

    /// The "dislikepic" asset catalog image.
    static var dislikepic: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .dislikepic)
#else
        .init()
#endif
    }

    /// The "likepic" asset catalog image.
    static var likepic: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .likepic)
#else
        .init()
#endif
    }

    /// The "orinx_launch_page" asset catalog image.
    static var orinxLaunchPage: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .orinxLaunchPage)
#else
        .init()
#endif
    }

    /// The "orinx_logo" asset catalog image.
    static var orinxLogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .orinxLogo)
#else
        .init()
#endif
    }

    /// The "orinxwi_alert_logo" asset catalog image.
    static var orinxwiAlertLogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .orinxwiAlertLogo)
#else
        .init()
#endif
    }

    /// The "postpiccommentreport" asset catalog image.
    static var postpiccommentreport: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .postpiccommentreport)
#else
        .init()
#endif
    }

    /// The "rutyauwc_ai_charactor" asset catalog image.
    static var rutyauwcAiCharactor: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcAiCharactor)
#else
        .init()
#endif
    }

    /// The "rutyauwc_arrow_right" asset catalog image.
    static var rutyauwcArrowRight: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcArrowRight)
#else
        .init()
#endif
    }

    /// The "rutyauwc_bg" asset catalog image.
    static var rutyauwcBg: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcBg)
#else
        .init()
#endif
    }

    /// The "rutyauwc_camara" asset catalog image.
    static var rutyauwcCamara: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcCamara)
#else
        .init()
#endif
    }

    /// The "rutyauwc_comment" asset catalog image.
    static var rutyauwcComment: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcComment)
#else
        .init()
#endif
    }

    /// The "rutyauwc_empty" asset catalog image.
    static var rutyauwcEmpty: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcEmpty)
#else
        .init()
#endif
    }

    /// The "rutyauwc_guide_bg" asset catalog image.
    static var rutyauwcGuideBg: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcGuideBg)
#else
        .init()
#endif
    }

    /// The "rutyauwc_icon_edit" asset catalog image.
    static var rutyauwcIconEdit: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcIconEdit)
#else
        .init()
#endif
    }

    /// The "rutyauwc_launch_page" asset catalog image.
    static var rutyauwcLaunchPage: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcLaunchPage)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_home" asset catalog image.
    static var rutyauwcNavHome: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavHome)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_home_s" asset catalog image.
    static var rutyauwcNavHomeS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavHomeS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_message" asset catalog image.
    static var rutyauwcNavMessage: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavMessage)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_message_s" asset catalog image.
    static var rutyauwcNavMessageS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavMessageS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_mine" asset catalog image.
    static var rutyauwcNavMine: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavMine)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_mine_s" asset catalog image.
    static var rutyauwcNavMineS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavMineS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_video" asset catalog image.
    static var rutyauwcNavVideo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavVideo)
#else
        .init()
#endif
    }

    /// The "rutyauwc_nav_video_s" asset catalog image.
    static var rutyauwcNavVideoS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcNavVideoS)
#else
        .init()
#endif
    }

    /// The "rutyauwc_orinx" asset catalog image.
    static var rutyauwcOrinx: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcOrinx)
#else
        .init()
#endif
    }

    /// The "rutyauwc_publish" asset catalog image.
    static var rutyauwcPublish: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcPublish)
#else
        .init()
#endif
    }

    /// The "rutyauwc_setting" asset catalog image.
    static var rutyauwcSetting: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rutyauwcSetting)
#else
        .init()
#endif
    }

    /// The "videopluse" asset catalog image.
    static var videopluse: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .videopluse)
#else
        .init()
#endif
    }

    /// The "xiejljbj_coin" asset catalog image.
    static var xiejljbjCoin: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .xiejljbjCoin)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog color resource name.
    fileprivate let name: Swift.String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog image resource name.
    fileprivate let name: Swift.String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif