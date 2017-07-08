//
//  ViewController.swift
//  Animation
//
//  Created by Guilherme B V Bahia on 08/07/17.
//  Copyright © 2017 Planet Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var imgView: UIImageView!
   
   var timer : Timer = Timer()
   var imgIndx = 1;
   var running = false;
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   @IBAction func fadeIn(_ sender: UIButton) {
      imgView.alpha = 0;
      UIView.animate(withDuration: 2.5) { 
         self.imgView.alpha = 1;
      }
   }
   
   @IBAction func slideIn(_ sender: UIButton) {
      let dist = imgView.center.x / 2;
      imgView.center = CGPoint(x: dist, y: imgView.center.y);
      
      UIView.animate(withDuration: 2) { 
         self.imgView.center = CGPoint(x: dist * 2, y: self.imgView.center.y)
      }
   }
   
   
   @IBAction func grow(_ sender: UIButton) {
      
      let imgDim = imgView.frame;
      imgView.frame = CGRect(x: imgDim.minX, y: imgDim.minY, width: 0, height: 0);
      UIView.animate(withDuration: 3) { 
         self.imgView.frame = imgDim;
      }
      
   }
   
   @IBAction func nextTapped(_ sender: UIButton) {
      if !running {
         timer = Timer.scheduledTimer(timeInterval: 0.1,
                                      target: self,
                                      selector: #selector(self.animation),
                                      userInfo: nil,
                                      repeats: true);
         sender.setTitle("Stop Running", for: []);
         running = true;
      } else {
         timer.invalidate();
         sender.setTitle("Start Running", for: [])
         running = false;
      }
   }
   
   func animation() {
      let imgName = "frame_\(imgIndx)_delay-0.01s.png"
      imgView.image = UIImage(named: imgName);
      imgIndx += 1;
      if imgIndx > 9 {
         imgIndx = 0;
      }
   }
}

