//
//  ItemConferenceTableViewHeader.swift
//  Conference
//
//  Created by Pablo on 27/02/18.
//  Copyright © 2018 Pablo Henrique Bertaco. All rights reserved.
//

import UIKit

class ItemConferenceTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var label: UILabel!
    
    func configure(item: ItemConference) {
        self.label?.text = "\(item.item ?? "nil")"
    }
}
