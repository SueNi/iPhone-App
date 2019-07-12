//
//  Quiz.swift
//  Geography
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 Sue. All rights reserved.
//

import UIKit

struct str {
    var title:String
    var answer:[String]
    var correct:Int
    
}

class Quiz: UIViewController {

    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var Progress: UILabel!
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    @IBOutlet weak var op4: UIButton!
    
    
    let list:[str] = [
        str(title: "Which of the continents has the largest polulation?", answer: ["North America", "Europe", "Asia", "Africa"], correct: 2),
        str(title: "Which of the following is the highest mountain in the world?", answer: ["Appalachian", "Alps", "Rocky", "Everest"], correct: 3),
        str(title: "Which of the following is the most biodiverse country in the world?", answer: ["US", "China", "Brazil", "Russia"], correct: 2),
          str(title: "Which of the following continent (Except for Antarctica) has the least amount of countries?", answer: ["South America", "North America", "Oceania/Australia", "Asia"], correct: 0),
        str(title: "Which of the following is the smallest country in the world?", answer: ["San Marino", "Vatican City", "Singapore", "Morocco"], correct: 1),
        str(title: "Which of the following ocean has the deepest trench/point in the world?", answer: ["Pacific", "Indian", "Atlantic", "Arctic"], correct: 0),
        str(title: "Which of the following is the longest river in the world?", answer: ["Amazon", "Nile", "Yellow River", "Yangtze"], correct: 1)
    
    ]
    var currentQ:str?
    var currentI:Int = 0
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setQ()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            let vc = segue.destination as! ResultController
            vc.noC = num
            vc.total = list.count
        }
    }
    
    func setQ() {
        if currentI < list.count{
            currentQ = list[currentI]
            Question.text = currentQ?.title
            op1.setTitle(currentQ?.answer[0], for: .normal)
            op2.setTitle(currentQ?.answer[1], for: .normal)
            op3.setTitle(currentQ?.answer[2], for: .normal)
            op4.setTitle(currentQ?.answer[3], for: .normal)
            Progress.text = "Progress:" + String(currentI+1) + "/" + String(list.count)
        }else{
            performSegue(withIdentifier: "result", sender: self)
        }
    }
    
    func nextQ(){
        currentI += 1
        setQ()
    }
    
    func check(index:Int) {
        if currentQ?.correct == index {
            num += 1
        }
        nextQ()
    }

    @IBAction func ans1(_ sender: Any) {
        check(index: 0)
        
    }
    @IBAction func ans2(_ sender: Any) {
        check(index: 1)
        
    }
    @IBAction func ans3(_ sender: Any) {
        check(index: 2)
        
    }
    @IBAction func ans4(_ sender: Any) {
        check(index: 3)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
