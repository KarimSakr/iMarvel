//
//  DetailsPresenter.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailsPresentationLogic {
    func didGetCharacters(_ model: Response<[Character]>) -> DetailsModels.ViewModels.Character
    
    func didGetComics(_ model: Response<[Comic]>) -> [DetailsModels.ViewModels.Comic]
    
    func didGetStories(_ model: Response<[Story]>) -> [DetailsModels.ViewModels.Story]
    
    func didGetSeries(_ model: Response<[Series]>) -> [DetailsModels.ViewModels.Series]
    
    func didGetEvents(_ model: Response<[Event]>) -> [DetailsModels.ViewModels.Event]
    
    func showError(error: any Error)
}

class DetailsPresenter: DetailsPresentationLogic {
    weak var viewController: DetailsDisplayLogic?
    
    func didGetCharacters(_ model: Response<[Character]>) -> DetailsModels.ViewModels.Character {
        guard model.code == 200, let characters = model.data.results else {
            return DetailsModels.ViewModels.Character(name: "", id: "", thumbnailUrl: "", desription: "")
        }
        
        guard let character = characters.first else { return DetailsModels.ViewModels.Character(name: "", id: "", thumbnailUrl: "", desription: "") }
        
        return DetailsModels.ViewModels.Character(name: character.name,
                                                  id: String(character.id),
                                                  thumbnailUrl: character.thumbnail.path + "." + character.thumbnail.ext,
                                                  desription: character.description)
    }
    
    func didGetComics(_ model: Response<[Comic]>) -> [DetailsModels.ViewModels.Comic] {
        guard model.code == 200, let comics = model.data.results else {
            return [DetailsModels.ViewModels.Comic(thumbnailUrl: "", title: "")]
        }
        return comics.map{ self.createSingleComic(comic: $0)}
    }
    
    private func createSingleComic(comic: Comic) -> DetailsModels.ViewModels.Comic {
        return DetailsModels.ViewModels.Comic(thumbnailUrl: comic.thumbnail.path + "." + comic.thumbnail.ext, title: comic.title)
    }
    
    func didGetStories(_ model: Response<[Story]>) -> [DetailsModels.ViewModels.Story] {
        guard model.code == 200, let stories = model.data.results else {
            return [DetailsModels.ViewModels.Story(thumbnailUrl: "", title: "")]
        }
        return stories.map{ self.createSingleStory(story: $0)}
    }
    
    private func createSingleStory(story: Story) -> DetailsModels.ViewModels.Story {
        return DetailsModels.ViewModels.Story(thumbnailUrl: story.thumbnail, title: story.title)
    }
    
    func didGetSeries(_ model: Response<[Series]>) -> [DetailsModels.ViewModels.Series] {
        guard model.code == 200, let series = model.data.results else {
            return [DetailsModels.ViewModels.Series(thumbnailUrl: "", title: "")]
        }
        return series.map{ self.createSingleSeries(series: $0)}
    }
    
    private func createSingleSeries(series: Series) -> DetailsModels.ViewModels.Series {
        return DetailsModels.ViewModels.Series(thumbnailUrl: series.thumbnail.path + "." + series.thumbnail.ext, title: series.title)
    }
    
    func didGetEvents(_ model: Response<[Event]>) -> [DetailsModels.ViewModels.Event] {
        guard model.code == 200, let events = model.data.results else {
            return [DetailsModels.ViewModels.Event(thumbnailUrl: "", title: "")]
        }
        return events.map{ self.createSingleEvent(event: $0)}
    }
    
    private func createSingleEvent(event: Event) -> DetailsModels.ViewModels.Event {
        return DetailsModels.ViewModels.Event(thumbnailUrl: event.thumbnail.path + "." + event.thumbnail.ext, title: event.title)
    }
    
    func showError(error: any Error) {
        viewController?.showError(error: error)
    }
    
   
}