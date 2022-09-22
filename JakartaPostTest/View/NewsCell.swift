//
//  NewsCell.swift
//  JakartaPostTest
//
//  Created by Phincon on 22/09/22.
//

import UIKit
import Kingfisher


class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(data: NewsData){
        newsTitle.text = data.title
        newsDate.text = data.published_date
        newsImg.kf.setImage(with: URL(string: data.gallery?.first?.path_large ?? ""))
    }
    
}
