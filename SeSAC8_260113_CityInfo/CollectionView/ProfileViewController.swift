//
//  ProfileViewController.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/15/26.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var onLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupNavigationBar()
        setupUI()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "프로필 수정"
        
        // 왼쪽: 동그란 뒤로가기 버튼
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.backgroundColor = .white
        backButton.layer.cornerRadius = 16
        backButton.layer.masksToBounds = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        // 오른쪽: 동그란 "완료" 버튼
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("완료", for: .normal)
        doneButton.setTitleColor(.systemBlue, for: .normal)
        doneButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        doneButton.backgroundColor = .white
        doneButton.layer.cornerRadius = 16
        doneButton.layer.masksToBounds = true
        doneButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 14, bottom: 4, right: 14)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButton)
    }
    
    // MARK: - UI
    
    private func setupUI() {
        // "사용자 정보" 라벨
        userLabel.text = "사용자 정보"
        userLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        userLabel.textColor = .secondaryLabel
        
        // 닉네임 텍스트필드 (흰색 캡슐)
        userTextField.text = "고래밥"
        userTextField.placeholder = ""
        userTextField.borderStyle = .none
        userTextField.backgroundColor = .white
        userTextField.layer.cornerRadius = 22
        userTextField.layer.masksToBounds = true
        
        // 안쪽 좌측 여백
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        userTextField.leftView = paddingView
        userTextField.leftViewMode = .always
        
        // 아래 설명 라벨
        onLabel.text = "사용하실 닉네임을 입력해주세요."
        onLabel.font = .systemFont(ofSize: 12)
        onLabel.textColor = .secondaryLabel
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func doneButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textfieldDidEndOnExit(_ sender: UITextField) {
        
    }
}
