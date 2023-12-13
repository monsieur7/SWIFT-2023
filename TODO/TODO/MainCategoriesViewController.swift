//
//  MainCategoriesViewController.swift
//  TODO
//
//  Created by Nolane Delille on 13/12/2023.
//

import UIKit

class MainCategoriesViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoType.allCases.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CATEGORY") as! CategoryCell;
        cell.Title.text = TodoType.allCases[indexPath.row].rawValue;
        return cell;
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "CATEGORYSEGUE"){
            let destinationController = segue.destination as! ViewController;
            let cell = sender as! UITableViewCell;
            destinationController.categorySelected =  TodoType.allCases[tableView.indexPath(for: cell)?.row ?? 0];
        }
    }

    @IBOutlet weak var tableView: UITableView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
