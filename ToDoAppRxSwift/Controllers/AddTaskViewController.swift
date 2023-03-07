//
//  AddTaskViewController.swift
//  ToDoAppRxSwift
//
//  Created by BoMin on 2023/03/07.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveTask() {
        
        guard let priority = Priority(rawValue:self.prioritySegControl.selectedSegmentIndex),
              let title = self.textField.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
        
    }
    
}
