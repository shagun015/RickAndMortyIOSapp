//
//  RMCharcterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Shagun on 24/03/23.
//

import UIKit

class RMCharcterPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifer = "RMCharcterPhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    public func configure(with viewModel: RMCharcterPhotoCollectionViewCellViewModel){
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)

                }
            case .failure:
                break
            }
        }
    }
}
