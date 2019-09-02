//
//  SystemsTableViewController.swift
//  Calculator
//
//  Created by Саша Руцман on 29.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import UIKit

class SystemsTableViewController: UITableViewController {

    var viewModel: SystemsTableViewViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel?.numberOfRows() ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "systemCell", for: indexPath)

        cell.textLabel?.text = viewModel?.cellForSystemsTableView(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        
        performSegue(withIdentifier: "unwindSegueToVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }
        if identifier == "unwindSegueToVC" {
            if let vc = segue.destination as? ViewController {
                if viewModel.getButton() == 0 {
                    vc.originalSystemButton.setTitle(viewModel.getSystem(), for: .normal)
                } else if viewModel.getButton() == 1 {
                    vc.resultSystemButton.setTitle(viewModel.getSystem(), for: .normal)
                }
            }
        }
    }
    


}
