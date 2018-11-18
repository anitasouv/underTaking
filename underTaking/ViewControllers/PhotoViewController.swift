//
//  PhotoViewController.swift
//  underTaking
//
//  Created by Anita Souv on 11/17/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var clue:Clue?
    var imageRecieved:UIImage?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var questionLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageRecieved = UIImage(named: "images/tempfile.jpg");
        
        if let avialableImage = imageRecieved {
            print("image is here!");
            imgView.image = avialableImage;
        } else {
            print("image is NOT here!");

        }
        
        self.navigationController?.isNavigationBarHidden = false

        if (clue != nil) {
            questionLbl.text = "Use this picture for the '" + clue!.name + "' clue?"
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func redoPicture(_ sender: Any) {
        
        // go back to the camera
        performSegue(withIdentifier: "redoCaptureImage", sender: self);
    }
    
    
    @IBAction func sendOffImage(_ sender: Any) {
        
        // call api? or send image to another screen
        // send to other
        
        let clueCheckVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClueCheckerVC") as! ClueCheckerViewController

        clueCheckVC.imageSending = imageRecieved;

        DispatchQueue.main.async {
            self.present(clueCheckVC, animated: true, completion: {
//                self.stopCaptureSession()
            })
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToCamera(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destVC = segue.destination as? ClueCheckerViewController {
            destVC.clue = self.clue;
        }
    }
 

}
