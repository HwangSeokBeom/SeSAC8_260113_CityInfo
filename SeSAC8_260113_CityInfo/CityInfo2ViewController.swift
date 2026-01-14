//
//  CityInfo2ViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit

class CityInfo2ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    private let cityInfo = CityInfo()
    private var filteredCities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate   = self
        
        // XIB 셀 등록 
        let nib = UINib(nibName: CityInfo2CollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib,
                                forCellWithReuseIdentifier: CityInfo2CollectionViewCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = .zero
        }
        
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
        
        collectionView.reloadData()
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
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

extension CityInfo2ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CityInfo2CollectionViewCell.identifier,
            for: indexPath
        ) as? CityInfo2CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let city = filteredCities[indexPath.item]
        cell.configure(with: city)
        return cell
    }
    
    // 2열 레이아웃
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2
        let height = width + 50
        return CGSize(width: width, height: height)
    }
}
