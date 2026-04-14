import SwiftUI

final class YtjhlskJKitiwState {

  private init() {}

  private static let defaults = UserDefaults.standard

  static var ytjhlskJKitiwAgree: Bool {
    get { defaults.bool(forKey: "ytjhlskJKitiwAgree") }
    set { defaults.set(newValue, forKey: "ytjhlskJKitiwAgree") }
  }
    
    static var ytjhlskJKitiwAgreeEULA: Bool {
      get { defaults.bool(forKey: "ytjhlskJKitiwAgreeEULA") }
      set { defaults.set(newValue, forKey: "ytjhlskJKitiwAgreeEULA") }
    }

}

