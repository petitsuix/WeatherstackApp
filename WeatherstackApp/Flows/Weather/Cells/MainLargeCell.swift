//
//  MainLargeCell.swift
//  WeatherstackApp
//
//  Created by Richardier on 31/05/2022.
//

import UIKit

class MainLargeCell: UICollectionViewCell {
    
    static let identifier = "MainLargeCell"
    
    var weatherInfo: WeatherInfo? {
        didSet {
            refreshData()
        }
    }
    
    private let cityName = UILabel()
    
    private let weatherIcon = UIImageView()
    private let temperature = UILabel()
    private let iconAndTempStackView = UIStackView()
    
    private let weatherDescription = UILabel()
    
    private let parentStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func refreshData() {
        cityName.text = weatherInfo?.location.name
        weatherIcon.loadImage(weatherInfo?.current.weatherIcons.first ?? "")
        if let temperatureAsInt = weatherInfo?.current.temperature {
        temperature.text = String(temperatureAsInt) + "°"
        }
        weatherDescription.text = weatherInfo?.current.weatherDescriptions.first
    }
}

extension MainLargeCell {
    
    func setupView() {
        
        cityName.font = UIFont.systemFont(ofSize: 25)
        weatherIcon.roundingViewCorners(radius: 12)
        temperature.font = UIFont.boldSystemFont(ofSize: 50)
        
        iconAndTempStackView.axis = .horizontal
        iconAndTempStackView.spacing = 16
        iconAndTempStackView.addArrangedSubview(weatherIcon)
        iconAndTempStackView.addArrangedSubview(temperature)
        
        weatherDescription.font = UIFont.preferredFont(forTextStyle: .title3)
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.spacing = 8
        parentStackView.alignment = .center
        parentStackView.addArrangedSubview(cityName)
        parentStackView.addArrangedSubview(iconAndTempStackView)
        parentStackView.addArrangedSubview(weatherDescription)
        addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupData() {
        cityName.text = weatherInfo?.location.name
        weatherIcon.loadImage(weatherInfo?.current.weatherIcons.first ?? "")
        if let temperatureAsInt = weatherInfo?.current.temperature {
        temperature.text = String(temperatureAsInt) + "°"
        }
        weatherDescription.text = weatherInfo?.current.weatherDescriptions.first
    }
}
