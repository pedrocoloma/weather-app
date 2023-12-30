//
//  HourlyForecastCollectionViewCell.swift
//  Weather App
//
//  Created by Pedro Coloma on 29/12/23.
//

import UIKit

protocol ViewCode {
    func setupView()
    func setConstraints()
    func setHierarchy()
}

extension ViewCode {
    func setupView() {
        setHierarchy()
        setConstraints()
    }
}

class HourlyForecastCollectionViewCell: UICollectionViewCell, ViewCode {
    
    static let identifier = "hourlyForeCastCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(time: String?, icon: UIImage?, temp: String?) {
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, iconImageView, temperatureLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.contrastColor?.cgColor
        stack.layer.cornerRadius = 20
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        return stack
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setHierarchy() {
        contentView.addSubview(stackView)
    }
    
    func setConstraints() {
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
