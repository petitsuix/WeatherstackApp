//
//  SecondaryShortCell.swift
//  WeatherstackApp
//
//  Created by Richardier on 31/05/2022.
//

import UIKit

class SecondaryShortCell: UICollectionViewCell {
    
    static let identifier = "SecondaryShortCell"
    
    var weatherInfo: WeatherInfo?
    
    let title = UILabel()
    let info = UILabel()
    private let parentStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}

extension SecondaryShortCell {
    
    func setupView() {
        title.font = UIFont.preferredFont(forTextStyle: .title3)
        info.font = UIFont.preferredFont(forTextStyle: .title2)
        backgroundColor = .systemGray
        layer.borderWidth = 1
        roundingViewCorners(radius: 8)
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.spacing = 12
        parentStackView.addArrangedSubview(title)
        parentStackView.addArrangedSubview(info)
        addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            parentStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            parentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupData() {
    }
    
}
