//
//  HomeTableViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/30/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var completedImage: UIImageView!
    @IBOutlet weak var clipsLeftLabel: UILabel!
    @IBOutlet weak var authorSubtitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var portrait: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var lecture: Lecture?{
        didSet{
            self.updateUI()
        }
    }
    
    fileprivate func updateUI(){
        
        if let lecture = lecture {
            courseTitle.text = lecture.title
            author.text = lecture.author
            authorSubtitle.text = lecture.authorDescription
            portrait.image = lecture.portraitImage
            backgroundImage.image = lecture.featuredImage
            
            if(lecture.sessions[lecture.sessions.count - 1].watched){
                completedImage.isHidden = false
                clipsLeftLabel.isHidden = true
            }else{
                completedImage.isHidden = true
                clipsLeftLabel.isHidden = false
                var clipsLeft = 0
                for session in lecture.sessions{
                    if(session.watched == false){
                        clipsLeft = clipsLeft + 1
                    }
                }
                clipsLeftLabel.text = "\(clipsLeft) clips left"
            }
            
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true

            
        }else{
            author.text = ""
            authorSubtitle.text = ""
            courseTitle.text = ""
            portrait.image = nil
            backgroundImage.image = nil
            
        }
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    

}
