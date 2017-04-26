//
//  ViewController.swift
//  practice
//
//  Created by AIB on 26/04/2017.
//  Copyright © 2017 SkytTech Enterprise. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
    var timerObject = Timer()

    @IBOutlet weak var time: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timer() {
        if timerObject.timeInterval < 10 && timerObject.timeInterval > 90 {
            timerObject.invalidate()
            
        }
        else{
            let random = arc4random_uniform(80) + 10
            if Int32(timerObject.timeInterval) == Int32(random) {
                let alertVC = UIAlertController(title: "END", message: "Random Number Reached", preferredStyle: .alert)
                let imageV = UIImageView(frame: CGRect(origin: alertVC.accessibilityFrame.origin, size: CGSize(width: 40, height: 40)))
                if random%2 == 0 {
                    imageV.image  = UIImage(named: "left arrow")
                }else{
                    imageV.image  = UIImage(named: "right arrow")
                }
                alertVC.view.addSubview(imageV)
                
                let okay = UIAlertAction(title: "OK", style: .default, handler: {Void in
                    self.timerObject.invalidate()
                })
                alertVC.addAction(okay)
            }
        }
    }
    
    @IBAction func start(_ sender: UIButton) {
        
         timerObject = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("timer:")), userInfo: nil, repeats: true)
         self.time.text = String(timerObject.timeInterval)
        
//        timer.fire()
    }

}

