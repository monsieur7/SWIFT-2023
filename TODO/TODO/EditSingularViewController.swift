//
//  EditSingularViewController.swift
//  TODO
//
//  Created by Adrien Roy on 11/12/2023.
//

import UIKit

class EditSingularViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let index = indexCell.row;
        //loading data
        if let encodedData = UserDefaults.standard.data(forKey: "TodoDatas") {
            
            do {
                let decodedData = try JSONDecoder().decode([Todo].self, from: encodedData)
                data = decodedData
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        let cell = data[index];
        DescriptionEdit.text = cell.description;
        TitleEdit.text = cell.title;
        DatePicker.date = cell.date;
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = data[self.indexCell.row];
        cell.description = DescriptionEdit.text ?? "";
        cell.title = TitleEdit.text ?? "" ;
        cell.date = DatePicker.date ;
        
        if(segue.identifier == "DataChanged"){ // load index path to edit View Controller
            do {
                let encodedData = try JSONEncoder().encode(data)
                UserDefaults.standard.set(encodedData, forKey: "TodoDatas"); //save data to database
            } catch {
                print("Error encoding data: \(error)")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   
    @IBOutlet weak var DescriptionEdit: UITextField!
    @IBOutlet weak var TitleEdit: UITextField!
    @IBAction func checkmark(_ sender: Any) {
    }
    
    
    @IBAction func confirm_change(_ sender: Any) {
    }
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    var indexCell : IndexPath = [];
    var data : [Todo] = [];
}
