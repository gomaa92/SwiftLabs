//
//  AddViewController.swift
//  MovieTableView
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleTF: UITextField!
    @IBOutlet var ratingTF: UITextField!
    
    
    @IBOutlet var yearTF: UITextField!
    @IBOutlet var imageTF: UITextField!
    @IBOutlet var genreTF: UITextField!
    var movie = Movie()
    var addMovie : addMovie!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addBtn(_ sender: UIButton) {
        movie.title=titleTF.text!
        movie.image=imageTF.text!
        movie.releaseDate=Int(yearTF.text!)!
        movie.rating=Float(ratingTF.text!)!
        movie.genre = [genreTF.text!]
        addMovie.addMoview(movie: movie)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
