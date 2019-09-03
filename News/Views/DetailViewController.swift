//
//  DetailViewController.swift
//  News
//
//  Created by Tianid on 31/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inScrollViewView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titlteLabel: UILabel!
    
    var viewModel: DetailViewModelType?
    private var imageView: UIImageView?
    var views: [UIView]? = []
    private var postBlocks: [Any]?
    private var text: String? = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+3")
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm"
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:s"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let formattedData = dateFormatter.string(for: Date(timeIntervalSince1970: TimeInterval((viewModel?.post!.date)!)))!
        
        titlteLabel.text = viewModel?.post?.title
        dateLabel.text = formattedData
        
        let nm = NetworkManager(url: "")
        let id = (viewModel?.post?.id)!
        print(APIType.dtfAPIPost.rawValue)
        postBlocks = nm.getPostBlocks(url: "\(viewModel?.postAPI ?? "")\(id)")
        
        
//        if viewModel?.postImage != nil {
//            imageView = UIImageView()
//            imageView!.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
//            view.addSubview(imageView!)
//            imageView!.translatesAutoresizingMaskIntoConstraints = false
//
//            NSLayoutConstraint.activate([
//                imageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                imageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                imageView!.topAnchor.constraint(equalTo: titlteLabel.bottomAnchor),
//                imageView!.heightAnchor.constraint(equalToConstant: 181)
//                ])
//            imageView!.contentMode = .scaleAspectFit
//            imageView!.image = viewModel?.postImage
//            views?.append(imageView!)
//        } else {
//        }
        views?.append(titlteLabel)

        
        for (index, value) in (postBlocks?.enumerated())! {
            
            guard let block = value as? [String: Any] else { return }
           
            switch block["type"] as? String {
            case "text":
                guard let data = block["data"] as? [String: Any] else { return }
                guard let dataText = data["text"] as? String else { return }
                text! += "\(dataText)"
                
            case "quote":
                if text != "" {
                    addTextLabel()
                }
                guard let data = block["data"] as? [String: Any] else { return }
                guard let dataText = data["text"] as? String else { return }
                guard let subline1 = data["subline1"] as? String else { return }
                guard let subline2 = data["subline2"] as? String else { return }
                let label = UILabel()
                label.text = "\(dataText)\n\n\(subline1)\n\(subline2)"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = 0
                label.contentMode = .scaleAspectFit
                label.layer.cornerRadius = 10
                label.layer.backgroundColor = #colorLiteral(red: 0.7866570893, green: 0.992464753, blue: 1, alpha: 1)
                inScrollViewView.addSubview(label)
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                    label.topAnchor.constraint(equalTo: views![views!.count - 1].bottomAnchor, constant: 10),
                    ])
                views?.append(label)
                
            case "media":
                if text != "" {
                    addTextLabel()
                }
                guard let data = block["data"] as? [String: Any] else { return }
                guard let items = data["items"] as? [Any] else { return }
                guard let item = items[0] as? [String: Any] else { return }
                guard let image = item["image"] as? [String: Any] else { return }
                guard let imageData = image["data"] as? [String: Any] else { return }
                guard let imageType = imageData["type"] as? String else { return }
                if imageType != "gif"{
                    guard let uuid = imageData["uuid"] as? String else { return }
                    let imageView = UIImageView()
                    imageView.contentMode = .scaleAspectFit
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    inScrollViewView.addSubview(imageView)
                    let stringUrl = viewModel!.postImageAPI! + uuid
                    URLSession.shared.dataTask(with: URL(string: stringUrl)!) { (data, response, error) in
                        DispatchQueue.main.async {
                            imageView.image = UIImage(data: data!)
                        }
                        }.resume()
                    imageView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                    NSLayoutConstraint.activate([
                        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        imageView.topAnchor.constraint(equalTo: views![views!.count - 1].bottomAnchor, constant: 10),
                        imageView.heightAnchor.constraint(equalToConstant: 181)
                        ])
                    views?.append(imageView)
                }
                
            case "list":
                if text != "" {
                    addTextLabel()
                }
                guard let data = block["data"] as? [String: Any] else { return }
                guard let items = data["items"] as? [String] else { return }
                for item in items {
                    text! += "- \(item)\n"
                }
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = text
                label.numberOfLines = 0
                inScrollViewView.addSubview(label)
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                    label.topAnchor.constraint(equalTo: views![views!.count - 1].bottomAnchor, constant: 10),
                    ])
                views?.append(label)
                text = ""
                
            default:
                if text != "" {
                    addTextLabel()
                }
            }
            
            if index == postBlocks!.count - 1 {
                if text != "" {
                    addTextLabel()
                }
                NSLayoutConstraint.activate([
                    views![views!.count - 1].bottomAnchor.constraint(lessThanOrEqualTo: inScrollViewView.bottomAnchor)
                    ])
                if views!.count > 1 {
                    for index in 1..<views!.count - 1 {
                        views![index].bottomAnchor.constraint(equalTo: views![index - 1].topAnchor, constant: 10)
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    func addTextLabel() {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        inScrollViewView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: views![views!.count - 1].bottomAnchor, constant: 10),
            ])
        views?.append(label)
        text = ""
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
