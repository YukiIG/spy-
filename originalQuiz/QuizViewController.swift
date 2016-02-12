//
//  QuizViewController.swift
//  originalQuiz
//
//  Created by yuki ishiguro on 2016/02/12.
//  Copyright © 2016年 yk1209. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var mondai: UILabel!
    @IBOutlet var quizView: UITextView!
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    //問題
    var quizArray = [AnyObject]()
    //正答数
    var answerCount: Int = 0
    //問題数
    var mondaiCount: Int = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //一時的に格納するための配列（問題をシャッフルしたい）
        var tmpArray = [AnyObject]()
        
        tmpArray.append(["アメリカのスパイの名称は？","FBI","CIA","KFC",2])
        tmpArray.append(["この中でスパイは誰？","ジェームズボンド","ウィルスミス","ネスミス",1])
        tmpArray.append(["毛利小五郎の職業は？","スパイ","宇宙飛行士","探偵",3])
        
        //shuffle
        while(tmpArray.count > 0){
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }

        //各値をセット
    func choiceQuiz(){
        quizView.text = quizArray[0][0] as! String
        choiceButton1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButton2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButton3.setTitle(quizArray[0][3] as? String, forState: .Normal)
        mondai.text = "第" + String(mondaiCount) + "問目"
    }
    
    //解答選択後
    @IBAction func choiceAnswer(sender: UIButton){
        if quizArray[0][4] as! Int == sender.tag{
            answerCount++
        }
        
        quizArray.removeAtIndex(0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            mondaiCount++
            choiceQuiz()
        }
        
    }
    
    func performSegueToResult(){
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.answerCount = self.answerCount
        }
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