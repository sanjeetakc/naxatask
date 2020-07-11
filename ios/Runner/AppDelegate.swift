import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
   GMSServices.provideAPIKey("AIzaSyDV4R04WQjm7gQFLId0EObqB8ilV2IXsk0")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
