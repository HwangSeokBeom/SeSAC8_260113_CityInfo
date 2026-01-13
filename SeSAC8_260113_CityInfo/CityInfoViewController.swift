//
//  CityInfoViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit

final class CityInfoViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    private let cityInfo = CityInfo()
    private var filteredCities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        
        setupUI()
        applyFilter()
    }
    
    private func setupUI () {
        
        titleLabel.text = "인기 도시"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        searchTextField.placeholder = "도시명을 검색하세요"
        searchTextField.backgroundColor = UIColor.systemGray6
        searchTextField.layer.cornerRadius = 8
        searchTextField.layer.masksToBounds = true
        
        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        segmentedControl.removeAllSegments()
        ["모두", "국내", "해외"].enumerated().forEach { index, title in
            segmentedControl.insertSegment(withTitle: title, at: index, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.backgroundColor = UIColor.systemGray6
        segmentedControl.selectedSegmentTintColor = .white
        
        // 기본 상태(선택 X) 글자 스타일
        let normalAttrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ]
        segmentedControl.setTitleTextAttributes(normalAttrs, for: .normal)
        
        // 선택 상태 글자 스타일
        let selectedAttrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
        segmentedControl.setTitleTextAttributes(selectedAttrs, for: .selected)
    }
    
    private func applyFilter() {
        let keyword = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        // 1) 세그먼트별 기본 리스트
        let baseList: [City]
        switch segmentedControl.selectedSegmentIndex {
        case 1: // 국내
            baseList = cityInfo.domesticCities
        case 2: // 해외
            baseList = cityInfo.internationalCities
        default: // 모두
            baseList = cityInfo.city
        }
        
        // 2) 검색어 필터 적용
        if keyword.isEmpty {
            filteredCities = baseList
        } else {
            filteredCities = baseList.filter {
                $0.city_name.contains(keyword) ||
                $0.city_english_name.lowercased().contains(keyword.lowercased()) ||
                $0.city_explain.contains(keyword)
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        applyFilter()
    }
    
    @IBAction func segmentedConrolClicked(_ sender: UISegmentedControl) {
        applyFilter()
        sender.resignFirstResponder()
    }
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as! CityInfoTableViewCell
        
        let city = filteredCities[indexPath.row]
            cell.configure(with: city)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
