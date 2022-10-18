//
//  ViewController.swift
//  SepiaTask
//
//  Created by Rushang Prajapati on 18/10/22.
//

import UIKit

class PetsListingViewController: UIViewController {

    @IBOutlet weak var petsTableview: UITableView!
    lazy var petsVM: PetsViewModel = {
            return PetsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPetsData()
        // Do any additional setup after loading the view.
    }

}

extension PetsListingViewController{
    
    func getPetsData(){
        self.title = "Pets"
        petsVM.getPetsData()
        self.petsTableview.reloadData()
    }
    
}

extension PetsListingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petsVM.arrPets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTableViewCell") as? PetsTableViewCell
        let dict: [String: Any] = petsVM.arrPets[indexPath.row] as! [String : Any]
        cell!.setupData(arrDict: dict)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let dict: [String: Any] = petsVM.arrPets[indexPath.row] as! [String : Any]
        let vc = PetsDetailViewController.instanceFromStoryboard(contentURL: dict["content_url"] as! String)
        self.navigationController?.pushViewController(vc!, animated: true)

    }
}

