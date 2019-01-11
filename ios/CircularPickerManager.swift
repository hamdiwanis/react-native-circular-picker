import Foundation
import UIKit

@objc(CircularPicker)
class CircularPickerManager : RCTViewManager {
  override func view() -> UIView {
    return CircularPickerView()
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return true
  }
}
