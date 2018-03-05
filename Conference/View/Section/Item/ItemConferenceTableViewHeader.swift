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
    
    weak var item: ItemConference!
    
    var onItemExpandedChangedBlock = { }
    
    func configure(section: SectionConference, item: ItemConference, onItemExpandedChangedBlock block: @escaping () -> Void) {
        print("\(#function)")
        self.item = item
        self.onItemExpandedChangedBlock = block
        self.label.text = "\t\(item.item ?? "nil") \(section.section ?? "nil")"
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.item.expanded = !self.item.expanded
        self.onItemExpandedChangedBlock()
    }
}
