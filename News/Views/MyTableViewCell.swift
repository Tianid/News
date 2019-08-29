//
//  MyTableViewCell.swift
//  News
//
//  Created by Tianid on 21/08/2019.
//  Copyright © 2019 Tianid. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            
            guard let _ = viewModel else { return }
            titleLabel.text = viewModel?.title
            var intro: String = String()
            if let data = viewModel?.postImage {
                DispatchQueue.main.async {
                    self.postImage.image = data
                }
            } else {
                self.postImage.image = nil //MARK:make some stub JPG in future
            }
            for block in viewModel!.blocks {
                
                if block.cover == true, block.type == "text" {
                    intro = block.data.text!
                }
            }
            descriptionLabel.text = intro
            dateLabel.text = viewModel?.date
        }
    }
    var img: UIImage {
//        let imgg = UIImage(data: (viewModel?.postImage)!)!
        return UIImage()
    }
    
    
}
