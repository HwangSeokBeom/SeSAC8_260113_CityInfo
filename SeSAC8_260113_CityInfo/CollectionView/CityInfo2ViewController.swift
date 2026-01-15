//
//  CityInfo2ViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit

final class CityInfo2ViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    private let cityInfo = CityInfo()
    private var filteredCities: [City] = []
    
    private var currentFilter: CityFilter {
        return CityFilter(rawValue: segmentedControl.selectedSegmentIndex) ?? .all
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.keyboardDismissMode = .onDrag
        
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
        setupNavigationItems()
        setupUI()
        applyFilter()
    }
    
    private func setupNavigationItems() {
        // Title
        navigationItem.title = "인기 도시"
        
        // Left Item
        let leftButton = UIButton(type: .system)
        leftButton.setImage(UIImage(systemName: "flame.fill"), for: .normal)
        leftButton.tintColor = .systemOrange
     
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        // Right Item
        let rightButton = UIButton(type: .system)
        rightButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        rightButton.tintColor = .black
     
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    private func setupUI () {
        
        searchTextField.placeholder = "도시명을 검색하세요"
        searchTextField.backgroundColor = UIColor.systemGray6
        searchTextField.layer.cornerRadius = 8
        searchTextField.layer.masksToBounds = true
        
        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        segmentedControl.removeAllSegments()
        segmentedControl.removeAllSegments()
        [CityFilter.all, .domestic, .international].forEach { filter in
            segmentedControl.insertSegment(withTitle: filter.title, at: filter.rawValue, animated: false)
        }
        segmentedControl.selectedSegmentIndex = CityFilter.all.rawValue
        
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
        
        switch currentFilter {
        case .domestic:
            baseList = cityInfo.domesticCities
        case .international:
            baseList = cityInfo.internationalCities
        case .all:
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let city = filteredCities[indexPath.item]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(
            withIdentifier: "CityInfo2DetailViewController"
        ) as? CityInfo2DetailViewController else { return }
        
        detailVC.city = city
        
        switch currentFilter {
        case .domestic:
            // 국내 -> push
            navigationController?.pushViewController(detailVC, animated: true)
            
        case .international:
            // 해외 -> present
            detailVC.modalPresentationStyle = .formSheet
            present(detailVC, animated: true)
            
        case .all:
            // 모두 탭일 때 city 기준으로 분기
            if cityInfo.domesticCities.contains(where: { $0.city_name == city.city_name }) {
                navigationController?.pushViewController(detailVC, animated: true)
            } else {
                detailVC.modalPresentationStyle = .formSheet
                present(detailVC, animated: true)
            }
        }
    }
    
    @objc private func leftButtonTapped() {
        print(#function)
    }

    @objc private func rightButtonTapped() {
        print(#function)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let ProfileVC = storyboard.instantiateViewController(
            withIdentifier: "ProfileViewController"
        ) as? ProfileViewController else { return }
        
        navigationController?.pushViewController(ProfileVC, animated: true)
    }
}
