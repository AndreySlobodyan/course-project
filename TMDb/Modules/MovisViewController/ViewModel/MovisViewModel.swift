//
//  MovisViewModel.swift
//  TMDb
//
//  Created by mac on 03.06.2023.
//

import Foundation


class MovisViewModel {
    
    var movisList: [Movie] = []
    
    
    
    func loadMovies(competion: @escaping (()->())){
        NetworkManager.shared.requestTrandingMovies { movies in
            self.movisList = movies
            competion()
        }
    }
}








