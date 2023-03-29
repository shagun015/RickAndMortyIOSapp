//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Shagun on 29/03/23.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {

    private let url: URL?
    init(url: URL?){
        self.url = url
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
    }
    

}
