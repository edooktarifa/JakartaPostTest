//
//  ViewController.swift
//  JakartaPostTest
//
//  Created by Phincon on 20/09/22.
//

import UIKit
import RxSwift

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsVM = NewsViewModel()
    let disposeBag = DisposeBag()
    
    var page: Int = 1
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loading.startAnimating()
        newsVM.getDataNews(page: 1)
        newsVM.getList.drive(onNext: {
            [weak self] _ in
            
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        newsVM.getLoading.drive(onNext: {
            [weak self] _ in
            self?.stopLoading()
            self?.refreshControl.endRefreshing()
        }).disposed(by: disposeBag)
        
        refreshControlView()
        registerTable()
    }
    
    func refreshControlView(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.loading.startAnimating()
        loadMore(page: 1)
        page = 0
    }
    
    func registerTable(){
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 10 {
            self.loading.startAnimating()
            page = page + 1
            loadMore(page: page)
        }
    }
    
    func loadMore(page: Int){
        newsVM.getDataNews(page: page)
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsVM.newList.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
        if let data = newsVM.newList.value?[indexPath.row] {
            cell.setContent(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        moveToDetail(indexPath: indexPath)
    }
    
    func moveToDetail(indexPath: IndexPath){
        let vc = DetailNewsViewController()
        vc.newsDetail = newsVM.newList.value?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

