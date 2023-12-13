//
//  ViewController.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.filter { $0.sectionNumber == section }.count // return how many Todos are in a section

        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.HeaderTitle[section];
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.HeaderTitle.count;
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
                print(indexPath.row);
                self?.data.remove(at: indexPath.row);
                self?.tableview.deleteRows(at: [indexPath], with: .fade);
                self?.saveDatas();
        }
        }
        
        if(dataCell.type != self.categorySelected){
            cell.isHidden = true;
        }
        if !filteredItems.contains(dataCell) { // not in filtered Items list : hid the cell !
                cell.isHidden = true
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

    

    func saveDatas(){
        
        do {
            let encodedData = try JSONEncoder().encode(data)
            UserDefaults.standard.set(encodedData, forKey: "TodoDatas"); //save data to database
        } catch {
            print("Error encoding data: \(error)")
        }
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
       
        addSectionData();
        data.sort { (todo1, todo2) -> Bool in
            if todo1.sectionNumber != todo2.sectionNumber {
                return todo1.sectionNumber < todo2.sectionNumber
            } else {
                return todo1.dueDate < todo2.dueDate
            }
        }
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
    var filteredItems:[Todo] = [];
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = data.filter { $0.title.lowercased().contains(searchText.lowercased()) };
        self.tableview.reloadData();
        }
    
    func tableView_search(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }

    func tableView_search(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        let item = filteredItems[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
   
    var data:[Todo] = [];
    var HeaderTitle:[String] = ["Today","Tomorrow","This Week","Others"];
    var categorySelected:TodoType = TodoType.DEVOIRS;
    func addSectionData(){
        for d in data {
            print(d.dueDate);
            if(Calendar.current.isDateInToday(d.dueDate)){
                d.sectionNumber = 0;
            }
            else if(Calendar.current.isDateInTomorrow(d.dueDate)){
                d.sectionNumber = 1;
            
            } else if Calendar.current.isDate(d.dueDate, equalTo: Date(), toGranularity: .weekOfYear) { // if d is in the same week as today 
                   d.sectionNumber = 2
            }
            else{
                d.sectionNumber = 3;
            }
            
        }
    }
    

}

