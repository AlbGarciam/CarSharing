//
//  ListTripsViewController.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol ListTripsViewControllerProtocol: class {
    func reloadData()
    func navigateToConfirmation(with trip: Trip)
    func navigateToError()
}

class ListTripsViewController: UIViewController {

    //MARK: MVP
    private var presenter: TripsListPresenterProtocol!

    //MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(presenter: TripsListPresenterProtocol) {
        self.presenter = presenter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getTripList()
    self.navigationController?.isNavigationBarHidden = false
        self.title = "Busco un viaje"
    }
    
    //MARK: IB Outlets
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.estimatedRowHeight = 170
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
            
            let cell = UINib(nibName: TripCell.reuseId, bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: TripCell.reuseId)
        }
    }
    
    func dropShadow() {
        tableView.layer.masksToBounds = false
        tableView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        tableView.layer.shadowOpacity = 1
        tableView.layer.shadowOffset = CGSize(width: 0, height: 2)
        tableView.layer.shadowRadius = 4
        tableView.layer.shouldRasterize = true
    }
}

extension ListTripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripCell.reuseId, for: indexPath)
        cell.selectionStyle = .none
        if let cell = cell as? TripCell, let model = presenter.model(for: indexPath.row) {
            cell.tripId = model.id
            cell.titleLabel.text = model.name
            let date = DateFormatter.dateFormatter.date(from: model.startTime)
            let tripDate = DateFormatter.tripDate.string(from: date!)
            let tripTime = DateFormatter.tripTime.string(from: date!)
            cell.dateLabel.text = tripDate
            cell.originLabel.text = model.origin
            if let stop = model.stops {
                cell.stopsLabel.isHidden = false
                cell.stopsLabel.text = stop
            }
            cell.configureAdditionalInfo(time: tripTime, seats: model.availableSeats)
            cell.delegate = self
        }
        return cell
    }
}

extension ListTripsViewController: ListTripsViewControllerProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func navigateToConfirmation(with trip: Trip) {
        let confirmation = assembler.provideConfirmation(confirmationType: .passenger, tripInfo: trip)
        navigationController?.present(confirmation, animated: true, completion: nil)
    }
    
    func navigateToError() {
        let error = assembler.provideConfirmation(confirmationType: .error)
        navigationController?.present(error, animated: true, completion: nil)
    }
}

extension ListTripsViewController: TripCellDelegate {
    func tripRequested(sender: UIButton, tripId: String) {
        presenter.tripRequested(id: tripId)
    }
}


