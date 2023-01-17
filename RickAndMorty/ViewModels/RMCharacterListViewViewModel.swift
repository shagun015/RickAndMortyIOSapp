//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Shagun on 13/01/23.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject{
    
    func fetchCharacters(){
        RMService.shared.execute(.listCharacterRequests,expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("example image url:"+String(model.results.first?.image ?? "no image"))
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as?RMCharacterCollectionViewCell else{
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Shagun", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = UIScreen.main.bounds
        let width = (bound.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
}
