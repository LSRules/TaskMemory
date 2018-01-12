//
//  TaskCompleteVC.swift
//  2Do-List
//
//  Created by Liam on 12/01/2018.
//  Copyright © 2018 Liam. All rights reserved.
//

import UIKit

class TaskCompleteVC: UIViewController {
    
    var previousVC = TableViewController()
    var selectedToDo = ToDo()

    @IBOutlet weak var taskName: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       taskName.text = selectedToDo.name
        if selectedToDo.important{
           taskName.text = "❢ " + selectedToDo.name
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func completeButton(_ sender: Any) {
        var index = 0
        for ToDo in previousVC.ToDos {
            if ToDo.name == selectedToDo.name{
                previousVC.ToDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
