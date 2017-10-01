//
//  ViewController.swift
//  NavigationBar
//
//  Created by Farben on 2017/9/28.
//  Copyright © 2017年 Farben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        btn.center = self.view.center
        btn.setTitle("点我", for: UIControlState.normal)
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.yellow
        btn.tintColor=UIColor.black
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn .addTarget(self, action: #selector(clickToPush), for: UIControlEvents.touchDown)
        
        
    }
    
    @objc func clickToPush() {
        self.navigationController?.pushViewController(firstViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

