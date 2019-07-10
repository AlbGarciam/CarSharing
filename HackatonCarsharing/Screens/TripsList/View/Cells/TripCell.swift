//
//  TripCell.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {
    
    static let reuseId: String = "TripCell"
    let grey = UIColor(red: 102, green: 102, blue: 102, alpha: 1)
    let red = UIColor(red: 230, green: 0, blue: 0, alpha: 1)
    let black = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.textColor = red
            titleLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
            titleLabel.textAlignment = .left
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.textColor = grey
            dateLabel.font = UIFont(name: "Helvetica", size: 16)
            dateLabel.textAlignment = .right
        }
    }
    
    @IBOutlet weak var separatorView: UIView!{
        didSet{
            separatorView.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 1)
        }
    }
    
    @IBOutlet weak var originLabel: UILabel!{
        didSet{
            originLabel.textColor = black
            originLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        }
    }
    
    @IBOutlet weak var stopsLabel: UILabel! {
        didSet{
            stopsLabel.textColor = grey
            stopsLabel.font = UIFont(name: "Helvetica", size: 16)
            stopsLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var infoTripStackView: UIStackView!
    
    func configureAdditionalInfo(time: String, seats: Int) {
        if infoTripStackView.subviews.count == 0 {
            let time = AttributeView()
            time.attributeTitle.text = "Hora:"
            time.attributeValue.text = "\(time)"
            infoTripStackView.addArrangedSubview(time)
            let seats = AttributeView()
            seats.attributeTitle.text = "Plazas:"
            seats.attributeValue.text = "\(seats)"
            infoTripStackView.addArrangedSubview(seats)
            let button = UIButton()
            button.setTitle("Reservar", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
            button.backgroundColor = .red
            button.layer.cornerRadius = 6
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(didRequestTrip(_:)), for: .touchUpInside)
            infoTripStackView.addArrangedSubview(button)
        }
    }
    
    @objc func didRequestTrip(_ sender: UIButton) {
        
    }
}
