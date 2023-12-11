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
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
           view.backgroundColor =  colorLiteral(red: 1, green: 0.3653766513, blue: 0.1507387459, alpha: 1)
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
           lbl.text = mobileBrand[section].brandName
           view.addSubview(lbl)
           return view
         }
    */

    //use tableviewDatasource
    
    //func tableView(UITableView, numberOfRowsInSection: Int) -> Int

    

    
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
            let buttonSender = sender as! UIButton;
            let pos = buttonSender.convert(CGPoint.zero, to: self.tableview);
            let indexPath = self.tableview.indexPathForRow(at:pos)
            destinationViewController?.indexCell = indexPath!;
            
        }
    }
   
    var data:[Todo] = []
 
   
}

