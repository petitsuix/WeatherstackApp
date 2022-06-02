//
//  SecondaryShortCell.swift
//  WeatherstackApp
//
//  Created by Richardier on 31/05/2022.
//

import UIKit

class MainSquareCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "MainSquareCell"
    var weatherInfo: WeatherInfo?
    let title = UILabel()
    let info = UILabel()
    
    //MARK: - Private properties
    
    private let parentStackView = UIStackView()
    
    //MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.opacity = 0.8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}

//MARK: - View configuration

extension MainSquareCell {
    
    private func setupView() {
        title.font = UIFont.systemFont(ofSize: 24)
        title.numberOfLines = 0
        title.textAlignment = .center
        
        info.font = UIFont.boldSystemFont(ofSize: 30)
        
        roundingViewCorners(radius: 24)
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.alignment = .center
        parentStackView.distribution = .fillEqually
        parentStackView.addArrangedSubview(title)
        parentStackView.addArrangedSubview(info)
        backgroundColor = .systemGray6
        addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            parentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
        ])
    }
}
