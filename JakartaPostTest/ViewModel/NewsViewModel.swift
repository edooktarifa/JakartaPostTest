//
//  HomeViewModel.swift
//  JakartaPostTest
//
//  Created by Phincon on 20/09/22.
//

import Foundation
import UIKit
import Alamofire
import RxSwift
import RxCocoa

class NewsViewModel {
    
    var newList = BehaviorRelay<[NewsData]?>(value: [])
    var loading = BehaviorRelay<Bool?>(value: false)
    
    var getList: Driver<[NewsData]?> {
        return newList.asDriver()
    }
    
    var getLoading: Driver<Bool?> {
        return loading.asDriver()
    }
    
    
    func getDataNews(page: Int){
        let limit = page * 5
        WebServiceHelper.instance.getServiceData(url: "https://dev-api.thejakartapost.com/v1/articles/seasia", method: .get, parameters: ["limit": limit], encodingType: URLEncoding.default, headers: [:]) { [weak self] (news: NewsModel?, error: String?) in
            
            self?.loading.accept(false)
            if error == nil {
                if let news = news {
                    self?.newList.accept(news.data)
                }
            }
        }
    }
}
