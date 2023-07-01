//
//  ViewController.swift
//  TMDb
//
//  Created by mac on 25.03.2023.
//

import UIKit

class MovisViewController: UIViewController {
    
    var viewModel: MovisViewModel = MovisViewModel()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var trendingTableView: UITableView!
    @IBOutlet weak var backgraundView: UIImageView!
    
    //MARK: - UIViewController life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellName = String(describing: TrendingMovisTableViewCell.self)
        let cellNib = UINib(nibName: cellName, bundle: nil)
        trendingTableView.register(cellNib, forCellReuseIdentifier: cellName)
        
        if let image = UIImage(named: "BackgraundImage") {
            
            self.backgraundView.image = image
        }
        
        viewModel.loadMovies {
            self.trendingTableView.reloadData()
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
}


extension MovisViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.viewModel.movisList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingMovisTableViewCell",
                                                    for: indexPath) as? TrendingMovisTableViewCell {
            
            cell.configurWith(self.viewModel.movisList[indexPath.row])
            cell.backgroundView = nil
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
    //MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        380
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movi = self.viewModel.movisList[indexPath.row]
    let storiboard = UIStoryboard(name: "Main", bundle: nil)
    if let OverviewView = storiboard.instantiateViewController(withIdentifier: "OverviewViewController")
            as? OverviewViewController {
            OverviewView.modelOverview.movie = movi
            navigationController?.pushViewController(OverviewView , animated: true)
        }
        
    }
    
    
}

