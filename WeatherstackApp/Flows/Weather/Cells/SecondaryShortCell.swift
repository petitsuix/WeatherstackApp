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
    
    private let title = UILabel()
    private let info = UILabel()
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
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.addArrangedSubview(title)
        parentStackView.addArrangedSubview(info)
        addSubview(parentStackView)
    }
    
    func setupData() {
    }
    
}
