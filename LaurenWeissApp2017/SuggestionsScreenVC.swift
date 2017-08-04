//
//  SuggestionsScreenViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit

class SuggestionsScreenVC: UIViewController {
    var heights = [CGFloat]()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}



extension SuggestionsScreenVC: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionsCell", for: indexPath) as! SuggestionCell
        cell.suggestionsLabel.text = SuggestionsData.suggestionsArray[indexPath.row]
        cell.suggestionsLabel.sizeToFit()
        heights.append(cell.suggestionsLabel.frame.height)
        cell.selectionStyle = .none

        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SuggestionsData.suggestionsArray.count
    }
    
}
