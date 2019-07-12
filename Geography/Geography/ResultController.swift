//
//  ResultController.swift
//  Geography
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 Sue. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Score.text = "You got \(noC) out of \(total) "
        if noC <= 3{
            message.text = "Not really good...🤣"
        }else if noC <= 6{
            message.text = "Good Job! You are almost there.✌️"
        }else{
            message.text = "Congratulations! 👍"
        }

        // Do any additional setup after loading the view.
    }
    var noC:Int = 0
    var total:Int = 0

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
