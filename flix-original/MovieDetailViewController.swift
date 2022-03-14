//
//  MovieDetailViewController.swift
//  flix-original
//
//  Created by Anderson David on 3/14/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie:[String:Any] = [String:Any]()
    
    static let baseURL = "https://image.tmdb.org/t/p/w500/"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleLabel.text = movie["title"] as? String ?? ""
        self.descriptionLabel.text = movie["overview"] as? String ?? ""
        if let url_string = movie["poster_path"] as? String, let url = URL(string: MovieTableViewController.baseURL + url_string) {
            self.posterImage.af.setImage(withURL: url)
        }
        
        if let url_string = movie["backdrop_path"] as? String, let url = URL(string: MovieDetailViewController.baseURL + url_string) {
            self.bannerImage.af.setImage(withURL: url)
        }
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
