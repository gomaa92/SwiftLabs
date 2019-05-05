//
//  TableViewController.swift
//  MovieTableView
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , addMovie {
    func addMoview(movie: Movie) {
        movies.append(movie)
        self.tableView.reloadData()
    }
    
    var movies : [Movie]!;
    var viewController : ViewController!;
    var addView = AddViewController()
    @IBAction func addView(_ sender: UIBarButtonItem) {
        addView = self.storyboard?.instantiateViewController(withIdentifier: "addViewId") as! AddViewController
        addView.addMovie=self
        self.navigationController?.pushViewController(addView, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let m1 = Movie();
        m1.title = "Dawn of the Planet of the Apes"
        m1.rating = 8.3
        m1.releaseDate = 2014
        m1.genre = ["Action", "Drama", "Sci-Fi"]
        m1.image = "1"
        
        let m2 = Movie()
        m2.title = "District 9"
        m2.rating = 8;
        m2.releaseDate = 2009
        m2.genre = ["Action", "Sci-Fi", "Thriller"]
        m2.image = "2"
        
        let m3 = Movie()
        m3.title = "Transformers: Age of Extinction"
        m3.rating = 6.3
        m3.releaseDate = 2014
        m3.genre = ["Action", "Adventure", "Sci-Fi"]
        m3.image = "3"
        
        let m4 = Movie()
        m4.title = "The Machinist"
        m4.rating = 7.8
        m4.releaseDate = 2004
        m4.genre = ["Drama", "Thriller"]
        m4.image = "4"
        
        let m5 = Movie();
        m5.title = "The Last Samurai"
        m5.rating = 7.7
        m5.releaseDate = 2003
        m5.genre = ["Action", "Drama", "History"]
        m5.image = "5"
        
        movies = [m1,m2,m3,m4,m5];
        
        viewController = ViewController();
       
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = movies[indexPath.row].title;
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? ViewController;
        
        viewController.setMovie(mov: movies[(self.tableView.indexPathForSelectedRow?.row)!]);
    }

   

}
