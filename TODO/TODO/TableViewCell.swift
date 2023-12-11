//
//  TableViewCell.swift
//  TODO
//
//  Created by esirem on 28/11/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    var buttonClickedHandler: (() -> Void)? // closure
    var buttonDeleteHandler:  (() -> Void)? // closure
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBOutlet weak var LabelTitle: UILabel!
    @IBOutlet weak var label_description: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    @IBAction func DeleteButton(_ sender: UIButton) {
        buttonDeleteHandler?()
    }
    
    @IBAction func ButtonPlus(_ sender: Any) {
        buttonClickedHandler?()
    }
}
