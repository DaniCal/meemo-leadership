//
//  FinalBadgeViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/23/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class FinalBadgeViewController: UIViewController {

    var courseCompleted:Bool = false
    var lectures: [Lecture] = []
    var lectureNumber = 0
    var isRegisteredForRemoteNotifications = false

    
    @IBOutlet weak var iconImageView: UIImageView!
    var sourceView: VideoViewController?
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var reminderLabel: UILabel!
    @IBOutlet weak var bellImageView: UIImageView!

    @IBOutlet weak var lineUIView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var popupView: UIView!

    
    @IBAction func backButtonTouch(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        if(courseCompleted){
            sourceView?.lectureCompleted()
        }else{
            sourceView?.dismissVideoView()
            sourceView?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func closeButtonTouch(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        if(courseCompleted){
            sourceView?.lectureCompleted()
        }else{
            sourceView?.dismissVideoView()
            sourceView?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func turnOnNotificationTouch(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        if(courseCompleted){
            sourceView?.lectureCompleted()
        }
        else if(isRegisteredForRemoteNotifications){
            sourceView?.playNextVideo()
        }
        else{
            (UIApplication.shared.delegate as! AppDelegate).enableNotification()
            sourceView?.dismissVideoView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lectures = (UIApplication.shared.delegate as! AppDelegate).lectures
        
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
        
       
        
        let notificationType = UIApplication.shared.currentUserNotificationSettings!.types
        if notificationType == [] {
            isRegisteredForRemoteNotifications = false
        } else {
            isRegisteredForRemoteNotifications = true
        }
    
        
        if(courseCompleted){
            button.setTitle("Learn More",for: .normal)
            reminderLabel.isHidden = true
            bellImageView.isHidden = true
            lineUIView.isHidden = true
            titleLabel.text = "Congrats!"
            textLabel.text = "You're now done with your daily dosis of Meemo! You are such a great leaner"
        }else if(isRegisteredForRemoteNotifications){
            button.setTitle("Watch Next",for: .normal)
            reminderLabel.isHidden = true
            bellImageView.isHidden = true
            lineUIView.isHidden = true
            titleLabel.text = "Congrats!"
            textLabel.text = "Complete your daily dosis of Meemo!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}
