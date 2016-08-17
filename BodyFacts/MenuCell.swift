//
//  MenuCell.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!

    @IBOutlet weak var cellButton: UIButton!
    
    @IBOutlet weak var bodyButton: UIButton!
  
    @IBOutlet weak var bodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
 
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
