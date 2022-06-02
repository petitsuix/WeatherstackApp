//
//  HomeViewController.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Internal properties
    
    var viewModel: HomeViewModel?
    
    //MARK: - Private properties
    
    private let parentStackView = UIStackView()
    private let homeTitle = UILabel()
    private let searchBar = UITextField()
    private let browseButton = UIButton()
    private let illustrationImageView = UIImageView()
    
    //MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - objc methods
    
    @objc func showCityWeatherScreen() {
        if let searchBarText = searchBar.text {
            viewModel?.showCityWeatherScreen(cityName: searchBarText)
        }
    }
}

//MARK: - View configuration

extension HomeViewController {
    
    private func setupView() {
        homeTitle.text = Strings.whatsTheWeatherLikeIn
        homeTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        
        searchBar.attributedPlaceholder = NSAttributedString(
            string: Strings.searchBarPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2]
        )
        searchBar.borderStyle = .none
        searchBar.backgroundColor = .secondarySystemBackground
        searchBar.roundingViewCorners(radius: 15)
        searchBar.clearButtonMode = .whileEditing
        searchBar.addDoneToolbar()
        
        browseButton.setTitle(Strings.browseButtonTitle, for: .normal)
        browseButton.backgroundColor = .systemOrange
        browseButton.roundingViewCorners(radius: 15)
        browseButton.addTarget(self, action: #selector(showCityWeatherScreen), for: .touchUpInside)
        
        illustrationImageView.translatesAutoresizingMaskIntoConstraints = false
        illustrationImageView.image = WSAImages.halfEarthImage
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.alignment = .center
        parentStackView.spacing = 24
        
        parentStackView.addArrangedSubview(homeTitle)
        parentStackView.addArrangedSubview(searchBar)
        parentStackView.addArrangedSubview(browseButton)
        parentStackView.addArrangedSubview(illustrationImageView)
        
        parentStackView.setCustomSpacing(8, after: illustrationImageView)
        
        view.backgroundColor = .systemBackground
        view.addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            browseButton.heightAnchor.constraint(equalToConstant: 40),
            browseButton.widthAnchor.constraint(equalToConstant: 140),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.widthAnchor.constraint(equalToConstant: 300),
            illustrationImageView.heightAnchor.constraint(equalToConstant: 200),
            illustrationImageView.widthAnchor.constraint(equalToConstant: 200),
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            parentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
