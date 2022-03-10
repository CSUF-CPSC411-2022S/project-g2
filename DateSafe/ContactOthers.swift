//
//  ContactOthers.swift
//  DateSafe
//
//  Created by Jeein Kim on 3/9/22.
//

import Foundation


class ContactOthers : Notifications {
        var person: String
        
        init(_ msg: String, to person: String) {
            self.person = person
            super.init(msg)
        }
        
        override func message() -> String {
            return msg
        }
}

