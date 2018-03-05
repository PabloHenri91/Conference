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
    
    weak var section: SectionConference!
    
    var onSectionExpandedChangedBlock = { }
    
    func configure(section: SectionConference, onSectionExpandedChangedBlock block: @escaping () -> Void) {
        print("\(#function)")
        self.section = section
        self.onSectionExpandedChangedBlock = block
        self.label.text = "\(section.section ?? "nil")"
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.section.expanded = !self.section.expanded
        self.onSectionExpandedChangedBlock()
    }
}
