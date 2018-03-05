//
//  ItemConferenceTableViewCell.swift
//  Conference
//
//  Created by Pablo on 27/02/18.
//  Copyright © 2018 Pablo Henrique Bertaco. All rights reserved.
//

import UIKit

class ItemConferenceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var section: SectionConference!
    weak var item: ItemConference!
    
    var onItemExpandedChangedBlock = { }
    
    func configure(section: SectionConference, item: ItemConference, onItemExpandedChangedBlock block: @escaping () -> Void) {
        print("\(#function)")
        if self.section == nil && self.item == nil {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            let headerNib = UINib(nibName: "\(ItemConferenceTableViewHeader.self)", bundle: Bundle.main)
            self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "\(ItemConferenceTableViewHeader.self)")
            
            let cellNib = UINib(nibName: "\(FieldConferenceTableViewCell.self)", bundle: Bundle.main)
            self.tableView.register(cellNib, forCellReuseIdentifier: "\(FieldConferenceTableViewCell.self)")
        }
        
        self.section = section
        self.item = item
        self.onItemExpandedChangedBlock = block
        
        self.tableView.reloadData()
    }
}

extension ItemConferenceTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let itemConferenceTableViewHeader = view as? ItemConferenceTableViewHeader else { return }
        
        if itemConferenceTableViewHeader.item == self.item { return }
        
        itemConferenceTableViewHeader.configure(section: self.section, item: self.item, onItemExpandedChangedBlock: { [weak self] in
            self?.onItemExpandedChangedBlock()
        })
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let fieldConferenceTableViewCell = cell as? FieldConferenceTableViewCell else { return }
        
        let fieldConference = self.item.fieldConferenceList[indexPath.row]
        
        fieldConferenceTableViewCell.configure(section: self.section, item: self.item, field: fieldConference)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ItemConferenceTableViewHeader.self)") as! ItemConferenceTableViewHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "\(FieldConferenceTableViewCell.self)", for: indexPath) as! FieldConferenceTableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.fieldConferenceList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // header do item
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20 // altura do campo
    }
}

