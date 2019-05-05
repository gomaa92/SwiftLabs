//
//  ViewController.swift
//  EmployeeInheritance
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func employeeBtn(_ sender: UIButton) {
        let emp = Employee()
        
        if let intSal = Int(salaryTF.text!){
       
            salaryLabel.text = String(emp.getSalary(salary: intSal))
        }
        else{
            salaryLabel.text = "enter valid salary "
            
        }
        
    }
    @IBAction func managerBtn(_ sender: UIButton) {
        let mang = Manager()
        
        if let intSal = Int(salaryTF.text!) {
        salaryLabel.text = String(mang.getSalary(salary: intSal))
        }
        else{
            salaryLabel.text = "enter valid salary"

        }
    }
    @IBOutlet var salaryTF: UITextField!
    @IBOutlet var salaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

