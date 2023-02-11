//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Shagun on 27/12/22.
//

import Foundation


//https://rickandmortyapi.com/api
/// object that represent single API call
final class RMRequest {
    /// API constants
    
    private struct Constants{
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    ///Desired endpoint
    private let endpoint: RMEndpoint
    /// path components for API if any
    private let pathComponents: [String]
    /// query arguments for API if any
    private let queryParameters: [URLQueryItem]
    
   
    /// constructed url for the api request in string format
    private var urlString: String{
        var string = Constants.baseURL
        string+="/"
        string+=endpoint.rawValue
        
        if !pathComponents.isEmpty{
            
            pathComponents.forEach({
                string+="/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            string+="?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else{
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
           string+=argumentString
        }
        return string
    }
    
    ///Desired http method
    public let httpMethod = "GET"
     
    /// computed and constructed API URL
    public var url: URL?{
        return URL(string: urlString)
    }
    
    /// construct request
    /// - Parameters:
    ///   - endpoint: target endpoint
    ///   - pathComponents: collection of path components
    ///   - queryParameters: collection query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url:URL){
        let string = url.absoluteString
        if !string.contains(Constants.baseURL){
            return nil
            
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseURL+"/", with: "")
        if trimmed.contains("/"){
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty{
                let endpointString = components[0]
                if let rmEndpoint = RMEndpoint(rawValue: endpointString){
                    self.init(endpoint: rmEndpoint)
                    return
                }
            }
        }
        else if trimmed.contains("?"){
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count>=2{
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else{
                        return nil
                    }
                    let part = $0.components(separatedBy: "=")
                    return URLQueryItem(name: part[0], value: part[1])
                })
                if let rmEndpoint = RMEndpoint(rawValue: endpointString){
                    self.init(endpoint: rmEndpoint,queryParameters: queryItems )
                    return
                }
            }
        }
        return nil
    }
    
    
    
}

extension RMRequest{
    static let listCharacterRequests = RMRequest(endpoint: .character )
}
