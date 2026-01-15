//
//  HotPlaceCell.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/15/26.
//

import UIKit

final class HotPlaceCell: UICollectionViewCell {
    
    static let identifier = "HotPlaceCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.15)
        
        titleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        
        cityLabel.font = .systemFont(ofSize: 11)
        cityLabel.textColor = .secondaryLabel
        cityLabel.textAlignment = .center
        
        imageView.image = UIImage(systemName: "link.circle.fill")
        imageView.tintColor = .systemBlue
    }
    
    func configure(with spot: TouristSpot) {
        titleLabel.text = spot.koreanName
        cityLabel.text  = spot.city
    }
}
