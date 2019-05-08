//
//  ViewController.swift
//  MovieTableView
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Gomaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var gereTF: UITextView!
    var movie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.title;
        rateLabel.text = String(movie.rating);
        imageLabel.text = movie.image;
        yearLabel.text = String(movie.releaseDate);

        gereTF.text="";
        for x in 0..<(movie.genre?.count)!{
            gereTF.text.append((movie.genre?[x])!);
            gereTF.text.append("\n");
        }
       
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setMovie( mov : Movie ){
        movie = mov;
    }

}

