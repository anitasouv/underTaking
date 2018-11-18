//
//  Clue.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import Foundation

class Clue: NSObject {
    var name:String = "";
    var labels:[String] = [];
    var satisfied:Bool = false;
    var prompt: String = "";
    var rqmt:Requirement = Requirement.text;
    //    var location: logLat

    override init() {
        self.name = "tempName";
        self.labels = ["sample"];
        self.satisfied = false;
        self.prompt = "This is a sample prompt. Get a piture of a vase.";
        self.rqmt = Requirement.imageOnly;
    }
    
    init(name: String, labels: [String],satisfied: Bool?, prompt: String, rqmt: Int) {
        self.name = name;
        self.labels = labels;
        if satisfied != nil {
            self.satisfied = satisfied!;
        } else {
            self.satisfied = false;
        }
        self.prompt = prompt;
        self.rqmt = Requirement(rawValue: rqmt)!;
    }
    
    enum Requirement:Int {
        case text
        case imageOnly
        case imageAndLocation
        case locationOnly
    }
}

