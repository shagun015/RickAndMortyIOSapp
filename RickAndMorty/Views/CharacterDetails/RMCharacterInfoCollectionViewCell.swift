//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Shagun on 24/03/23.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifer = "RMCharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    private let tittleLabel: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    private let iconImageView: UIImageView =  {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false;
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    private let tittleContainerView: UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(tittleContainerView,valueLabel,iconImageView)
        tittleContainerView.addSubview(tittleLabel)
        setUpConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            tittleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tittleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tittleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tittleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            tittleLabel.leftAnchor.constraint(equalTo: tittleContainerView.leftAnchor),
            tittleLabel.rightAnchor.constraint(equalTo: tittleContainerView.rightAnchor),
            tittleLabel.topAnchor.constraint(equalTo: tittleContainerView.topAnchor),
            tittleLabel.bottomAnchor.constraint(equalTo: tittleContainerView.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 35),
            
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor,constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: tittleContainerView.topAnchor)
        ])
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        tittleLabel.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        tittleLabel.textColor = .label
    }
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel){
        tittleLabel.text = viewModel.tittle
        valueLabel.text = viewModel.displayValue
        iconImageView.image = viewModel.iconImage
        iconImageView.tintColor = viewModel.tintColor
        tittleLabel.textColor = viewModel.tintColor
        
    }
}
