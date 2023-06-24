w

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        webView.navigationDelegate = self
        webView = WKWebView()
        self.view = webView
        
        if let url = URL(string: "https://www.pacificglobalsolutions.com/about-us.html"){
            print(url)
            let request = URLRequest(url: url)
            webView.load(request)

        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        
        if webView.canGoBack == true {
            webView.goBack()
        }
        else{
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
