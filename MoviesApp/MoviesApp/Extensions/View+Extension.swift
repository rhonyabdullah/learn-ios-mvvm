//
//  View+Extension.swift
//  MoviesApp
//
//  Created by Rhony on 28/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

extension View {

    func embedNavigationView() -> some View {
        if #available(iOS 16.0, *) {
            return NavigationStack { self }
        } else {
            return NavigationView { self }
        }
    }
}
