//
//  TableViewController.swift
//  MovieTableView
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
class TableViewController: UITableViewController , addMovie {

    
    var movies : [NSManagedObject]!;
    var viewController : ViewController!;
    var addView = AddViewController()
    @IBAction func addView(_ sender: UIBarButtonItem) {
        addView = self.storyboard?.instantiateViewController(withIdentifier: "addViewId") as! AddViewController
        addView.addMovie=self
        self.navigationController?.pushViewController(addView, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewController = ViewController();
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        
        let managedConetext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do{
            movies = try managedConetext.fetch(fetchRequest)
        }catch{
            print("error")
        }
    }
    func addMoview(movie: Movie) {
        
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        
        let managedConetext = appDeleget.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Movies",in: managedConetext)
        let coreMovie = NSManagedObject(entity: entity!,insertInto: managedConetext)
        coreMovie.setValue(movie.title , forKey: "title")
        coreMovie.setValue(movie.image , forKey: "image")
        coreMovie.setValue(movie.releaseDate , forKey: "year")
        coreMovie.setValue(movie.rating , forKey: "rating")
        coreMovie.setValue(movie.genre , forKey: "genre")
        do{
            try managedConetext.save()
            print("movie saved")
        }catch let error as NSError{
            print(error)
        }
        movies.append(coreMovie)
        self.tableView.reloadData()
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

        cell.textLabel?.text = (movies[indexPath.row].value(forKey: "title") as! String);
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? ViewController;
        
        let myMovie: Movie = Movie()
        myMovie.title = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
        myMovie.image = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
        myMovie.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rating") as! Float
        myMovie.releaseDate = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "year") as! Int
        myMovie.genre = (movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! [String])
        
        viewController.setMovie(mov: myMovie);
    }

   

}
