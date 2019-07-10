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
}

class ListTripsViewController: UIViewController {

    //MARK: MVP
    private var presenter: TripsListPresenterProtocol!

    //MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
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
}

extension ListTripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripCell.reuseId, for: indexPath)
        cell.selectionStyle = .none
        if let cell = cell as? TripCell, let model = presenter.model(for: indexPath.row) {
            cell.titleLabel.text = model.name
            cell.dateLabel.text = model.startTime
            cell.originLabel.text = model.origin
            if let stop = model.stops {
                cell.stopsLabel.isHidden = false
                cell.stopsLabel.text = stop
            }
            cell.configureAdditionalInfo(time: model.startTime, seats: model.availableSeats)
        }
        return cell
    }
}

extension ListTripsViewController: ListTripsViewControllerProtocol {
    func reloadData() {

    }
}
