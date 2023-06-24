import UIKit

class HomeSecondTableViewCell: UITableViewCell {
    
    var score: ScoreModel?
    var recentArr = [Score]()
    var liveArr = [Score]()
    var upcomingArr = [Score]()
    var ResultArr = [Score]()
    var selectedArr : [Score] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeSecondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return score?.data.count ?? 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.team1Name.text = score?.data[indexPath.row].t1
        cell.team1Name.text = score?.data[indexPath.row].t2

//        cell.team1Score.text = score?.data[indexPath.row].t1s
//        cell.team2Score.text = score?.data[indexPath.row].t2s
        
        
//        cell.SaveButton.tag = indexPath.row
//        cell.SaveButton.addTarget(self, action: #selector(AlertSelectre), for: .touchUpInside)

        let url1 = URL(string: score?.data[indexPath.row].t1img ?? "https://g.cricapi.com/img/teams/6-637877070670541994.webp")
        cell.team1Image.downloadImage(from: url1!)
        let url2 = URL(string: score?.data[indexPath.row].t2img ?? "https://g.cricapi.com/img/teams/6-637877070670541994.webp")
        cell.team2Image.downloadImage(from: url2!)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedArr = [liveArr[indexPath.row]]
        
    }
    

    @objc func AlertSelectre(_ sender: UIButton) {
        print(sender.tag)
        
//        let alert = UIAlertController(title: "Save Data", message: "", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "", style: .default) { (action) in
//
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
//        present(alert, animated: true, completion: nil)
    }
}
