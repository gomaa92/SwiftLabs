//
//  TableViewController.swift
//  MovieTableView
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Gomaa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var movies = [Movie]()
    var viewController : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){(data , response , error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array <Movie>
                
                for i in 0..<json.count
                {
                   self.movies.append(json[i])
                }
                
                
            }
            catch
            {
                print("error")
            }
        }
        task.resume()
        
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

        cell.textLabel?.text = movies[indexPath.row].title;

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? ViewController
//        viewController.setMovie(mov: movies[(self.tableView.indexPathForSelectedRow?.row)!]);

    }
    
}
