//
//  RealmHelper.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import RealmSwift
import Foundation

class RealmHelper {
    private let realm = try! Realm()

    func save<T: Codable>(_ objects: [T]) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(objects)
        
        let cacheObject = CachedObject()
        cacheObject.key = String(describing: T.self)
        cacheObject.data = data
        
        try! realm.write {
            realm.add(cacheObject, update: .all)
        }
    }

    func fetch<T: Codable>(_ type: T.Type) -> [T] {
        guard let cachedData = realm.objects(CachedObject.self).filter("key == %@", String(describing: T.self)).first?.data else {
            return []
        }

        let decoder = JSONDecoder()
        return (try? decoder.decode([T].self, from: cachedData)) ?? []
    }
    
    func clear<T: Object>(_ type: T.Type) {
        do {
            try realm.write {
                let objects = realm.objects(CachedObject.self)
                realm.delete(objects)
            }
        } catch {
            Logger.printIfDebug(data: "Error clearing Realm data: \(error.localizedDescription)", logType: .error)
            print("Error clearing Realm data: \(error.localizedDescription)")
        }
    }
}

