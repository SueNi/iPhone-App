//
//  tableController.swift
//  Don't forget me
//
//  Created by GWC on 7/11/19.
//  Copyright © 2019 Sue. All rights reserved.
//

import UIKit

class tableController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet var table: UITableView!
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableView.automaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    func getData() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
            print(tasks)
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        } catch {
            print("Couldn't fetch Data")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        getData()
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Table", for: indexPath)
        let date = tasks[indexPath.row].date
        let time = tasks[indexPath.row].time
        // Configure the cell...
        let num = indexPath.row + 1
        cell.textLabel?.text = "\(num). \(String(tasks[indexPath.row].name!))"
        var timeStamp = ""
        if let date = date, let time = time{
            timeStamp = "Due date: \(date) at \(time)"
        }else if let date = date{
            timeStamp = "Due date: \(date)"
        }else if let time = time{
            timeStamp = "Due time: \(time)"
        }
        cell.detailTextLabel?.text = timeStamp
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = self.tasks[indexPath.row]
            self.context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
