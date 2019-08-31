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
//    var views: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlteLabel.text = viewModel?.post?.title
        dateLabel.text = viewModel?.post?.dateRFC
        
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
        }
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "ajkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        label1.numberOfLines = 0
        inScrollViewView.addSubview(label1)
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: inScrollViewView.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: inScrollViewView.trailingAnchor),
            label1.topAnchor.constraint(equalTo: imageView!.bottomAnchor),
            label1.bottomAnchor.constraint(equalTo: inScrollViewView.bottomAnchor)
//            label1.bottomAnchor.constraint(lessThanOrEqualTo: inScrollViewView.bottomAnchor)
            
            ])

//        let label2 = UILabel()
//        label2.translatesAutoresizingMaskIntoConstraints = false
//        label2.text = "ajkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
//        label2.numberOfLines = 0
//        inScrollViewView.addSubview(label2)
//        NSLayoutConstraint.activate([
//            label2.leadingAnchor.constraint(equalTo: inScrollViewView.leadingAnchor),
//            label2.trailingAnchor.constraint(equalTo: inScrollViewView.trailingAnchor),
//            label2.topAnchor.constraint(equalTo: label1.bottomAnchor),
////            label2.heightAnchor.constraint(equalToConstant: 100)
//            ])
//
//        let label3 = UILabel()
//        label3.translatesAutoresizingMaskIntoConstraints = false
//        label3.text = "ajkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\najkshdsjkfjkdshfdjkshfjdskfhksd\najkhdajshdjkashdjkhaskjdhaskjhdaskjd\njkashdsjkashdakjshdaskjd\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
//        label3.numberOfLines = 0
//        inScrollViewView.addSubview(label3)
//        NSLayoutConstraint.activate([
//            label3.leadingAnchor.constraint(equalTo: inScrollViewView.leadingAnchor),
//            label3.trailingAnchor.constraint(equalTo: inScrollViewView.trailingAnchor),
//            label3.topAnchor.constraint(equalTo: label2.bottomAnchor),
//            label1.bottomAnchor.constraint(lessThanOrEqualTo: label2.topAnchor),
//            label2.bottomAnchor.constraint(lessThanOrEqualTo: label3.topAnchor),
//            label3.bottomAnchor.constraint(lessThanOrEqualTo: inScrollViewView.bottomAnchor)
//            ])
        
//        var views = [UIView]()
//
//        if imageView != nil {
//            views.append(imageView!)
//        } else {
//            views.append(titlteLabel)
//        }
//
//        scrollView = UIScrollView()
//        scrollView!.translatesAutoresizingMaskIntoConstraints = false
//        scrollView?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//        view.addSubview(scrollView!)
//        NSLayoutConstraint.activate([
//            scrollView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView!.topAnchor.constraint(equalTo: views[0].bottomAnchor),
//            scrollView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
        
        
        
        
        

        // Do any additional setup after loading the view.
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
