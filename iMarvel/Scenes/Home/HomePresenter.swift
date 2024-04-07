//
//  HomePresenter.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic {
    
    func didGetCharacters(_ model: Response<[Character]>) -> [HomeModels.ViewModels.Character]
    func didGetCachedCharacters(_ cachedCharacters: [CharacterCD]) -> [HomeModels.ViewModels.Character]
    
    func showError(error: Error)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    func didGetCharacters(_ model: Response<[Character]>) -> [HomeModels.ViewModels.Character] {
        
        guard model.code == 200, let characters = model.data.results else {
            return []
        }
        
        return characters.map{
            $0.cache()
            return self.createSingleCharacter(character: $0)
        }
    }
    
    private func createSingleCharacter(character: Character) -> HomeModels.ViewModels.Character {
        return HomeModels.ViewModels.Character(id: character.id,
                                               name: character.name,
                                               thumbnailUrl: character.thumbnail.path + "." + character.thumbnail.ext)
    }
    
    func didGetCachedCharacters(_ cachedCharacters: [CharacterCD]) -> [HomeModels.ViewModels.Character] {
        return cachedCharacters.map{ self.createSingleCachedCharacter(character: $0) }
    }
    
    private func createSingleCachedCharacter(character: CharacterCD) -> HomeModels.ViewModels.Character {
        return HomeModels.ViewModels.Character(id: Int(character.id),
                                               name: character.name,
                                               thumbnailUrl: character.thumbnailURL)
    }
    
    func showError(error: any Error) {
        viewController?.showError(error: error)
    }
    
}
