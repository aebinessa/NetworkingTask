//
//  NetworkManager.swift
//  PetsTask
//
//  Created by Abdullah Bin Essa on 3/4/24.
//

import Foundation
import Alamofire

class NetworkManager {
        private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
    static let shared = NetworkManager()
    
    func fetchPets(completion: @escaping ([Pet]?) -> Void) {
        
        AF.request(baseURL).responseDecodable(of: [Pet].self) { response in
            
            switch response.result {
                case .success(let pets):
                    completion(pets)
                case .failure(let error):
                    print(error)
                    completion(nil)
            }

        }

    }
    
    func addPet(pet: Pet, completion: @escaping (Bool) -> Void) {
        
        AF.request(baseURL, method: .post, parameters: pet, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
            }

        }

    }
}
