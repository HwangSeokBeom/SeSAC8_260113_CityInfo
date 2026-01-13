//
//  CityInfoViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit

class CityInfoViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
    }
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as! CityInfoTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
