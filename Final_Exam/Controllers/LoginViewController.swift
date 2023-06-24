import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 100/255.0, blue: 150/100, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 180/255.0, blue: 255.0/200.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    @IBAction func LearnBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToWeb", sender: self)
    }
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        if let email = userName.text, let password = password.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    UserDefaults.standard.set(email, forKey: "email")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "email") != nil{
            performSegue(withIdentifier: "goToHome", sender: self)
        }
        
    }
}

