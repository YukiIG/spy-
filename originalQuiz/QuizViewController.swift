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
        tmpArray.append(["「失敗」はなんと読む？","スパイ","すっぱい","しっぱい",3])
        tmpArray.append(["目の前には扉が２つあります。１つは本当の扉ですが、もう１つは偽物の扉。どちらが本当の扉かを知っているのは、扉の前にいる２人の門番だけ。１人はウソをつかない正直者。もう一人はウソしかつかないアマノジャク。左右どちらが本物かはわかりません。２人のうちどちらかに１回だけ質問をして本当の扉を見やぶるには、どんな質問をすればよいでしょうか。","もう一人はどっちが本当の扉だと言うと思う？","あなたは右の扉が本当の扉だと思う？","左のとびらが本物ですか？",1])
        tmpArray.append(["1+2+3+4+5+6+7+8+9+10=?","44","55","66",2])
        tmpArray.append(["123*456=？","56088","44558","34538",1])
        tmpArray.append(["初代ジェームズボンドを演じたのは誰？","スパイ","すっぱい","ショーン コネリー",3])

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
        
        if mondaiCount == 5 {
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
