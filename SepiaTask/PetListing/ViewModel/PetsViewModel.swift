//
//  PetsViewModel.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit

class PetsViewModel: NSObject {
    
    var arrPets: [Any] = [Any]()
    
    func getPetsData() {
        if let path = Bundle.main.path(forResource: "pets_list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let pets = jsonResult["pets"] as? [Any] {
                    // do stuff
                    arrPets = pets
                }
            } catch {
                // handle error
            }
        }
    }
    
    
}



extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {
                (response: URLResponse?, data: Data?, error: Error?) -> Void in
                if let imageData = data as Data? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
extension UIStoryboard {
    @objc static var main: UIStoryboard {
        get {
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}
