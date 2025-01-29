//
//  String+Extension.swift
//  MoviesApp
//
//  Created by Rhony on 29/01/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        return self.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? self
    }
}
