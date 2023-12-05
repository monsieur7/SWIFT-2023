//
//  AddTodoViewController.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import UIKit

class AddTodoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//https://manasaprema04.medium.com/different-ways-to-pass-data-between-viewcontrollers-views-8b7095e9b1bf
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func DoneButton(_ sender: UIButton) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowTodo"){
            let mainViewController = segue.destination as? ViewController;
            let dataToAdd = Todo(title: TitleOutlet.text ?? "" , description: "", type: TodoType.DEVOIRS, dueDate: DueDate.date, date: Date());
            mainViewController?.data.append(dataToAdd);
        }
    
    }
    @IBOutlet weak var TitleOutlet: UITextField!
    
    @IBOutlet weak var DueDate: UIDatePicker!
}
