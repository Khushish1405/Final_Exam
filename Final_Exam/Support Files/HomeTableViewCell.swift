
import UIKit

class HomeTableViewCell: UITableViewCell {


    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var matchTypeLabel: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team1Overs: UILabel!
    @IBOutlet weak var team2Overs: UILabel!
    @IBOutlet weak var matchSituationLabel: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
//    @IBAction func SavePressed(_ sender: UIButton) {
//
//        print("Button Pressed....")
//    }
}
