//
//  RMService.swift
//  RickAndMorty
//
//  Created by Shagun on 27/12/22.
//

import Foundation


/// Primary APIservice object to get Rick&morty data
final class RMService {
    
    /// shared singleton instance
    static let shared = RMService()
    
    
    /// privatized constructor
    private init() {}
    
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    /// send rick and morty call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: the type of object  we expected to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T,Error>
        )-> Void){
        guard let urlRequest = self.request(from: request) else{
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data,_, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do{
                //let json = try JSONSerialization.jsonObject(with: data)
                //print(String(describing: json))
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest)->URLRequest? {
        
        guard let url = rmRequest.url else{ return nil}
        var request =  URLRequest(url: url)
        
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
