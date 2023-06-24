

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var matchTypeLabel: UILabel!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team1Overs: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team2Overs: UILabel!
    @IBOutlet weak var matchSituationLabel: UILabel!
    
    @IBOutlet var SaveButton: UIButton!
    //    var names: [NameData] = []
    //
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func SaveBtnPressed(_ sender: UIButton) {
        
//        let alert = UIAlertController(title: "Add New Data", message: "", preferredStyle: .alert)
//        
//        let action = UIAlertAction(title: "Add", style: .default) { (action) in
//            
////            let newName = NameData(context: self.context)
////            newName.name = textField.text!
////
////            self.names.append(newName)
////
////            self.saveName()
//            
//        }
//        
//        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
//            print("Cancel")
//        })
//        
//        alert.addAction(cancel)
//        alert.addAction(action)
//        
////        present(HomeViewController)(alert, animated: true, completion: nil)
//        HomeViewController.present(alert,animated: true)
        
        
    }
    
}
