//
//  TripCell.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol TripCellDelegate: class {
    func tripRequested(sender: UIButton, tripId: String)
}

class TripCell: UITableViewCell {
    
    static let reuseId: String = "TripCell"
    
    weak var delegate: TripCellDelegate?
    
    var tripId: String?
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.textColor = .vfRed
            titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
            titleLabel.textAlignment = .left
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.textColor = .vfGrey2
            dateLabel.font = UIFont(name: "HelveticaNeue", size: 14)
            dateLabel.textAlignment = .right
        }
    }
    
    @IBOutlet weak var separatorView: UIView!{
        didSet{
            separatorView.backgroundColor = .vfGrey2
        }
    }
    
    @IBOutlet weak var originLabel: UILabel!{
        didSet{
            originLabel.textColor = .vfBlack
            originLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        }
    }
    
    @IBOutlet weak var stopsLabel: UILabel! {
        didSet{
            stopsLabel.textColor = .vfGrey2
            stopsLabel.font = UIFont(name: "HelveticaNeue", size: 14)
            stopsLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var infoTripStackView: UIStackView!
    
    func configureAdditionalInfo(time: String, seats: Int) {
        infoTripStackView.subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        let timeLabel = AttributeView()
        timeLabel.attributeTitle.text = "Hora:"
        timeLabel.attributeValue.text = "\(time)"
        infoTripStackView.addArrangedSubview(timeLabel)
        let seatsLabel = AttributeView()
        seatsLabel.attributeTitle.text = "Plazas:"
        seatsLabel.attributeValue.text = "\(seats)"
        infoTripStackView.addArrangedSubview(seatsLabel)
        let button = UIButton()
        button.setTitle("Reservar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        button.backgroundColor = .vfRed
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didRequestTrip(_:)), for: .touchUpInside)
        infoTripStackView.addArrangedSubview(button)
        layoutIfNeeded()
    }
    
    @objc func didRequestTrip(_ sender: UIButton) {
        if let id = tripId {
            delegate?.tripRequested(sender: sender, tripId: id)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
}
