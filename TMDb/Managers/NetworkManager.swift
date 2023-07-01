//
//  NetworkManager.swift
//  TMDb
//
//  Created by mac on 25.03.2023.
//

import Foundation
import Alamofire


struct NetworkManager  {
    
    static let shared = NetworkManager()
    
    private init(){}
    
    
    func requestTrandingMovies (completion: @escaping (([Movie])-> ())) {
        
        let url = Constants.Network.defaultPath + Constants.Network.movieTrendingDay +
        Constants.Network.apiKey
        
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                if let jsonData = data {
                    do {
                        let movies = try decoder.decode(JSONResponce.self, from: jsonData).results ?? []
                        completion(movies)
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    func requestVideo(_ Id: Int, completion: @escaping(([Video]) -> ())) {
        
        let url = Constants.Network.defaultPath + "movie/\(Id)/videos?api_key=" + Constants.Network.apiKey
        
        AF.request(url).responseJSON { response in
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(MovieVideosResult.self, from: response.data!) {
                let videos =  data.videos ?? []
                completion(videos)
            }
        }
        
        
    }
}




















//        AF.request(url).responseJSON { responce in
//            let decoder = JSONDecoder()
//
//            if let data = try? decoder.decode(JSONResponce.self, from: responce.data!){
//
//                let movies = data.results ?? []
//
//                completion(movies)
//            }
//
//
//        }
//    }



