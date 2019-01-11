import Foundation
import AGCircularPicker

@objc(CircularPickerView)
class CircularPickerView : AGCircularPicker  {
  var onValueChange: RCTBubblingEventBlock?
  var onColorChange: RCTBubblingEventBlock?
  var _text = ""
  var _current = 0
  var _max = 100
  var _colors = [
      UIColor.rgb_color(r: 0, g: 237, b: 233),
      UIColor.rgb_color(r: 0, g: 135, b: 217),
      UIColor.rgb_color(r: 138, g: 28, b: 195)
  ]
  
  var colors: NSArray {
    set(val) {
      _colors = []
      for color in val {
        _colors.append(hexToColor(hexString: color as! NSString))
      }
      setUpView()
    }
    get {
      return _colors as NSArray
    }
  }
  
  var text: NSString {
    set(val) {
      _text = val as String
      setUpView()
    }
    get {
      return _text as NSString
    }
  }
  
  var current: NSNumber? {
    set(val) {
      _current = val as! Int
    }
    get {
      return nil
    }
  }
  
  var max: NSNumber? {
    set(val) {
      _max = val as! Int
      setUpView()
    }
    get {
      return nil
    }
  }
  
  func setUpView() {
    let titleOption = AGCircularPickerTitleOption(title: _text)
    let valueOption = AGCircularPickerValueOption(minValue: 0, maxValue: _max, initialValue: _current)
    let colorOption = AGCircularPickerColorOption(gradientColors: _colors, gradientAngle: 20)
    let option = AGCircularPickerOption(valueOption:valueOption, titleOption: titleOption, colorOption: colorOption)
    self.options = [option]
    self.delegate = self
  }
}

extension CircularPickerView: AGCircularPickerDelegate {

  func didChangeValues(_ values: Array<AGColorValue>, selectedIndex: Int) {
    if self.onValueChange != nil {
      let event = ["value": values[0].value]
      self.onValueChange!(event)
    }
    
    if self.onColorChange != nil {
      let event = ["value": colorToHex(color: values[0].color)]
      self.onColorChange!(event)
    }
  }

}

func colorToHex(color: UIColor) -> String {
  var r:CGFloat = 0
  var g:CGFloat = 0
  var b:CGFloat = 0
  var a:CGFloat = 0
  
  color.getRed(&r, green: &g, blue: &b, alpha: &a)
  
  let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
  
  return NSString(format:"#%06x", rgb) as String
}

func hexToColor(hexString: NSString) -> UIColor {
  let hexString:NSString = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
  let scanner = Scanner(string: hexString as String)
  
  if (hexString.hasPrefix("#")) {
    scanner.scanLocation = 1
  }
  
  var color:UInt32 = 0
  scanner.scanHexInt32(&color)
  
  let mask = 0x000000FF
  let r = Int(color >> 16) & mask
  let g = Int(color >> 8) & mask
  let b = Int(color) & mask
  
  let red   = CGFloat(r) / 255.0
  let green = CGFloat(g) / 255.0
  let blue  = CGFloat(b) / 255.0
  
  return UIColor(red:red, green:green, blue:blue, alpha:1)
}
