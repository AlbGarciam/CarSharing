//
//  TripsListPresenter.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//


import Foundation

protocol TripsListPresenterProtocol: class {
    func numberOfItems() -> Int
    func model(for row: Int) -> Trip?
    func getTripList()
}

class TripsListPresenter {
    
    weak var view: ListTripsViewControllerProtocol?
    
    private var tripsInfo: Trips?
    
    init(view: ListTripsViewControllerProtocol) {
        self.view = view
    }
    
    private func requestTripsInfo() {
        let listRequest = GetTripsRequest()
        listRequest.makeRequest { [weak self] result in
            switch result {
            case .success(let model):
                self?.tripsInfo = model
                self?.view?.reloadData()
            case .failure(let error):
                break //TODO
            }
        }
    }
}

extension TripsListPresenter: TripsListPresenterProtocol {
    func getTripList() {
        requestTripsInfo()
    }
    
    func numberOfItems() -> Int {
        return tripsInfo?.trips?.count ?? 0
    }
    
    func model(for row: Int) -> Trip? {
        return tripsInfo?.trips?[row]
    }
}