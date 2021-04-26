//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        
        //MARK: - Locate Json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed To locate \(file) in bundle")
            
        }
        
        //MARK: - Create Property for data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        
        //MARK: - Create a decoder
        
        let decoder = JSONDecoder()
        
        
        //MARK: - Create a property for decoded data
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        
        //MARK: - Return the ready-to-use-data
        return loaded
        
    }
}
