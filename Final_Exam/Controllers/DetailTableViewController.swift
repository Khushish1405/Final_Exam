//
//  DetailTableViewController.swift
//  Final_Exam
//
//  Created by APPLE on 03/03/23.
//

import UIKit

class DetailTableViewController: UIViewController {
    
    var scoredata: ScoreModel?
    

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }

}

extension DetailTableViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableTableViewCell", for: indexPath) as! DetailTableTableViewCell
        cell.t1Name.text = scoredata?.data[0].t1
        cell.t2Name.text = scoredata?.data[0].t2
        cell.t1Score.text = scoredata?.data[0].t1s
        cell.t2Score.text = scoredata?.data[0].t2s
        return cell
    }
    
}
