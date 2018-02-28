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
    
    func configure(field: FieldConference) {
        self.label.text = "\(field.field ?? "nil")"
    }
}
