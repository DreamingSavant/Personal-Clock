//
//  ViewController.swift
//  Personal Clock
//
//  Created by Roderick Presswood on 7/22/18.
//  Copyright © 2018 Roderick Presswood. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let clock = Clock()
    var timer: Timer?
    
   //create time label
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var clockLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getCurrentTime()
        getCurrentClockTime()
        
        //code below constantly updates the clock label... see clock label at work in get current clock time func
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    //view did appear should update time
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //NSDate and NSDateFormatter ??
    
    //create a function that fetches the current time & keeps running
    func getCurrentTime(){
        let formatter = DateFormatter()
        formatter.dateStyle =
            .none
        formatter.timeStyle = .medium
        let str = formatter.string(from: Date())
        timeLabel.text = str
    }
    
    func getCurrentClockTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        clockLabel.text = formatter.string(from: clock.currentTime() as Date)
    }

    @objc func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        clockLabel.text = formatter.string(from: clock.currentTime() as Date)
    }
}

