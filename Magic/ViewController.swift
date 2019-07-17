//
//  ViewController.swift
//  Magic
//
//  Created by Eric sia zhi peng on 01/07/2019.
//  Copyright © 2019 MicroLattice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var xyzb: UISwitch! //xianyuzhengba
    @IBOutlet weak var cs: UITextField! //cishu
    @IBOutlet weak var sj: UILabel! //shijian
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //don't change on load show message
    override func viewDidAppear(_ animated: Bool) {
        let today = Date()
        if ( Calendar.current.dateComponents([.weekday], from: today).weekday == 7)
        {
            let alert = UIAlertController(title: "星期6 - 只提醒您一次", message: "大大去看一下有仙玉争霸是吗？", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "有", style: .default, handler: { (action: UIAlertAction!) in
                self.xyzb.setOn(true, animated: true)
                alert.dismiss(animated: true, completion:nil)
            }))
            
            alert.addAction(UIAlertAction(title: "没有", style: .cancel, handler: { (action: UIAlertAction!) in
                alert.dismiss(animated: true, completion:nil)
            }))
            
            present(alert, animated: true, completion: nil)
        }
        
    }
        
    //jisuanannniulet date = Date()
    
    @IBAction func jsuan(_ sender: Any) {
        self.view.endEditing(true)
        var today = Date()
        var tt:Double
        if(xyzb.isOn){ tt = 3600; }
        else {tt = 6900; }
        let ins:Double! = Double(cs.text!)
        let no:Double! = tt / 33; //u want to change time is edit here
        let  iSecond:Double = (ins - no) * 33; //Total number of seconds
        today = today.addingTimeInterval(iSecond)
        sj.text = String(Calendar.current.component(.hour, from: today)) + ":" + String(format: "%02d", Calendar.current.component(.minute, from: today))
        

       
    }
    
}

