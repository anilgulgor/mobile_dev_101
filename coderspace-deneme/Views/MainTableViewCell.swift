//
//  MainTableCellTableViewCell.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 6.05.2024.
//

import UIKit
import WebKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var directorTitle: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    
    @IBOutlet weak var imageWebView: WKWebView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
