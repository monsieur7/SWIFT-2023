//
//  ViewController.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(data.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = data[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID") as! TableViewCell;
        cell.LabelTitle.text = dataCell.title;
        cell.label_description.text = dataCell.description;
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.tableview.dataSource = self;
    }

    
    
    @IBOutlet weak var tableview: UITableView!
    var data:[Todo] = []
    
}

