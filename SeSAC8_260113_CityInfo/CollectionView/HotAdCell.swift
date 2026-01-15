//
//  HotAdCell.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/15/26.
//

import UIKit

final class HotAdCell: UICollectionViewCell {
    
    static let identifier = "HotAdCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.4)
        
        badgeLabel.text = "AD"
        badgeLabel.textAlignment = .center
        badgeLabel.font = .systemFont(ofSize: 11, weight: .bold)
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .systemOrange
        badgeLabel.layer.cornerRadius = 10
        badgeLabel.layer.masksToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
    }
    
    func configure(with spot: TouristSpot) {
        titleLabel.text = spot.koreanName
    }
}
