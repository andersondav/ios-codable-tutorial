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
    
    let baseURL = "https://pbs.twimg.com/profile_images/1243623122089041920/gVZIvphd_400x400.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<20 {
            movies.append([
                "title": "Movie \(i)",
                "description": "Description for movie \(i)",
                "poster_path": ""
            ])
        }
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie["title"] as? String ?? ""
        cell.descriptionLabel.text = movie["description"] as? String ?? ""
        if let url_string = movie["poster_path"] as? String, let url = URL(string: baseURL + url_string) {
            cell.posterImage.af.setImage(withURL: url)
        }
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
