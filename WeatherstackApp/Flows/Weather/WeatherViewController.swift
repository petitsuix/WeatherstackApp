//
//  WeatherViewController.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private enum Section {
        case main
        case wind
        case miscellaneous
    }
    
    private enum Item: Hashable {
        case mainInfo(WeatherInfo)
    }
    
    var viewModel: WeatherViewModel?
    private var weatherInfo: [WeatherInfo] = []
    
    private var diffableDataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchWeather()
        configureDataSource()
    }
    
    
    func fetchWeather() {
        viewModel.fetchWeather()
    }
    
    func configureDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .mainInfo(let result):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainLargeCell", for: indexPath) as? MainLargeCell
                cell?.weatherInfo = result
                return cell
            }
        })
        let snapshot = createWeatherSnapshot(array: weatherInfo)
        diffableDataSource.apply(snapshot)
    }
    
    private func createWeatherSnapshot(array: [WeatherInfo]) -> NSDiffableDataSourceSnapshot<Section, Item> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([Section.main])
        let items = array.map { value in
            Item.mainInfo(value)
        }
        snapshot.appendItems(items, toSection: .main)
        return snapshot
    }
}


extension WeatherViewController {
    
    func setupView() {
        // collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layoutWithMultipleSections())
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}

extension WeatherViewController: UICollectionViewDelegate {}
