import Cocoa
import FlutterMacOS
import FBSDKCoreKit
import FBSDKLoginKit

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)
    ApplicationDelegate.shared.applicationDidFinishLaunching(notification)
  }

  override func application(_ application: NSApplication, open urls: [URL]) {
    for url in urls {
      ApplicationDelegate.shared.application(application, open: url)
    }
  }
}
