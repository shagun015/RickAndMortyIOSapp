//
//  RMCharcterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Shagun on 24/03/23.
//

import Foundation

final class RMCharcterPhotoCollectionViewCellViewModel{
    private let imageUrl: URL?
    init(imageUrl: URL?){
        self.imageUrl=imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>)->Void){
        guard let imageUrl = imageUrl else{
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl,completion: completion)
    }
}
