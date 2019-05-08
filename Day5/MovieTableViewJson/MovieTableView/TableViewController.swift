//
//  TableViewController.swift
//  MovieTableView
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Gomaa. All rights reserved.
//

import UIKit
import CoreData
class TableViewController: UITableViewController {
    var movies : [NSManagedObject]!
    var viewController : ViewController!
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDeleget = UIApplication.shared.delegate as! AppDelegate
        let managedConetext = appDeleget.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do
        {
            movies = try managedConetext.fetch(fetchRequest) // fetch
        }catch{
            print("Error while fetching movies ")
        }
        
        if movies.count == 0
        {
            let appDeleget = UIApplication.shared.delegate as! AppDelegate
            let managedConetext = appDeleget.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Movies",in: managedConetext)
            
            let url  = URL(string: "https://api.androidhive.info/json/movies.json")
            let request = URLRequest(url: url!)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: request){(data , response , error) in
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array <Dictionary<String,Any>>
                    
                    
                    
                    for i in 0..<json.count
                    {
                        
                        var object = json[i]
                        let coreMovie = NSManagedObject(entity: entity!,insertInto: managedConetext)
                        coreMovie.setValue(object["title"]! as! String, forKey: "title")
                        coreMovie.setValue(object["image"]! as! String , forKey: "image")
                        coreMovie.setValue( object["releaseYear"]! as!Int, forKey: "year")
                        coreMovie.setValue(((object["rating"] as? NSNumber)?.floatValue)!, forKey: "rating")
                        coreMovie.setValue((object["genre"]! as! [String]) , forKey: "genre")
                        do{
                            try managedConetext.save()
                            
                        }catch let error as NSError{
                            print(error)
                        }
                        self.movies.append(coreMovie)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                }
                catch
                {
                    print("error")
                }
            }
            task.resume()
            
            
        }
        
        viewController = ViewController();
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //cell.textLabel?.text = movies[indexPath.row].title;
        cell.textLabel?.text = (movies[indexPath.row].value(forKey: "title") as! String);

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? ViewController
        let myMovie: Movie = Movie()
        myMovie.title = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
        myMovie.image = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
        myMovie.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rating") as! Float
        myMovie.releaseDate = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "year") as! Int
        myMovie.genre = (movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! [String])
        
        viewController.setMovie(mov: myMovie);

    }
    
}
