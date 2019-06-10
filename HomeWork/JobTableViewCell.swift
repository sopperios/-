//
//  JobTableViewCell.swift
//  HomeWork
//
//  Created by Mint Yang on 2019/6/10.
//  Copyright © 2019 Mint Yang. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol JobTableViewCellProtocol: NSObjectProtocol {
    func onTouchCell(url:String)
}

class JobTableViewCell: UITableViewCell {
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var title: UILabel!
    var url:String!
    weak var delegate: JobTableViewCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let ges = UITapGestureRecognizer.init(target: self, action: #selector(self.onTouchCell))
        self.addGestureRecognizer(ges)
    }
    
    func setCell(data:JSON, row:Int){
        self.number.text = data[row]["期數"].string
        self.summary.text = data[row]["中文摘要"].string
        self.title.text = data[row]["標題"].string
        self.url = data[row]["網址"].string!
    }
    
    @objc func onTouchCell(){
        delegate?.onTouchCell(url: self.url)
    }
    
}
