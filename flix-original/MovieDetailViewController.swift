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
    
    var movie:Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let movie = movie {
            self.titleLabel.text = movie.title
            self.descriptionLabel.text = movie.description
            self.posterImage.af.setImage(withURL: movie.poster)
            self.bannerImage.af.setImage(withURL: movie.banner)
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
