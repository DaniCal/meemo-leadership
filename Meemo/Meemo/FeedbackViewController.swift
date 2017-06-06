//
//  FeedbackViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 6/6/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    var sourceView: VideoViewController?

    @IBOutlet weak var badgeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        badgeView.layer.cornerRadius = 10
        badgeView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func giveFeedback(_ sender: Any) {
        let email = "leon@joinmeemo.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func closebadge(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        sourceView?.lectureCompleted()
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
