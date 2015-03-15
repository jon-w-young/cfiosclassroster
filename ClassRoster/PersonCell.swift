//
//  PersonCell.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 3/10/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
