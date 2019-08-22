//
//  NetworkManager.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import Foundation



class NetworkManager: NSObject {
    
    private var news: [Post]?
    private let url: String

    func getNews(complitionhandler: @escaping ([Post])-> ()) {
        let component = URLComponents(string: url)
//        component?.queryItems = [URLQueryItem(name: "count", value: "23")]
        let request = URLRequest(url: component!.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(News.self,from: data)
                self.news = news.result
            } catch {
                print(error)
            }
            complitionhandler(self.news!)
            
        }.resume()
    }
    
    init(url: String) {
        self.url = url
    }
    
    
}
