//
//  ViewController.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(data.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataCell = data[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID") as! TableViewCell;
        cell.LabelTitle.text = dataCell.title;
        cell.label_description.text = dataCell.description;
        
        
        
        cell.buttonClickedHandler = { [weak self] in //
            // Handle the button click in your view controller
            if tableView.indexPath(for: cell) != nil {
              
        }
        }
        cell.buttonDeleteHandler = { [weak self] in //
            if tableView.indexPath(for: cell) != nil {
                self?.data.remove(at: indexPath.row);
                self?.tableview.deleteRows(at: [indexPath], with: .fade);
        }
        }
        
        return cell;
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loading data
        if let encodedData = UserDefaults.standard.data(forKey: "TodoDatas") {
            
            do {
                let decodedData = try JSONDecoder().decode([Todo].self, from: encodedData)
                data = decodedData
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        //sorting datas
        data.sort (by: { (data1, data2) -> Bool in
             data1.date < data2.date
        })
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
    }

    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DataTransfer"){ // load index path to edit View Controller
            let  destinationViewController = segue.destination as? EditSingularViewController;
            destinationViewController?.indexCell = tableview.indexPath(for: sender as! TableViewCell)!
            
        }
    }
   
    var data:[Todo] = []
 
   
}

