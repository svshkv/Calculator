//
//  ViewController.swift
//  Calculator
//
//  Created by Саша Руцман on 28.08.2019.
//  Copyright © 2019 Саша Руцман. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalSystemButton: UIButton!
    @IBOutlet weak var resultSystemButton: UIButton!
    @IBOutlet weak var changeSystemsButton: UIButton!
    @IBOutlet weak var originalSystemTextField: UITextField!
    @IBOutlet weak var resultSystemTextfield: UITextField!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var calculateButton: UIButton!
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        
        historyTableView.tableFooterView = UIView()
        historyTableView.dataSource = self
        historyTableView.delegate = self
        
    }

    @IBAction func changeSystemButtonPressed(_ sender: Any) {
        viewModel?.exchangeSystems(originalButton: originalSystemButton, resultButton: resultSystemButton)
    }
    
    @IBAction func originalSystemButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func resultSystemButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {

        guard let viewModel = viewModel else { return }
        viewModel.calculateResult(originalSystemTextField: originalSystemTextField)
        resultSystemTextfield.text = viewModel.resultSystem
        
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "fromOriginal" {
            if let vc = segue.destination as? SystemsTableViewController {
                guard let viewModel = viewModel else { return }
                vc.viewModel = viewModel.systemsTableViewViewModel()
                vc.viewModel!.setButton(id: 0)
            }
        } else if identifier == "fromResult" {
            if let vc = segue.destination as? SystemsTableViewController {
                guard let viewModel = viewModel else { return }
                vc.viewModel = viewModel.systemsTableViewViewModel()
                vc.viewModel!.setButton(id: 1)
            }
        }
    }
}

