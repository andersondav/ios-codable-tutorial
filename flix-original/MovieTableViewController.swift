//
//  MovieTableViewController.swift
//  flix-original
//
//  Created by Anderson David on 3/14/22.
//

import UIKit
import AlamofireImage

class MovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies:[[String:Any]] = [[String:Any]]()
    
    static let baseURL = "https://image.tmdb.org/t/p/w185/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                 print(self.movies)
                 self.tableView.reloadData()

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie["title"] as? String ?? ""
        cell.descriptionLabel.text = movie["overview"] as? String ?? ""
        if let url_string = movie["poster_path"] as? String, let url = URL(string: MovieTableViewController.baseURL + url_string) {
            cell.posterImage.af.setImage(withURL: url)
        }
        
        
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toMovieDetail" {
            let dest = segue.destination as! MovieDetailViewController
            
            if let sendingCell = sender as? MovieCell, let row = self.tableView.indexPath(for: sendingCell)?.row {
                dest.movie = self.movies[row]
            }
            else {
                dest.movie = [
                    "title": "Error",
                    "description": "Error",
                    "poster_path": "",
                    "banner_path": "https://pbs.twimg.com/profile_banners/35701585/1585337833/1500x500"
                ]
            }
            
        }
        
    }

}
