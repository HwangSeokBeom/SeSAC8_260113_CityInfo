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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
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
}
