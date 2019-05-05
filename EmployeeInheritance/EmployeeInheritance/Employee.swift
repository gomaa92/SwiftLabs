//
//  Employee.swift
//  EmployeeInheritance
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
class Employee:  Person {

    override func getSalary(salary :Int) -> Int {
        return salary * Int(5)
    }
}
