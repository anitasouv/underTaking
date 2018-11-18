//
//  QuestViewController.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("called numebr of rows" + String(clues.count));
        return clues.count;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clueCell")! as UITableViewCell
        let text = clues[indexPath.row].name;
        cell.textLabel?.text = text;
        
        var color = UIColor.white;
        if (indexPath.row%2 != 0) {
            color = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        }
        cell.backgroundColor = color;
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clue = clues[indexPath.row];
        selectedIndex = indexPath.row;
        self.performSegue(withIdentifier: "viewClue", sender: self)
    }
    
    var selectedIndex = -1;

    var quest:Quest? = nil;
    var clues:[Clue] = [];
    var clue:Clue?;
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var missionOfQuestTextView: UITextView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var clueTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clueTableView.dataSource = self;
        clueTableView.delegate = self;
        if (quest != nil) {
            // set up info
            print("Successfully transfered")
            nameLabel.text = "Quest: " + quest!.name;
            participantLabel.text = String(quest!.participants) + " players"
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            var myString = formatter.string(from: quest!.startDate as Date)
            startDateLabel.text = "Start Date: " + myString;
            myString = formatter.string(from: quest!.endDate as Date)
            endDateLabel.text = "End Date: " + myString;
            
            missionOfQuestTextView.text = quest!.mission;
            missionOfQuestTextView.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
            progressLabel.text = "Completion %: " + String(quest!.completion);
            clues = quest!.clues;
            print("Number of clues: " + String(clues.count))
            clueTableView.reloadData();
        } else {
            print("Unsuccessfully transfered")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if (selectedIndex == -1) {
            // nothing
        } else if let destVC = segue.destination as? Clue2ViewController {
            destVC.clue = clues[selectedIndex];
        }
    }
 

}
