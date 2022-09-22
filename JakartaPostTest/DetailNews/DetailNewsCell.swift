//
//  DetailNewsCell.swift
//  JakartaPostTest
//
//  Created by Phincon on 22/09/22.
//

import UIKit
import Kingfisher

class DetailNewsCell: UITableViewCell {

    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDateLbl: UILabel!
    @IBOutlet weak var newsContentLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: NewsData){
        newsTitleLbl.text = data.title
        newsDateLbl.text = data.published_date
        newsContentLbl.text = data.summary
        newsImg.kf.setImage(with: URL(string: data.gallery?.first?.path_large ?? ""))
    }
    
}
