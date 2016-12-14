//
//  UserDefaultsManager.swift
//
//  Created by Piotr Torczynski on 13/12/2016.
//

import Foundation

class UserDefaultsManager {

    var wasAppLaunched: Bool {
        get {
            return boolForKey(Keys.wasAppLaunched, defaultValue: false)
        }
        set {
            setBool(newValue, forKey: Keys.wasAppLaunched)
        }
    }
}

private extension UserDefaultsManager {

    struct Keys {
        static let wasAppLaunched = "wasAppLaunched"
    }

    func setObject(_ object: AnyObject?, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(object, forKey:key)
        defaults.synchronize()
    }

    func stringForKey(_ key: String) -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: key)
    }

    func setBool(_ value: Bool, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func boolForKey(_ key: String, defaultValue: Bool) -> Bool {
        let defaults = UserDefaults.standard

        if let result = defaults.object(forKey: key) {
            return (result as AnyObject).boolValue
        }
        else {
            return defaultValue
        }
    }

    func removeObjectForKey(_ key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
}
