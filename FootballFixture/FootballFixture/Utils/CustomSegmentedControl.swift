//
//  CustomSegmentedControl.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    private let selectedTextColor: UIColor = .black
    private let normalTextColor: UIColor = .gray
    
    override init(items: [Any]?) {
        super.init(items: items)
        setupAppearance()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }
    
    private func setupAppearance() {
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: normalTextColor,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: selectedTextColor,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        
        setTitleTextAttributes(normalTextAttributes, for: .normal)
        setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setBackgroundImage(clearImage, for: .highlighted, barMetrics: .default)
        
        setDividerImage(clearImage,
                        forLeftSegmentState: .normal,
                        rightSegmentState: .normal,
                        barMetrics: .default)
        backgroundColor = .white
        tintColor = .clear
        addTarget(self, action: #selector(updateSelectedSegmentIndicator), for: .valueChanged)
    }
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupIndicatorIfNeeded()
        updateSelectedSegmentIndicator()
    }
    
    private var indicatorLeadingConstraint: NSLayoutConstraint?
    
    private func setupIndicatorIfNeeded() {
        if indicatorView.superview == nil {
            addSubview(indicatorView)
            
            indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
            
            NSLayoutConstraint.activate([
                indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
                indicatorLeadingConstraint!,
                indicatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / CGFloat(numberOfSegments)),
                indicatorView.heightAnchor.constraint(equalToConstant: 2)
            ])
        }
    }
    
    @objc private func updateSelectedSegmentIndicator() {
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let leadingDistance = segmentWidth * CGFloat(selectedSegmentIndex)
        
        indicatorLeadingConstraint?.constant = leadingDistance
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}
