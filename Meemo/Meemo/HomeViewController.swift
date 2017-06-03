//
//  HomeViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/30/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var courses: [Course] = []
    
    var lectures: [Lecture] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lectures = (UIApplication.shared.delegate as! AppDelegate).lectures
        
        courses = Course.fetchCourses()
        
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor.clear
        tableView.isOpaque = false
        tableView.backgroundView = nil
        
        
        tableView?.dataSource = self
        tableView?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (lecture?.sessions.count)!
        return lectures.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! HomeTableViewCell
        cell.lecture = self.lectures[indexPath.row]
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (UIApplication.shared.delegate as! AppDelegate).selectedLecture = indexPath.row
        self.performSegue(withIdentifier: "showSessions" , sender: indexPath)
        
    }
}
