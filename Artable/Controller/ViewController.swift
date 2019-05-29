//
//  ViewController.swift
//  Artable
//
//  Created by Eric Barnes on 5/24/19.
//  Copyright © 2019 Eric Barnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: Storyboards.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardIDs.LoginVC)
        present(controller, animated: true, completion: nil)
    }


}

