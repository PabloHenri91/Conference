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
    
    var section: SectionConference!
    
    var onExpandedChangedBlock = {
        print("onExpandedChangedBlock")
    }
    
    func configure(section: SectionConference, onExpandedChangedBlock block: @escaping () -> Void) {
        self.section = section
        self.onExpandedChangedBlock = block
        self.label.text = "\(section.section ?? "nil")"
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.section.expandend = !self.section.expandend
        self.onExpandedChangedBlock()
    }
}
