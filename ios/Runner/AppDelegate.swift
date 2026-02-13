import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // اختيار ملف GoogleService-Info.plist حسب flavor
    var filePath: String?
    
    #if DEVELOPMENT
    filePath = Bundle.main.path(forResource: "GoogleService-Info-Dev", ofType: "plist")
    #else
    filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
    #endif
    
    if let filePath = filePath, let options = FirebaseOptions(contentsOfFile: filePath) {
        FirebaseApp.configure(options: options)
    } else {
        fatalError("Couldn't load Firebase config file")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}



// import UIKit
// import Flutter

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
