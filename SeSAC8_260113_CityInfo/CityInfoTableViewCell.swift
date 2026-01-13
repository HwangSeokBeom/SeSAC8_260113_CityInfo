//
//  CityInfoTableViewCell.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit

final class CityInfoTableViewCell: UITableViewCell {
    
    static let identifier = "CityInfoTableViewCell"
    
    @IBOutlet var backgroudView: UIView!
    @IBOutlet var backgroudImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroudImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        // 카드 모양
        backgroudView.layer.cornerRadius = 20
        backgroudView.layer.masksToBounds = true
        
        // 배경 이미지
        backgroudImageView.contentMode = .scaleAspectFill
        backgroudImageView.clipsToBounds = true
        
        // 상단 타이틀
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 1
        
        // 하단 반투명 바
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        
        // 하단 서브 타이틀
        subtitleLabel.textColor = .white
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.numberOfLines = 1
        
        // 셀 그림자 
        contentView.layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func configure(image: UIImage?, title: String, subtitle: String) {
        backgroudImageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
}
