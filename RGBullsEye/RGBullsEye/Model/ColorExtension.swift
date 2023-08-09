//
//  ColorExtension.swift
//  RGBullsEye
//
//  Created by JETS-Mobile Lab on 09/08/2023.
//

import Foundation
import SwiftUI

extension Color {
  init(rgbStruct rgb: RGB) {
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
  }
}
