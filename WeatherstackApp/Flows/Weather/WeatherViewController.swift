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
    
    //MARK: - Enums
    
    private enum Section {
        case main
    }
    
    private enum Item: Hashable {
        case mainItem(title: String, info: String)
    }
    
    //MARK: - Properties
    
    var viewModel: WeatherViewModel?
    var networkService: NetworkService?
    
    //MARK: - Private properties
    
    private var weatherData: WeatherInfo? {
        didSet {
            setupData()
        }
    }
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let cityName: String
    private var viewState: State = .loading {
        didSet {
            resetState()
            switch viewState {
            case .loading :
                activityIndicator.startAnimating()
                print("loading")
            case .error :
                collectionView.isHidden = true
                alert(Strings.oops, Strings.somethingWentWrong)
            case .showData :
                setupData()
                configureDataSource()
                collectionView.isHidden = false
            }
        }
    }
    
    private let cityNameLabel = UILabel()
    
    private let weatherIcon = UIImageView()
    private let temperature = UILabel()
    private let iconAndTempStackView = UIStackView()
    
    private let weatherDescription = UILabel()
    private var topInfoStackView = UIStackView()
    private var diffableDataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchWeather(for: cityName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
        configureDataSource()
        setupView()
    }
    
    //MARK: - Methods
    
    init(cityName: String) {
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func resetState() {
        collectionView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func configureDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .mainItem(let title, let info):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.mainCellIdentifier, for: indexPath) as? MainSquareCell
                cell?.info.text = info
                cell?.title.text = title
                return cell
            }
        })
        guard let weatherInfo = viewModel?.weatherInfo else { return }
        let snapshot = createWeatherSnapshot(response: weatherInfo)
        diffableDataSource.apply(snapshot)
    }
    
    private func createWeatherSnapshot(response: WeatherInfo) -> NSDiffableDataSourceSnapshot<Section, Item> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([Section.main])
        
        let items = [Item.mainItem(title: Strings.windDegree, info: String(response.current.windDegree)),
                     Item.mainItem(title: Strings.windDirection, info: String(response.current.windDirection)),
                     Item.mainItem(title: Strings.windSpeed, info: String(response.current.windSpeed))]
        snapshot.appendItems(items, toSection: .main)
        return snapshot
    }
}

extension WeatherViewController {
    
    //MARK: - View Configuration
    
    private enum Constant {
        static let mainCellIdentifier = "MainSquareCell"
    }
    
    private func setupView() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        topInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        topInfoStackView.axis = .vertical
        
        cityNameLabel.font = UIFont.systemFont(ofSize: 25)
        weatherIcon.roundingViewCorners(radius: 16)
        temperature.font = UIFont.boldSystemFont(ofSize: 50)
        
        iconAndTempStackView.axis = .horizontal
        iconAndTempStackView.spacing = 16
        iconAndTempStackView.addArrangedSubview(weatherIcon)
        iconAndTempStackView.addArrangedSubview(temperature)
        
        weatherDescription.font = UIFont.preferredFont(forTextStyle: .title3)
        weatherDescription.numberOfLines = 0
        
        topInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        topInfoStackView.axis = .vertical
        topInfoStackView.spacing = 8
        topInfoStackView.alignment = .center
        topInfoStackView.addArrangedSubview(cityNameLabel)
        topInfoStackView.addArrangedSubview(iconAndTempStackView)
        topInfoStackView.addArrangedSubview(weatherDescription)
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.width/3)
        collectionViewLayout.minimumLineSpacing = 32
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainSquareCell.self, forCellWithReuseIdentifier: Constant.mainCellIdentifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGreen
        view.backgroundColor = .systemBackground
        view.addSubview(activityIndicator)
        view.addSubview(topInfoStackView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            topInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topInfoStackView.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupData() {
        cityNameLabel.text = viewModel?.weatherInfo?.location.name
        weatherIcon.loadImage(viewModel?.weatherInfo?.current.weatherIcons.first ?? "")
        if let temperatureAsInt = viewModel?.weatherInfo?.current.temperature {
            temperature.text = String(temperatureAsInt) + "°"
        }
        weatherDescription.text = viewModel?.weatherInfo?.current.weatherDescriptions.first
    }
}

//MARK: - Delegates

extension WeatherViewController: UICollectionViewDelegate {}

extension WeatherViewController: WeatherViewModelDelegate {
    
    func presentLoadingState() {
        viewState = .loading
    }
    
    func presentErrorState() {
        viewState = .error
    }
    
    func didFetchWeatherData(weatherData: WeatherInfo) {
        self.weatherData = weatherData
        viewState = .showData
    }
}
