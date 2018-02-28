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
    
    var headerAux: SectionConferenceTableViewHeader!
    var cellAux: ItemConferenceTableViewCell!
    
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
        
        self.headerAux = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionConferenceTableViewHeader.self)") as! SectionConferenceTableViewHeader
        self.cellAux = self.tableView.dequeueReusableCell(withIdentifier: "\(ItemConferenceTableViewCell.self)") as! ItemConferenceTableViewCell
        
        self.tableView.reloadData()
        print("ViewController reloadData")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let view = view as? SectionConferenceTableViewHeader else { return }
        view.configure(section: self.sections[section])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ItemConferenceTableViewCell else { return }
        cell.configure(item: self.sections[indexPath.section].itemConferenceList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionConferenceTableViewHeader.self)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "\(ItemConferenceTableViewCell.self)", for: indexPath)
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
        
        var heigh: CGFloat = 20
        
        heigh = heigh + CGFloat(self.sections[indexPath.section].itemConferenceList[indexPath.row].fieldConferenceList.count) * 20
        
        return heigh
    }
}


