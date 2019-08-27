//
//  NetworkManager.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager: NSObject {
    
    private var news: [Post]?
    private let url: String
    private var postImageData: [Int: UIImage]?


    func getNews(complitionhandler: @escaping ([Post]?, [Int: UIImage]?)-> ()) {
        let component = URLComponents(string: url)
//        component?.queryItems = [URLQueryItem(name: "count", value: "23")]
        let request = URLRequest(url: component!.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(News.self,from: data)
                print(news.result.count)
                self.news = news.result
            } catch {
                print(error)
            }
            let runQueue = DispatchQueue.global()
            runQueue.async {
                self.asyncLoadIamge(complitionHandler: complitionhandler)
            }

            
//            complitionhandler(self.news!, self.postImageData!)
            complitionhandler(self.news!, nil)

            
        }.resume()
    }
    
    
    func asyncLoadIamge(complitionHandler: ([Post]?,[Int: UIImage]?) -> ()) {
        var data: Data?
        var array: [Int: UIImage] = [:]
        
        for value in self.news! {
                do {
                    print(value.cover?.additionalData?.type)
                    if let url = value.cover?.url, value.cover?.additionalData?.type != "gif" {
                        print(url)
                        data = try Data(contentsOf: URL(string: url)!)
                        let img = UIImage(data: data!)!
                        array.updateValue(img, forKey: value.id)
                    } else {
                        continue
                    }
                    
                    
                } catch {
                    print(error)
                }
        }
        complitionHandler(nil,array)
        
//        self.postImageData = array
    }
    
    init(url: String) {
        self.url = url
    }
    
    
}
