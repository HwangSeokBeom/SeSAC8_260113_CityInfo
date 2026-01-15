//
//  HotViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/15/26.
//

import UIKit

final class HotViewController: UIViewController {
    
    @IBOutlet var hotCollectionView: UICollectionView!
    
    private let touristSpotInfo = TouristSpotInfo()
    private var spots: [TouristSpot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Hot 명소"
        
        spots = touristSpotInfo.spots
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        hotCollectionView.dataSource = self
        hotCollectionView.delegate   = self
        
        
        let placeNib = UINib(nibName: "HotPlaceCell", bundle: nil)
        hotCollectionView.register(placeNib, forCellWithReuseIdentifier: HotPlaceCell.identifier)
        let adNib = UINib(nibName: "HotAdCell", bundle: nil)
        hotCollectionView.register(adNib, forCellWithReuseIdentifier: HotAdCell.identifier)
        
        if let layout = hotCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 16, right: 16)
        }
    }
}

extension HotViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let spot = spots[indexPath.item]
        
        if spot.ad {
            // 광고 셀
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HotAdCell.identifier,
                for: indexPath
            ) as? HotAdCell else { return UICollectionViewCell() }
            
            cell.configure(with: spot)
            return cell
        } else {
            // 일반 셀
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HotPlaceCell.identifier,
                for: indexPath
            ) as? HotPlaceCell else { return UICollectionViewCell() }
            
            cell.configure(with: spot)
            return cell
        }
    }
    
    // 3열 레이아웃
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let inset = layout.sectionInset
        let spacing = layout.minimumInteritemSpacing
        
        let availableWidth = UIScreen.main.bounds.width
        - inset.left - inset.right
        - spacing * 2
        
        let width = availableWidth / 3
        let height = width * 0.95
        return CGSize(width: width, height: height)
    }
}
