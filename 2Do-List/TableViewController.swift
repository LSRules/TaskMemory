//
//  TableViewController.swift
//  2Do-List
//
//  Created by Liam on 10/01/2018.
//  Copyright © 2018 Liam. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ToDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ToDos = createToDos()
        
    }

    func createToDos() -> [ToDo] {
        
        let Course = ToDo()
        Course.name = "Swift Programming Course"
        Course.important = true
        
        let Book = ToDo()
        Book.name = "Read Kevin Mitnick's book"
        
        let Food = ToDo()
        Food.name = "To eat mum's food"
        Food.important = true

        return [Course, Book, Food]
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskLists", for: indexPath)
        let toDo = ToDos[indexPath.row]

        if toDo.important {
            cell.textLabel?.text = "❢ " + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = ToDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? creatingTask {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? TaskCompleteVC {

            if let toDo  = sender as? ToDo {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
            }
            

        }
        
    }

}
