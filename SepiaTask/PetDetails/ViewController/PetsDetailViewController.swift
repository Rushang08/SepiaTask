//
//  PetsDetailViewController.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit
import WebKit


class PetsDetailViewController: UIViewController {

    var contentURL:String = ""
    @IBOutlet weak var webview: WKWebView!
    
    class func instanceFromStoryboard(contentURL:String) -> PetsDetailViewController? {
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "PetsDetailViewController") as? PetsDetailViewController
        vc?.contentURL = contentURL
        return vc
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.load(URLRequest(url: URL(string:contentURL)!))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
