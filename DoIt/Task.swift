//
//  Task.swift
//  DoIt
//
//  Created by Michael Malotte on 11/13/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import Foundation


class Task {
    
    private var _name: String!
    private var _important: Bool!
    
    init(name: String, important: Bool) {
        _name = name
        _important = important
    }
    
    var name: String {
        get {
            return _name
        }set {
            _name = newValue
        }
    }
    
    var important: Bool {
        get {
            return _important
        }set {
            _important = newValue
        }
    }
    
}
