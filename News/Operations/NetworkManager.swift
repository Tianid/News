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

    func getNews(news: [Post]?, postImageData: [Int: UIImage], complitionhandler: @escaping ([Post]?, [Int: UIImage]?, [Int]?)-> ()) {
        self.news = news
        self.postImageData = postImageData
        let component = URLComponents(string: url)
        let request = URLRequest(url: component!.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedNews = try JSONDecoder().decode(News.self,from: data)
                print(decodedNews.result.count)
                if self.news == nil {
                    self.news = decodedNews.result
                } else {
                    for new in decodedNews.result {
                        if !(self.news?.contains(where: { (post) -> Bool in
                            guard post.id == new.id else { return false }
                            return true
                        }))! {
                            self.news?.append(new)
                        }
                    }
                    self.news?.sort(by: { $0.date > $1.date })
                }
            } catch {
                print(error)
            }
            let runQueue = DispatchQueue.global()
            runQueue.async {
                self.asyncLoadIamge(complitionHandler: complitionhandler)
            }
            complitionhandler(self.news!, nil, nil)
        }.resume()
    }
    
    
    func asyncLoadIamge(complitionHandler: ([Post]?,[Int: UIImage]?,[Int]) -> ()) {
        var data: Data?
        var newLoads: [Int] = []
        
        for value in self.news! {
            if !(self.postImageData?.contains(where: { (key,_) -> Bool in
                guard key == value.id else { return false }
                return true
            }))! {
                print("never was")
                do {
                    print(value.cover?.additionalData?.type)
                    if let url = value.cover?.thumbnailUrl, value.cover?.additionalData?.type != "gif" {
                        print(url)
                        data = try Data(contentsOf: URL(string: url)!)
                        let img = UIImage(data: data!)!
                        self.postImageData?.updateValue(img, forKey: value.id)
                        newLoads.append(value.id)
                    } else {
                        continue
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }
        print("")
        print("DOWNLOADED")
        print("")
        complitionHandler(nil,self.postImageData, newLoads)
    }
    
    func getPostBlocks(url: String) -> Array<Any>? {
        let urll = URL(string: url)
        var blocks: Array<Any>?
        print(url)
        do {
            let data = try Data(contentsOf: urll!)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            guard let result  = json["result"] as? Dictionary<String, Any> else { return nil}
            blocks = result["blocks"] as? Array<Any>
        } catch {
            print(error)
        }
        return blocks
    }
    
    
    
    init(url: String) {
        self.url = url
    }
}
