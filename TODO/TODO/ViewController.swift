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
        
        
        
        cell.buttonClickedHandler = { [weak self] in
            // Handle the button click in your view controller
            if tableView.indexPath(for: cell) != nil {
                // Do something with indexPath or perform any action needed
                self!.data[indexPath.row].done = !self!.data[indexPath.row].done;
                
                var tickImage = UIImage();
                if(self!.data[indexPath.row].done == true){
                    tickImage = UIImage(systemName: "checkmark.circle.fill")! // Replace "checkmark.circle.fill" with the desired highlighted system image name
                }
                else {
                    tickImage = UIImage(systemName: "checkmark.circle")! // Replace "checkmark.circle.fill" with the desired highlighted system image name
                }
               
                cell.Button.setImage(tickImage, for: .normal)
                
              
            }
        }
        
      
        
        return cell;
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let encodedData = UserDefaults.standard.data(forKey: "TodoDatas") {
            
            do {
                let decodedData = try JSONDecoder().decode([Todo].self, from: encodedData)
                data = decodedData
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
    }

    
    
    @IBOutlet weak var tableview: UITableView!
   
    var data:[Todo] = []
 
   
}

