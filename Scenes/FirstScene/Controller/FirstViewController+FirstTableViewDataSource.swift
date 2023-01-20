//
//  FirstViewController+FirstTableViewDataSource.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import UIKit

extension FirstViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as? FirstTableViewCell else {fatalError("FirstTableViewCell not found")}
        
        cell.label.text = viewModel.titleForRow(indexPath.row)
        collectionView.reloadItems(at: [indexPath])
        
        cell.layer.cornerRadius = 9.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    
}
