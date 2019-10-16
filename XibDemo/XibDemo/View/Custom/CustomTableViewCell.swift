//
//  CustomTableViewCell.swift
//  XibDemo
//
//  Created by Cuong on 10/16/19.
//  Copyright © 2019 AnhTT. All rights reserved.
//

import UIKit

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var printButton: UIButton! {
        didSet {
            disPlayLabel.text = textField == nil ? "" : textField.text
            printButton.addTarget(self, action: #selector(CustomTableViewCell.printTarget), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var disPlayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func printTarget() {
        disPlayLabel.text = textField == nil ? "" : textField.text
    }
}
