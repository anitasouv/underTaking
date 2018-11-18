//
//  MyQuestsViewController.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class MyQuestsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myQuests.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    var selectedIndex = -1;
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "questCell")!
        let text = myQuests[indexPath.row].name
        cell.textLabel?.text = text
        
        // TODO Subtext of progress does not work rn
        var color = UIColor.white;
        var textProgress = "in progress: " + String(myQuests[indexPath.row].completion);
        if (myQuests[indexPath.row].completion == 1) {
            color = UIColor.green;
            textProgress = "completed"
        } else if indexPath.row % 2 != 0 {
            color = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        }
        cell.contentView.backgroundColor = color;
        cell.detailTextLabel?.text = textProgress;
        cell.detailTextLabel?.textColor = UIColor.lightGray;

        return cell
    }

    
    var myQuests:[Quest] = [];
    
    @IBOutlet weak var questTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        var clues:[Clue] = [];
        clues.append(Clue());
        clues.append(Clue());
        
        myQuests.append(Quest(name: "hello world quest", participants: 1, startDate: Date(), endDate: Date(timeInterval: 2*86400, since: Date()), completion: 1.0, mission: "Say hello to the world", clues: clues));

        myQuests.append(Quest());
        myQuests.append(Quest());

        questTable.dataSource = self;
        questTable.delegate = self;

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // send the quest to the next page
        selectedIndex = indexPath.row;
        self.performSegue(withIdentifier: "viewQuest", sender: self);
    }
    
    @IBAction func toSample(_ sender: Any) {
        // send fake data?
        self.performSegue(withIdentifier: "viewQuest", sender: self);
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (selectedIndex == -1) {
            if let destVC = segue.destination as? QuestViewController {
                destVC.quest = Quest();
            }
        }
        if let destVC = segue.destination as? QuestViewController {
            destVC.quest = myQuests[selectedIndex];
        }
    }
 

}
