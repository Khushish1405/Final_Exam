//
//  SecondHomeViewController.swift
//  Final_Exam
//
//  Created by APPLE on 03/03/23.
//

import UIKit
import CoreData

class SecondHomeViewController: UIViewController {
    
    var savedMatchesArr:[Cricket] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var scoredata: ScoreModel?

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        loadCric()
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cricket")
//                //request.predicate = NSPredicate(format: "age = %@", "21")
//        request.returnsObjectsAsFaults = false
//        do {
//                    let result = try context.fetch(request)
//                    for data in result as! [NSManagedObject]
//        {
//            print(data.value(forKey: "team1Name") as! String)
//                        data.value(forKey: "team1Name") as! String
//                        data.value(forKey: "team2Name") as! String
//                        data.value(forKey: "team1Score") as! String
//                        data.value(forKey: "team2Score") as! String
//                        self.cric.append(data.value(forKey: "team1Name") as! String)
//                        self.cric.append(data.value(forKey: "team2Name") as! String)
//                        self.cric.append(data.value(forKey: "team1Score") as! String)
//                        self.cric.append(data.value(forKey: "team2Score") as! String)
//                        print(cric.count)
//          }
//
//               } catch {
//
//                   print("Failed")
//        }

        Cricdata()
        tableView.reloadData()
        
    }
    
    
    func Cricdata() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cricket")
        
        do {
            let result = try context.fetch(fetchRequest)
            savedMatchesArr = result as! [Cricket]
            for data in savedMatchesArr {
                print(data.value(forKey: "team1Name"))
                data.value(forKey: "team1Name")
                data.value(forKey: "team2Name")
                data.value(forKey: "team1Score")
                data.value(forKey: "team1Score")
                
            }
            
            
        } catch let e as NSError {
            print(e)
        }
    }
    
//    func loadCric() {
//
//        let request : NSFetchRequest<Cricket> = Cricket.fetchRequest()
//
//        do{
//            Score = try context.fetch(request)
//        } catch {
//            print("Error loading names \(error)")
//        }
//
//        tableView.reloadData()
//    }
}



extension SecondHomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedMatchesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondHomeTableViewCell", for: indexPath) as! SecondHomeTableViewCell
        cell.textLabel?.text = "Hello"
//        cell.t1Name.text = savedMatchesArr[indexPath.row].team1Name
//        cell.t2Name.text = savedMatchesArr[indexPath.row].team2Name
//        cell.t1Score.text = savedMatchesArr[indexPath.row].team1Score
//        cell.t2Score.text = savedMatchesArr[indexPath.row].team2Score
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let commit = savedMatchesArr[indexPath.row]
        context.delete(commit)
        savedMatchesArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        do {
            try context.save()
            let alert = UIAlertController(title: "data Deleted", message: "will be updated in table soon", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
//            savedMatchesTable.reloadData()
        } catch let e as NSError {
            print(e)
        }
    }
    
}
