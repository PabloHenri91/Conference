//
//  FieldConferenceTableViewCell.swift
//  Conference
//
//  Created by Pablo on 27/02/18.
//  Copyright © 2018 Pablo Henrique Bertaco. All rights reserved.
//

import UIKit

class FieldConferenceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    weak var field: FieldConference!
    
    func configure(section: SectionConference, item: ItemConference, field: FieldConference) {
        print("\(#function)")
        self.field = field
        self.label.text = "\t\t\(field.field ?? "nil") \(item.item ?? "nil") \(section.section ?? "nil")"
    }
}
