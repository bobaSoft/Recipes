//
//  RecipesResult.swift
//  Recipes
//
//  Created by Михаил Бобров on 17.02.2022.
//

import Foundation

struct RecipesResult: Codable {
    
    let id: Int?
    let title: String?
    let image: String?
    
    init?(json: [String:Any]) {
        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let image = json["image"] as? String
        else { return nil }
        
        self.id = id
        self.title = title
        self.image = image
    }
    
    // MARK: - Functions wich cast JSON.
    static func getArray(from jsonDitcionary: Any) -> [RecipesResult]? {
        guard
            let jsonDictionary = jsonDitcionary as? Dictionary<String, Any>,
            let jsonArray = jsonDictionary["results"] as? Array<[String:Any]>
        else { return nil}
        return jsonArray.compactMap{RecipesResult(json: $0)}
    }
}
