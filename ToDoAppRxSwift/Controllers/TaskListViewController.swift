//
//  TaskListViewController.swift
//  ToDoAppRxSwift
//
//  Created by BoMin on 2023/03/07.
//

import UIKit
import RxSwift

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
              let addTVC = navC.viewControllers.first as? AddTaskViewController else {
            fatalError("Controller not found")
        }
        
        addTVC.taskSubjectObservable
            .subscribe(onNext: { task in
                
                print(task)
                
            }).disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.prioritySegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
    }
    
}
