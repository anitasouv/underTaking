//
//  Clue2ViewController.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class Clue2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return req.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        reqCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reqCell")! as UITableViewCell
        let text = req[indexPath.row];
        cell.textLabel?.text = text;
        
        var color = UIColor.white;
        if (indexPath.row%2 != 0) {
            color = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
        }
        cell.backgroundColor = color;
        
        return cell;
    }
    

    var clue:Clue?;
    var req:[String] = [];
    @IBOutlet weak var clueDescription: UITextView!
    @IBOutlet weak var requirmentTableViews: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requirmentTableViews.delegate = self;
        requirmentTableViews.dataSource = self;
        if (clue != nil) {
            clueDescription.text = clue!.prompt;
            req = clue!.labels;
            requirmentTableViews.reloadData();
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
        
        // clue to camera to photoview
        
        if let destVC = segue.destination as? CameraViewController {
            destVC.clue = clue!;
        }
    }
 

}
