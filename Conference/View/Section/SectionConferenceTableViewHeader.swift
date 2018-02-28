//
//  SectionConferenceTableViewHeader.swift
//  Conference
//
//  Created by Pablo on 27/02/18.
//  Copyright © 2018 Pablo Henrique Bertaco. All rights reserved.
//

import UIKit

class SectionConferenceTableViewHeader: UITableViewHeaderFooterView {
 
    @IBOutlet weak var label: UILabel!
    
    func configure(section: SectionConference) {
        self.label.text = "\(section.section ?? "nil")"
    }
}
