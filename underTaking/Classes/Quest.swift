//
//  Quest.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import Foundation

class Quest: NSObject {
    var uniqueID: String;
    var name:String = "";
    var participants:Int = 0; // can change to an array of sorts so can display the players playing AND the number of players
    //    var location: logLat
//    var duration?
    var mission: String = "";
    var startDate:NSDate;
    var endDate: NSDate;
    var completion: Float;
    var clues:[Clue] = [];
    
    override init() {
        self.uniqueID = "UNIQUERAND";
        self.name = "temp quest";
        self.participants = 2;
        self.mission = "This is the mission. This sample mission is to find all of the vases"
        self.startDate = Date() as NSDate;
        self.endDate = Date(timeInterval: 2*86400, since: startDate as Date) as NSDate;
        self.completion = 0.0;
        self.clues = [Clue(), Clue()];
    }
    
    init(name: String, participants: Int, startDate: Date, endDate: Date, completion: Float, mission: String, clues: [Clue]) {
        // generate a uniqueID
        self.uniqueID = "UNIQUERAND123";
        self.name = name;
        self.participants = participants;
        self.mission = mission;
        self.startDate = startDate as NSDate;
        self.endDate = endDate as NSDate;
        self.completion = completion;
        self.clues = clues;
    }
}

