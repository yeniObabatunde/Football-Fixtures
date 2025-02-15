//
//  CachedObject.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import Foundation
import RealmSwift

class CachedObject: Object {
    @Persisted(primaryKey: true) var key: String = ""
    @Persisted var data: Data?
}
