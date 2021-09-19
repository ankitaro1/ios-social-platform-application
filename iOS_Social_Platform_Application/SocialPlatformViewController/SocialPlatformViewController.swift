//
//  SocialPlatformViewController.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 18/09/21.
//

import UIKit

class SocialPlatformViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SocialPlatformFlowDelegate {

    @IBOutlet var socialTableView: UITableView?
    
    var vehicle: SocialVehicleUIModel?
    var mediaList: [SocialMediaUIModel] = []
    var offerList: [SocialOfferUIModel] = []
    
    var viewModel: SocialPlatformViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SocialPlatformViewModel(delegate: self)
        self.viewModel?.performSocialPlatformAction()
        self.socialTableView?.delegate = self
        self.socialTableView?.dataSource = self
        self.socialTableView?.register(UINib(nibName: "SocialVehicleCell", bundle: .main), forCellReuseIdentifier: "SocialVehicleCell")
        self.socialTableView?.register(UINib(nibName: "SocialMediaCell", bundle: .main), forCellReuseIdentifier: "SocialMediaCell")
        self.socialTableView?.register(UINib(nibName: "SocialHeaderCell", bundle: .main), forCellReuseIdentifier: "SocialHeaderCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: SocialHeaderCell = tableView.dequeueReusableCell(withIdentifier: "SocialHeaderCell") as? SocialHeaderCell ?? SocialHeaderCell()
        if  section == 0 {
            cell.titleLabel?.text = ""
        } else if section == 1 {
            cell.titleLabel?.text = "Social Media"
        } else {
            cell.titleLabel?.text = "Offers"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: SocialVehicleCell = tableView.dequeueReusableCell(withIdentifier: "SocialVehicleCell", for: indexPath) as? SocialVehicleCell ?? SocialVehicleCell()
            cell.data = self.vehicle
            cell.setData()
            return cell
        } else if indexPath.section == 1 {
            let cell: SocialMediaCell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaCell", for: indexPath) as? SocialMediaCell ?? SocialMediaCell()
            cell.setData(mediaList: self.mediaList, type: CellType.media)
            cell.socialCollectionView?.reloadData()
            return cell
        } else {
            let cell: SocialMediaCell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaCell", for: indexPath) as? SocialMediaCell ?? SocialMediaCell()
            cell.setData(offerList: self.offerList, type: CellType.offer)
            cell.socialCollectionView?.reloadData()
            return cell
        }
    }
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(150)
        } else if indexPath.section == 1 {
            return CGFloat(220)
        } else {
            return CGFloat(200)
        }
    }
    
    func socialPlatformSuccess(data: SocialPlatformUIModel) {
        self.vehicle = data.vehicle
        self.mediaList = data.mediaList
        self.offerList = data.offerList
        self.socialTableView?.reloadData()
    }
    
    func socialPlatformFailed(message: String) {
        print(message, "762873648723687462378467823684732")
    }
    

}
