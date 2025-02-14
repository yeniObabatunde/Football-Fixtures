//
//  NoFixturesLayout.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

protocol NoFixturesViewDelegate: AnyObject {
    func didTapRetry()
}

class NoFixturesView: UIView {
    
    weak var delegate: NoFixturesViewDelegate?
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "soccerball")
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No fixtures"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Retry", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(retryButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            retryButton.widthAnchor.constraint(equalToConstant: 120),
            retryButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        retryButton.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
    }
    
    @objc private func retryTapped() {
        delegate?.didTapRetry()
    }
}

