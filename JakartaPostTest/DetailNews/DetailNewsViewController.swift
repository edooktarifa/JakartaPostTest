//
//  DetailNewsViewController.swift
//  JakartaPostTest
//
//  Created by Phincon on 22/09/22.
//

import UIKit

class DetailNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var newsDetail: NewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "DetailNewsCell", bundle: nil), forCellReuseIdentifier: "DetailNewsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNewsCell", for: indexPath) as? DetailNewsCell else { return UITableViewCell() }
        if let newsDetail = newsDetail {
            cell.setData(data: newsDetail)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
