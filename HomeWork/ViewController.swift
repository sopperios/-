//
//  ViewController.swift
//  HomeWork
//
//  Created by Mint Yang on 2019/6/10.
//  Copyright © 2019 Mint Yang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,JobTableViewCellProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var jobData:JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: "JobTableViewCell")
        
        let url = "https://apiservice.mol.gov.tw/OdService/download/A17000000J-020006-2yF"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                let jobData = JSON(json)
                self.jobData = jobData
                jobData.forEach({ (data) in
                    print(data)
                })
                self.tableView.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.jobData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as!JobTableViewCell
        cell.setCell(data: self.jobData!,row:indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func onTouchCell(url: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let webViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        webViewController.setUrl(url: url)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
}

