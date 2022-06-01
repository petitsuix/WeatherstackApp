//
//  WeatherViewController.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import UIKit

enum State {
    case loading
    case error
    case showData
}

class WeatherViewController: UIViewController {
    
    var viewModel: WeatherViewModel?
    var networkService = NetworkService()
    private var weatherInfo: [WeatherInfo] = []
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private let cityName: String
    
    private var viewState: State = .loading {
        didSet {
            resetState()
            switch viewState {
            case .loading :
                activityIndicator.startAnimating()
            case .error :
                collectionView.isHidden = true
                alert("Oops", "Something went wrong")
            case .showData :
                collectionView.isHidden = false
                // configureDataSource()
            }
        }
    }
    
    private var collectionView = UICollectionView()
    
    init(cityName: String) {
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchWeather(for: cityName)
        //fetchWeather(query: cityName ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        //configureDataSource()
    }
    
    private func resetState() {
        activityIndicator.stopAnimating()
    }
    
}


extension WeatherViewController {
    
    func setupView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainLargeCell.self, forCellWithReuseIdentifier: "MainLargeCell")
        collectionView.register(SecondaryShortCell.self, forCellWithReuseIdentifier: "SecondaryShortCell")
        collectionView.delegate = self
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension WeatherViewController: UICollectionViewDelegate {}

extension WeatherViewController: WeatherViewModelDelegate {
    func presentLoadingState() {
        viewState = .loading
    }
    
    func presentErrorState() {
        viewState = .error
    }
    
    func didFetchWeatherData() {
        viewState = .showData
    }
}
