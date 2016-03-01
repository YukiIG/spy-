//
//  ResultViewController.swift
//  originalQuiz
//
//  Created by yuki ishiguro on 2016/02/12.
//  Copyright © 2016年 yk1209. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var answerCount: Int = 0
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var typeImage: UIImageView!
    
    let jam = UIImage(named: "ジェームズボンド.jpg")
    let spy = UIImage(named: "一流スパイ.jpg")
    let bon = UIImage(named: "凡人.jpeg")


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(answerCount) + "問正解"
        
        if answerCount == 5 {
            typeLabel.text = "ジェームズボンド級のスパイ"
            typeImage!.image = jam
        } else if answerCount == 4 || answerCount == 3 {
            typeLabel.text = "一流スパイ"
            typeImage!.image = spy
        } else {
            typeLabel.text = "凡人"
            typeImage!.image = bon
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
