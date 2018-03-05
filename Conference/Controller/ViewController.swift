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
            
            for y in 1...10 {
                
                let itemConference = ItemConference()
                itemConference.item = "Item \(y)"
                
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let sectionConferenceTableViewHeader = view as? SectionConferenceTableViewHeader else { return }
        
        let sectionConference: SectionConference = self.sections[section]
        
        if sectionConferenceTableViewHeader.section == sectionConference { return }
        
        sectionConferenceTableViewHeader.configure(section: sectionConference, onSectionExpandedChangedBlock: {
            tableView.reloadSections(IndexSet(integer: section), with: .fade)
        })
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let itemConferenceTableViewCell = cell as? ItemConferenceTableViewCell else { return }
        
        let sectionConference: SectionConference = self.sections[indexPath.section]
        let itemConference: ItemConference = sectionConference.itemConferenceList[indexPath.row]
        
        if itemConferenceTableViewCell.item == itemConference { return }
        
        itemConferenceTableViewCell.configure(section: sectionConference, item: itemConference, onItemExpandedChangedBlock: {
            tableView.beginUpdates()
            tableView.endUpdates()
        })
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionConferenceTableViewHeader.self)") as! SectionConferenceTableViewHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "\(ItemConferenceTableViewCell.self)", for: indexPath) as! ItemConferenceTableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionConference = self.sections[section]
        
        if sectionConference.expanded {
            return self.sections[section].itemConferenceList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // header do section
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var heigh: CGFloat = 0
        
        let sectionConference: SectionConference = self.sections[indexPath.section]
        let itemConference: ItemConference = sectionConference.itemConferenceList[indexPath.row]
        
        if sectionConference.expanded {
            heigh = heigh + 20 // header do item
            if itemConference.expanded {
                heigh = heigh + CGFloat(self.sections[indexPath.section].itemConferenceList[indexPath.row].fieldConferenceList.count) * 20 // altura do campo
            }
        }
        
        return heigh
    }
}


