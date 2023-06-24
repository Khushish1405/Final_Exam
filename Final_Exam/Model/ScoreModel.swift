import Foundation


struct ScoreModel: Codable{
    var apikey: String
    var data: [Score]
}

struct Score: Codable{
    var id: String
    var dateTimeGMT: String
    var matchType: String
    var status: String
    var ms: String
    var t1: String
    var t2: String
    var t1s: String
    var t2s: String
    var t1img: String?
    var t2img: String?

}



//struct ScoreData: Decodable {
//    let data: [ScoreModel]
//}
//
//struct ScoreModel: Decodable {
//
//    let id: String?
//    let dateTimeGMT: String?
//    let matchType: String?
//    let status: String?
//    let ms: String?
//    let t1: String?
//    let t2: String?
//    let t1s: String?
//    let t2s: String?
//    let t1img: String?
//    let t2img: String?
//
//}
