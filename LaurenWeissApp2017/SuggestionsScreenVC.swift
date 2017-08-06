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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

        tableView.delegate = self
        tableView.dataSource = self
        
    }

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
        self?.tableView.reloadData()
    }
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
