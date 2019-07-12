//
//  Random.swift
//  Be childish
//
//  Created by GWC on 7/9/19.
//  Copyright © 2019 Sue. All rights reserved.
//

import UIKit

class Random: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    let list = ["Frozen", "Zootopia", "Big Hero 6", "Incredibles", "Up"]
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomItem()

        // Do any additional setup after loading the view.
    }
    func getRandomItem(){
        guard let item = list.randomElement() else {return}
        movieImage.image = UIImage(named: item)
    }

    @IBAction func Button(_ sender: Any) {
        getRandomItem()
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
