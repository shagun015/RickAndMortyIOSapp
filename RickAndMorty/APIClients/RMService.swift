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
    ///   - completion: callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping ()-> Void){
            
        
    }
}
