//
//  MasterTableViewCell.swift
//  XibDemo
//
//  Created by AnhTT on 10/16/19.
//  Copyright © 2019 AnhTT. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelEmployeeName: UILabel!
    @IBOutlet weak var labelEnd: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var labelStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
