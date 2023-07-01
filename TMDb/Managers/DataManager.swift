//
//  File.swift
//  TMDb
//
//  Created by mac on 04.04.2023.
//

import Foundation

import RealmSwift




struct DataManager{
    
    static let shared = DataManager()
    
    private init() { }
    
    
    let realm = try? Realm()
    
    
    
    
    func saveMovie(movie: Movie?) {
        guard let realm = try? Realm() else {
            return
        }
        
        guard let movieID = movie?.id else {
            return
        }
        
        let existingMovie = realm.objects(MovieRealm.self).filter("id = %@", movieID).first
        
        if existingMovie == nil {
            let movieRealm = MovieRealm()
            
            movieRealm.title = movie?.title ?? ""
            movieRealm.popularity = movie?.popularity ?? 0.0
            movieRealm.overview = movie?.overview ?? ""
            movieRealm.id = movieID
            movieRealm.backdropPath = movie?.backdropPath ?? ""
            movieRealm.mediaType = movie?.mediaType ?? ""
            movieRealm.posterPath = movie?.posterPath ?? ""
            
            try? realm.write {
                realm.add(movieRealm)
            }
        }
    }
    
    
    
    
    
    
    func getMovi() -> [MovieUImodel]{
        
        
        
        var movies = [MovieUImodel]()
        
        guard let movieResults = realm?.objects(MovieRealm.self) else {return []}
        
        for movie in movieResults {
            
            let MoveUI = MovieUImodel( title: movie.title,
                                       popularity: movie.popularity,
                                       overview: movie.overview,
                                       id: movie.id,
                                       backdropPath: movie.backdropPath,
                                       mediaType: movie.mediaType,
                                       posterPath: movie.posterPath)
            
            movies.append(MoveUI)
            
        }
        
        return movies
        
    }
    
    
    func deleteMovis(id: Int) {
        
        if let movieToDelete = realm?.objects(MovieRealm.self).filter("id = %@", id ).first {
            
            // Start the write transaction
            try! realm?.write {
                
            // Delete the object from the database
               realm?.delete(movieToDelete)
            }
        }
    }
    
}








//    func deleteAllMovies(id: Int) {
//
//        if let celltodelete = realm?.objects(MovieRealm.self) {
//
//            try! realm?.write {
//
//                realm?.delete(celltodelete)
//            }
//        }








//
//    func deleteAllMovies() {
//        // Получаем экземпляр объекта Realm
//        let realm = try! Realm()
//
//        // Получаем все объекты типа MovieRealm
//        let moviesToDelete = realm.objects(MovieRealm.self)
//
//        // Начинаем транзакцию записи
//        try! realm.write {
//            // Удаляем все объекты из базы данных
//            realm.delete(moviesToDelete)
//        }
//    }













