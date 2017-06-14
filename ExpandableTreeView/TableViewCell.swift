//
//  TableViewCell.swift
//  ExpandableTreeView
//
//  Created by Pratyush Pratik on 14/06/17.
//  Copyright © 2017 Pratyush Pratik. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var additionButtonActionBlock : ((TableViewCell) -> Void)?;
    
    func setup(withTitle title: String, level : Int, additionalButtonHidden: Bool) {
        lbl.text = title
        
        let backgroundColor: UIColor
        if level == 0 {
            backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if level == 1 {
            backgroundColor = UIColor(red: 209.0/255.0, green: 238.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        } else {
            backgroundColor = UIColor(red: 224.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        }
        
        self.backgroundColor = backgroundColor
        self.contentView.backgroundColor = backgroundColor
        
        let left = 11.0 + 20.0 * CGFloat(level)
        self.lbl.frame.origin.x = left
    }
    
}
