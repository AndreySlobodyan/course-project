//
//  WatchLaterViewController.swift
//  TMDb
//
//  Created by mac on 11.04.2023.
//

import UIKit

class WatchLaterViewController: UIViewController {
    
    
    
    var movies: [MovieUImodel] = []
    
    
    @IBOutlet weak var TableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        movies = DataManager.shared.getMovi()
        TableView.reloadData()
        
    }
    
    
    
}


extension WatchLaterViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = movies[indexPath.row].title
        
        cell.backgroundView = nil
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete {
            
            
            DataManager.shared.deleteMovis(id: movies[indexPath.row].id)
            
            movies.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
}









