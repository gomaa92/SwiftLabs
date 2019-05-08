//
//  ViewController.swift
//  MovieTableView
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var titleTF: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var genreTF: UITextView!
    @IBOutlet var yearTF: UILabel!
    @IBOutlet var ratingTF: UILabel!
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTF.text = movie.title;
        ratingTF.text = String(movie.rating);
        yearTF.text = String(movie.releaseDate);
        genreTF.text="";
        for x in 0..<(movie.genre?.count)!{
            genreTF.text.append((movie.genre?[x])!);
            genreTF.text.append("\n");
        }
       
        imageView.image = UIImage(named : movie.image+".jpg");
    }
    
    func setMovie( mov : Movie ){
        movie = mov;
    }


}

