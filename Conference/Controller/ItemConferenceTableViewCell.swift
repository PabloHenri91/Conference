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
    var item: ItemConference!
    
    var headerAux: ItemConferenceTableViewHeader!
    var cellAux: FieldConferenceTableViewCell!
    
    func configure(item: ItemConference) {
        
        self.item = item
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let headerNib = UINib(nibName: "\(ItemConferenceTableViewHeader.self)", bundle: Bundle.main)
        self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "\(ItemConferenceTableViewHeader.self)")
        
        let cellNib = UINib(nibName: "\(FieldConferenceTableViewCell.self)", bundle: Bundle.main)
        self.tableView.register(cellNib, forCellReuseIdentifier: "\(FieldConferenceTableViewCell.self)")
        
        self.headerAux = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ItemConferenceTableViewHeader.self)") as! ItemConferenceTableViewHeader
        self.cellAux = self.tableView.dequeueReusableCell(withIdentifier: "\(FieldConferenceTableViewCell.self)") as! FieldConferenceTableViewCell
        
        self.tableView.reloadData()
        print("ItemConferenceTableViewCell reloadData")
    }
}

extension ItemConferenceTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let view = view as? ItemConferenceTableViewHeader else { return }
        view.configure(item: self.item)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? FieldConferenceTableViewCell else { return }
        cell.configure(field: self.item.fieldConferenceList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ItemConferenceTableViewHeader.self)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "\(FieldConferenceTableViewCell.self)", for: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.fieldConferenceList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

