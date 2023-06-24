
import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailPhoneLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true

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
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "email") != nil{
            performSegue(withIdentifier: "SignToHome", sender: self)
        }
        
    }
    

    @IBAction func SignUpPressed(_ sender: UIButton) {
        
        if let email = emailPhoneLabel.text, let pass = passwordLabel.text {
            Auth.auth().createUser(withEmail: email, password: pass) {
                authResult, error in
                
                if let e = error {
                    print(e)
                    let alert = UIAlertController(title: "Error", message: "Enter Valid Details", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "ok", style: .default)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                    
                    
                } else {
                    self.performSegue(withIdentifier: "SignToHome", sender: self)
                    UserDefaults.standard.set(email, forKey: "email")
                }
            }
        }
    }
}
