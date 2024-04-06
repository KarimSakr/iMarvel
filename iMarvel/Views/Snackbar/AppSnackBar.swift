//
//  AppSnackBar.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import Foundation
import SnackBar

class AppSnackBar: SnackBar {
    
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .secondarySystemBackground
        style.textColor = .systemRed
        return style
    }
}
