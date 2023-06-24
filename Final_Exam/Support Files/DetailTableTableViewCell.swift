//
//  DetailTableTableViewCell.swift
//  Final_Exam
//
//  Created by APPLE on 03/03/23.
//

import UIKit

class DetailTableTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var t1Img: UIImageView!
    @IBOutlet weak var t2Img: UIImageView!
    
    @IBOutlet weak var matchType: UILabel!
    
    @IBOutlet weak var t1Name: UILabel!
    @IBOutlet weak var t1Score: UILabel!
    @IBOutlet weak var t1Overs: UILabel!
    
    @IBOutlet weak var t2Name: UILabel!
    @IBOutlet weak var t2Score: UILabel!
    @IBOutlet weak var t2Overs: UILabel!
    
    @IBOutlet weak var MatchDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
