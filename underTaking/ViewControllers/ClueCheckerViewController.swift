//
//  ClueCheckerViewController.swift
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class ClueCheckerViewController: UIViewController {

    // need image
    // get location if needed
    // need clue class instance
    //Does the labels recieved match what was needed in the clue?
    var imageSending:UIImage!
    //    var location // need to look at map sdk
    
    
    var clue:Clue?
    var checklist:[String:Bool] = [:]
    var list:NSDictionary = [:]
    @IBAction func closeResults(_ sender: Any) {
        // close and save
        self.dismiss(animated: true, completion: nil)
    }
    
    var result: NSMutableDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

//        if (clue != nil) {
//            for l in clue!.labels {
////                checklist += [l:false];
//                list.append[l:false]
//            }
//        }
        
        if let img = imageSending {
            print("Hurray")
            var inst: ClarifaiAPI = ClarifaiAPI()
            inst.someProperty = "Hello World!!"
            print(inst.someProperty)
//            inst.someMethod(imageSending)
            inst.someMethod()
            result = inst.getlabels(from: img);
            if (result != nil && clue != nil) {
                print("SOMETHING WAS PASSED BACK WOOOO");
                // check the labels recieved for what is needed and display
                // look at clue.labels[0:end] and see if it is in teh result.
                for l in (clue?.labels)! {
                    if (result?.value(forKey: l) == nil) {
                        // not good! break?
                        print("NOT A MATCH")
                    }

                }
                
                
                
            } else {
                print("SOMETHING WAS NOT PASSED BACK :(");
            }
            
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
