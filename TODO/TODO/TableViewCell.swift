//
//  TableViewCell.swift
//  TODO
//
//  Created by esirem on 28/11/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

    @IBAction func CheckMark(_ sender: Any) {   }
    @IBOutlet weak var LabelTitle: UILabel!
    @IBOutlet weak var label_description: UILabel!
    
}
