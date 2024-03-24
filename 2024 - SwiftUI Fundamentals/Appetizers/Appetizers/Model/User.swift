//
//  User.swift
//  Appetizers
//
//  Created by Maxim Datskiy on 3/21/24.
//

import SwiftUI

struct User: Codable {
    var id              = UUID()
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthday        = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
