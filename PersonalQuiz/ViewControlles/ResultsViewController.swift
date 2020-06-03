//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    // MARK: - 3. Отобразить результаты на экране
    @IBOutlet weak var youAnimalLabel: UILabel!
    @IBOutlet weak var descriptionsAnimalLabel: UILabel!
    
    @IBOutlet weak var barbuttom: UINavigationItem!
    
    // MARK: - 1. Передать массив с ответами на этот экран
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 4. Избавится от кнопки back
        navigationItem.hidesBackButton = true
        
        // MARK: - 2. Определить наиболее часто встречающийся тип животного
        let animal = getSortedAnimals(for: answers)
        youAnimalLabel.text = String(getEmoji(for: animal))
        descriptionsAnimalLabel.text = getDescriptions(for: animal)
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    
    private func getSortedAnimals(for list: [Answer]) -> AnimalType? {
        var animals = [AnimalType.cat : 0,
                       AnimalType.dog : 0,
                       AnimalType.rabbit : 0,
                       AnimalType.turtle : 0]
        for answer in list {
            animals[answer.type]! += 1
        }
        
        let sortAnimals = animals.sorted { $0.1 < $1.1 }
        let topAnimal = sortAnimals.first?.key
        
        return topAnimal
    }
    
    private func getDescriptions(for sortAnimal: AnimalType?) -> String {
        switch sortAnimal! {
        case AnimalType.cat:
            return AnimalType.cat.definition
        case AnimalType.dog:
            return AnimalType.dog.definition
        case AnimalType.rabbit:
            return AnimalType.rabbit.definition
        case AnimalType.turtle:
            return AnimalType.turtle.definition
        }
    }
    
    private func getEmoji(for sortAnimal: AnimalType?) -> Character {
        switch sortAnimal! {
        case AnimalType.cat:
            return AnimalType.cat.rawValue
        case AnimalType.dog:
            return AnimalType.dog.rawValue
        case AnimalType.rabbit:
            return AnimalType.rabbit.rawValue
        case AnimalType.turtle:
            return AnimalType.turtle.rawValue
        }
    }
    
}
