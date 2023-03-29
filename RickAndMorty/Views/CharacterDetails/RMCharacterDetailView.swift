//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Shagun on 01/02/23.
//

import UIKit


/// view for single character info
final class RMCharacterDetailView: UIView {
        
    public var collectionView: UICollectionView?
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    //MARK: - init
     init(frame: CGRect,viewwModel: RMCharacterDetailViewViewModel) {
         self.viewModel = viewwModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubviews(collectionView,spinner)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func addConstraints(){
        guard let collectionView = collectionView else{
            return
        }
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

    }
    
    private func createCollectionView()->UICollectionView{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RMCharcterPhotoCollectionViewCell.self,
                                forCellWithReuseIdentifier:  RMCharcterPhotoCollectionViewCell.cellIdentifer)
        collectionView.register(RMCharacterInfoCollectionViewCell.self,
                                forCellWithReuseIdentifier:  RMCharacterInfoCollectionViewCell.cellIdentifer)
        collectionView.register(RMCharcterEpisodeCollectionViewCell.self,
                                forCellWithReuseIdentifier:  RMCharcterEpisodeCollectionViewCell.cellIdentifer)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int)->NSCollectionLayoutSection{
        let sectionType = viewModel.sections
        switch sectionType[sectionIndex] {
        case .photo:
            return viewModel.createPhotoSectionLayout()
        case .information:
            return viewModel.createInfoSectionLayout()
        case .episodes:
            return viewModel.createEpisodeSectionLayout()

        }
        
        
    }
   
   
}
