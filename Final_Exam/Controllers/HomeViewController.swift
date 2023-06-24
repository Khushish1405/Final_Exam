import UIKit
import CoreData
import Alamofire
import FirebaseAuth

class HomeViewController: UIViewController {
    
    var index: Int?
    
    var recentArr = [Score]()
    var liveArr = [Score]()
    var upcomingArr = [Score]()
    var ResultArr = [Score]()
    var sortedArr = [Score]()
    var selectedArr : [Score] = []
    
    var array: [Cricket] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var scoreData: ScoreModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        navigationItem.hidesBackButton = true
        
        //        sorting array
        liveArr = arrSorted(arr: liveArr)
        for data in liveArr {
            print(data.dateTimeGMT)
        }
    }
    
    //    sorting function
    func arrSorted(arr:[Score]) -> [Score] {
        
        var dataArr:[Score] = []
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        for data in arr{
            let sorted = dateFormatter.date(from: data.dateTimeGMT)
            
            if sorted != nil {
                dataArr.append(data)
            }
        }
        
        var testDecendingArr = dataArr.sorted(by: {  $0.dateTimeGMT.compare($1.dateTimeGMT) == .orderedDescending })
        return testDecendingArr
    }
    
    var apiResult: ScoreModel?
    
    func fetchData() {
            
            let requestDataURL = Bundle.main.url(forResource: "CricketScore", withExtension: "json")
            
            AF.request(requestDataURL!, method: .get, parameters: nil,encoding: URLEncoding.default).response() { [self] response in
                
                switch response.result {
                    
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(ScoreModel.self, from: data!)
                        
                        print("sjdcvaksbdcjkasbdclbsbkadjaljsdvjas djv")
                        
                        //                        self.apiResult = jsonData
                        //                        print(apiResult)
                        
                        self.scoreData = jsonData
                        print("sjdcvaksbdcjkasbdclbsbkadjaljsdvjas djv")
                        print(scoreData)
                        
                        let singleData = scoreData?.data ?? []
                        for i in 0..<singleData.count{
                            if singleData[i].ms == "live"{
                                liveArr.append(singleData[i])
                                recentArr.append((singleData[i]))
                            }
                            else if singleData[i].ms == "fixture"{
                                upcomingArr.append(singleData[i])
                            }
                            else if singleData[i].ms == "result"{
                                recentArr.append(singleData[i])
                            }
                            else{
                                recentArr.append(singleData[i])
                            }
                        }
                        self.tableView.reloadData()
    //                    DispatchQueue.main.async {
    //                        self.tableView.reloadData()
    //                    }
                        
                        
                    } catch {
                        print("Error......\(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
        }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    //Footer OF Section...
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50.0))
        footerView.backgroundColor = .orange
        
        let button = UIButton(frame: footerView.bounds)
        
        if section == 0 {
            button.setTitle("View All Recent Matches", for: .normal)
        } else if section == 1 {
            button.setTitle("View All Live Matches", for: .normal)
        } else if section == 2 {
            button.setTitle("View All Upcoming Matches", for: .normal)
        } else {
            button.setTitle("View All Result Matches", for: .normal)
        }
        
        button.backgroundColor = .red
        
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        footerView.addSubview(button)
        
        return footerView
    }
    
    @objc func buttonAction(sender: UIButton) {
        
        print("Button Pressed..!!")
        
//        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let destVc = StoryBoard.instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
//        if sender.tag == 1 {
//            destVc.scoredata = scoreData
//        }
//        navigationController?.pushViewController(destVc, animated: true)
        
//        performSegue(withIdentifier: "homeToTableDetails", sender: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return liveArr.count >= 6 ? 6 : liveArr.count
        }
        else if section == 1{
            return 1
        }
        else if section == 2{
            return 1
        }
        else{
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Recent matches"
        }
        else if section == 1{
            return "Live Matches"
        }
        else if section == 2{
            return "Upcoming matches"
        }
        else{
            return "Result Matches"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        index = indexPath.row
        selectedArr = [liveArr[indexPath.row]]
        
        performSegue(withIdentifier: "goToDetails", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVc = segue.destination as! MatchDetailViewController
        //        destinationVc.currentIndex = index!
        destinationVc.dataSCore = selectedArr
    }
    
    
    @objc func AlertSelectre(_ sender: UIButton) {
        let indexTapped = sender.tag
        print(indexTapped)
        //        print(sender.tag)
        
        let alert = UIAlertController(title: "Save Data", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Save", style: .default) { [self] (action) in
            
            print("abc")
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Cricket", in: context)
            let newScore = NSManagedObject(entity: entity!, insertInto: context)
            
            newScore.setValue(liveArr[indexTapped].t1, forKey: "team1Name")
            newScore.setValue(liveArr[indexTapped].t2, forKey: "team2Name")
            newScore.setValue(liveArr[indexTapped].t1s, forKey: "team1Score")
            newScore.setValue(liveArr[indexTapped].t2s, forKey: "team2Score")
             
            array.append(newScore as! Cricket)
            
            do {
                try context.save()
                print("sucesss")
            } catch {
                print("Error saving")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            print("Cancel")
        })
        
        alert.addAction(cancel)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if indexPath.row < 6 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
                
                //                print(sortedArr)
                
                
                                let url1 = URL(string: liveArr[indexPath.row].t1img ?? "https://g.cricapi.com/img/teams/6-637877070670541994.webp")
                                cell.team1Image.downloadImage(from: url1!)
                                cell.team1Image.layer.cornerRadius = 50

                                let url2 = URL(string: liveArr[indexPath.row].t2img ?? "https://g.cricapi.com/img/teams/6-637877070670541994.webp")
                                cell.team2Image.downloadImage(from: url2!)
                                cell.team2Image.layer.cornerRadius = 50
                
//                cell.team1Image.downloadImage(from: URL(string: "https://g.cricapi.com/img/teams/579-637869397212602812.webp")!)
//                cell.team2Image.downloadImage(from: URL(string: "https://g.cricapi.com/img/teams/586-637871097716183997.webp")!)
                
                
                //                cell.team1Name.text = liveArr[indexPath.row].t1
                //                cell.team2Name.text = liveArr[indexPath.row].t2
                cell.team1Name.text = scoreData?.data[indexPath.row].t1
                cell.team2Name.text = scoreData?.data[indexPath.row].t2
                //                cell.saveBtn.tag = indexPath.row
                
                //                cell.team1Score.text = liveArr[indexPath.row].t1s
                //                cell.team2Score.text = liveArr[indexPath.row].t2s
                //                cell.team1Score.text = scoreData?.data[indexPath.row].t1s
                //                cell.team2Score.text = scoreData?.data[indexPath.row].t2s
                
                cell.saveBtn.tag = indexPath.row
                cell.saveBtn.addTarget(self, action: #selector(AlertSelectre), for: .touchUpInside)
                
                return cell
            }
        }
        
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableViewCell", for: indexPath) as! HomeSecondTableViewCell
            
            cell.liveArr = liveArr
            cell.score = scoreData
            cell.collectionView.reloadData()
            return cell
            
        }
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableViewCell", for: indexPath) as! HomeSecondTableViewCell
            
            cell.upcomingArr = upcomingArr
            cell.score = scoreData
            cell.collectionView.reloadData()
            return cell
        }
        if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableViewCell", for: indexPath) as! HomeSecondTableViewCell
            
            cell.ResultArr = ResultArr
            cell.score = scoreData
            cell.collectionView.reloadData()
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension UIImageView{
    func downloadImage(from url: URL){
        contentMode = .scaleToFill
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil{
                let image = UIImage(data: data)
                DispatchQueue.main.async{
                    self.image = image
                }
            }else{
                return
            }
            
        }
        task.resume()
    }
}








