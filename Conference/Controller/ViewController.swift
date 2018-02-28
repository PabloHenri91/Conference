//
//  ViewController.swift
//  Conference
//
//  Created by Pablo on 27/02/18.
//  Copyright © 2018 Pablo Henrique Bertaco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [SectionConference]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 1...10 {
            
            let sectionConference = SectionConference()
            sectionConference.section = "Section \(x)"
            
            if  x % 2 == 0 {
                sectionConference.expandend = true
            }
            
            for y in 1...10 {
                
                let itemConference = ItemConference()
                itemConference.item = "Item \(y)"
                
                if y % 2 == 0 {
                    itemConference.expanded = true
                }
                
                for z in 1...10 {
                    
                    let fieldConference = FieldConference()
                    fieldConference.field = "Field \(z)"
                    itemConference.fieldConferenceList.append(fieldConference)
                }
                
                sectionConference.itemConferenceList.append(itemConference)
            }
            
            self.sections.append(sectionConference)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let headerNib = UINib(nibName: "\(SectionConferenceTableViewHeader.self)", bundle: Bundle.main)
        self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "\(SectionConferenceTableViewHeader.self)")
        
        let cellNib = UINib(nibName: "\(ItemConferenceTableViewCell.self)", bundle: Bundle.main)
        self.tableView.register(cellNib, forCellReuseIdentifier: "\(ItemConferenceTableViewCell.self)")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionConferenceTableViewHeader.self)")
        guard let sectionConferenceTableViewHeader = view as? SectionConferenceTableViewHeader else { return nil }
        sectionConferenceTableViewHeader.configure(section: self.sections[section])
        return sectionConferenceTableViewHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionConference: SectionConference = self.sections[indexPath.section]
        let itemConference: ItemConference = sectionConference.itemConferenceList[indexPath.row]
        
        if !sectionConference.expandend || !itemConference.expanded {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ItemConferenceTableViewCell.self)", for: indexPath)
        guard let itemConferenceTableViewCell = cell as? ItemConferenceTableViewCell else { return UITableViewCell() }
        
        itemConferenceTableViewCell.configure(item: itemConference)
        
        return itemConferenceTableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].itemConferenceList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var heigh: CGFloat = 0
        
        let sectionConference: SectionConference = self.sections[indexPath.section]
        let itemConference: ItemConference = sectionConference.itemConferenceList[indexPath.row]
        
        if sectionConference.expandend && itemConference.expanded {
            heigh = heigh + 20 // Header do item
            heigh = heigh + CGFloat(self.sections[indexPath.section].itemConferenceList[indexPath.row].fieldConferenceList.count) * 20 // altura do campo
        }
        
        return heigh
    }
}


