//
//  MatchDetailViewController.swift
//  Final_Exam
//
//  Created by APPLE on 03/03/23.
//

import UIKit

class MatchDetailViewController: UIViewController {
    
    var currentIndex = 0
//    var dataDictionary:[String:String] = [:]
    var dataSCore: [Score] = []

    @IBOutlet weak var t1ImageL: UIImageView!
    @IBOutlet weak var t2ImageL: UIImageView!
    
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    
    @IBOutlet weak var matchDiscription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        team1Name.text = dataSCore[0].t1
        team2Name.text = dataSCore[0].t2
        team1Score.text = dataSCore[0].t1s
        team2Score.text = dataSCore[0].t2s
        matchDiscription.text = dataSCore[0].status
        if let img1URL = URL(string: (dataSCore[0].t1img)!), let img2URL = URL(string: (dataSCore[0].t2img)!) {
                    t1ImageL.downloadImage(from: img1URL)
                    t2ImageL.downloadImage(from: img2URL)
                }
        
//        if let img1URL = URL(string: "https://g.cricapi.com/img/teams/579-637869397212602812.webp"), let img2URL = URL(string: "https://g.cricapi.com/img/teams/586-637871097716183997.webp") {
//                    t1ImageL.downloadImage(from: img1URL)
//                    t2ImageL.downloadImage(from: img2URL)
//                }
        
    
        print(currentIndex)
        print(dataSCore[0].t1)
        
        
//        team1Name.text = dataDictionary["t1"]
//        team2Name.text = dataDictionary["t2"]
//        team1Score.text = dataDictionary["t1Score"]
//        team2Score.text = dataDictionary["t2Score"]
//        matchDiscription.text = dataDictionary["status"]
//        if let img1URL = URL(string: dataDictionary["t1Img"]!), let img2URL = URL(string: dataDictionary["t2Img"]!) {
//            t1ImageL.downloadImage(from: img1URL)
//            t2ImageL.downloadImage(from: img2URL)
//        }
    }
    

}

//extension UIImageView{
//    func downloadImage(from url: URL){
//        contentMode = .scaleToFill
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, error == nil{
//                let image = UIImage(data: data)
//                DispatchQueue.main.async{
//                    self.image = image
//                }
//            }else{
//                return
//            }
//
//        }
//        task.resume()
//    }
//}
