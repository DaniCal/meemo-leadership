//
//  Lecture.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/22/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class Lecture:NSObject{
    
    var title = ""
    var imageURL = ""
    var portraitURL = ""
    var author = ""
    var authorDescription = ""
    var portraitImage: UIImage
    var featuredImage: UIImage
    var number: Int
    var locked: Bool
    var watched: Bool
    var sessions:[Session]
    var advices: [Advice]
    var commingSoon = false
    
    /*
     TODO
     var backgroundURL:String
     var parallaxURL:String
     var summaryPoints:[SummaryPoint]
    */
    
    init(title: String, featuredImage: UIImage, number: Int, locked: Bool, watched: Bool){
        self.title = title
        self.featuredImage = featuredImage
        self.number = number
        self.locked = locked
        self.watched = watched
        self.sessions = Session.fetchSessions()
        self.advices = Advice.fetchAdvices()
        self.portraitURL = ""
        self.author = ""
        self.authorDescription = ""
        self.portraitImage = UIImage(named: "background1")!
        self.commingSoon = false
    }
    
    override init(){
        self.title = ""
        self.featuredImage = UIImage(named: "background1")!
        self.number = 0
        self.locked = false
        self.watched = false
        self.sessions = []
        self.advices = []
        self.portraitURL = ""
        self.author = ""
        self.authorDescription = ""
        self.portraitImage = UIImage(named: "background1")!
        self.commingSoon = false

    }
    
    static func fetchLectures() -> [Lecture]{
        return[
            Lecture(title: "Capture what's on your mind", featuredImage: UIImage(named: "background1")!, number: 1,  locked: false, watched: true),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 2,  locked: false, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 3,  locked: true, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 4,  locked: true, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 5,  locked: true, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 6,  locked: true, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 7,  locked: true, watched: false),
            Lecture(title: "Capture", featuredImage: UIImage(named: "background1")!, number: 8,  locked: true, watched: false)

        ]
    }
    
    static func fetchLecture() -> Lecture{
        return Lecture(title: "Capture what's on your mind", featuredImage: UIImage(named: "background1")!, number: 1,  locked: false, watched: true)
    }
    
    static func fetchDavidAllenLecture() -> Lecture{
        let lecture = Lecture(title: "Getting Things Done", featuredImage: UIImage(named: "background1")!, number: 5,  locked: false, watched: false)
        lecture.commingSoon = true
        return lecture
    }
    
    func dayTitle()-> String{
        return "Chapter \(String(number))"
    }
    
    func watchButtonImage() -> UIImage{
        if(locked){
            return UIImage(named: "lockedButton")!
        }else if(watched){
            return UIImage(named: "watchButtonWhite")!
        }else{
            return UIImage(named: "watchButtonGreen")!
        }
    }
    
}
