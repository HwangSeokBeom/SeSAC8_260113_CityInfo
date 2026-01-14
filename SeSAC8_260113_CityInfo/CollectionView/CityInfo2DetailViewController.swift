//
//  CityInfo2DetailViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/14/26.
//

import UIKit
import Kingfisher

final class CityInfo2DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var navigationItemLeftButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var city: City?
    
    private var isPushed: Bool {
        return navigationController?.viewControllers.contains(self) == true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure(with: city)
        setupNavigationIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isPushed {
            navigationController?.setNavigationBarHidden(false, animated: animated)
        } else {
            navigationController?.setNavigationBarHidden(true, animated: animated)
            backButton.isHidden = true
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        
        nameLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        nameLabel.textAlignment = .center
        detailLabel.font = .systemFont(ofSize: 14, weight: .regular)
        detailLabel.textColor = .lightGray
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        
        backButton.setTitle("다른 관광지 보러 가기", for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.backgroundColor = .systemCyan.withAlphaComponent(0.3)
        backButton.layer.cornerRadius = 15
    }
    
    private func configure(with city: City?) {
        guard let city = city else { return }
        
        nameLabel.text = "\(city.city_name) · \(city.city_english_name)"
        
        // 설명
        detailLabel.text = city.city_explain
        
        if let url = URL(string: city.city_image) {
            let placeholder = UIImage(named: "6640187")
            imageView.kf.setImage(with: url, placeholder: placeholder)
        } else {
            imageView.image = UIImage(named: "6640187")
        }
    }
    
    private func setupNavigationIfNeeded() {
            // 타이틀 설정
            title = "관광지 화면"
            
            // LeftBarButton 설정
            let backButton = UIBarButtonItem(
                image: UIImage(systemName: "chevron.backward"),
                style: .plain,
                target: self,
                action: #selector(handleBackButton)
            )
            
            navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // push 로 온 경우 -> pop
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            // present 로 온 경우 -> dismiss
            dismiss(animated: true)
        }
    }
}
