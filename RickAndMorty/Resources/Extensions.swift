//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Shagun on 14/01/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
