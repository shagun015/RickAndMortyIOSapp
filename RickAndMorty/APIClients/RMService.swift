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
    
    /// send rick and morty call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: the type of object  we expected to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,expecting type: T.Type,
                                    completion: @escaping (Result<String,Error>)-> Void){
            
        
    }
}
