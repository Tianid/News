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
        
        titlteLabel.text = viewModel?.post?.title
        dateLabel.text = viewModel?.post?.dateRFC
        
        let nm = NetworkManager(url: "")
        let id = (viewModel?.post?.id)!
        print(APIType.dtfAPIPost.rawValue)
        postBlocks = nm.getPostBlocks(url: "\(APIType.dtfAPIPost.rawValue)\(id)")
        
        
        if viewModel?.postImage != nil {
            imageView = UIImageView()
            imageView!.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            view.addSubview(imageView!)
            imageView!.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                imageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageView!.topAnchor.constraint(equalTo: titlteLabel.bottomAnchor),
                imageView!.heightAnchor.constraint(equalToConstant: 181)
                ])
            imageView!.contentMode = .scaleAspectFit
            imageView!.image = viewModel?.postImage
            views?.append(imageView!)
        } else {
            views?.append(titlteLabel)
        }
        
        for (index, value) in (postBlocks?.enumerated())! {
            
            guard let block = value as? [String: Any] else { return }
            if block["type"] as! String == "text" {
                guard let data = block["data"] as? [String: Any] else { return }
                guard let dataText = data["text"] as? String else { return }
                text! += "\(dataText)\n"
                
            } else if block["type"] as! String != "text", text != "" {
                addlabel()
            }
            
            
            
            if index == postBlocks!.count - 1 {
                if text != "" {
                    addlabel()
                }
                NSLayoutConstraint.activate([
                    views![views!.count - 1].bottomAnchor.constraint(lessThanOrEqualTo: inScrollViewView.bottomAnchor)
                    ])
                for index in 1..<views!.count - 1 {
                    views![index].bottomAnchor.constraint(equalTo: views![index - 1].topAnchor)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    func addlabel() {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        inScrollViewView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: views![views!.count - 1].bottomAnchor),
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
