//
//  Input.swift
//  Don't forget me
//
//  Created by GWC on 7/11/19.
//  Copyright © 2019 Sue. All rights reserved.
//

import UIKit
import CoreData

class Input: UIViewController {

    @IBOutlet weak var Due: UITextField!
    
    @IBOutlet weak var Time: UITextField!
    @IBOutlet weak var input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func addTask() {
        if (input.text != "") {
            
            
            let context = (UIApplication.shared.delegate as!   AppDelegate).persistentContainer.viewContext
            let newTask = Task(context: context)
            newTask.name = input?.text
            if (Due.text != ""){
                newTask.date = Due?.text
            }
            if (Time.text != ""){
                newTask.time = Time?.text
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            //print(newTask.name!)
            
            
        }
    }

    @IBAction func save(_ sender: Any) {
        addTask()
        input.text = ""
        Due.text = ""
        Time.text = ""
        input.resignFirstResponder()
        Due.resignFirstResponder()
        Time.resignFirstResponder()
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
