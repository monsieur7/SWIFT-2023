//
//  CategoryCell.swift
//  TODO
//
//  Created by Nolane Delille on 13/12/2023.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var Title: UILabel!
}
