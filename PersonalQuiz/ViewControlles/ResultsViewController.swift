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
    
    @IBOutlet weak var youAnimalLabel: UILabel!
    @IBOutlet weak var descriptionsAnimalLabel: UILabel!
    
    @IBOutlet weak var barbuttom: UINavigationItem!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let answer = getAnswer(for: answers)
        
        youAnimalLabel.text = getEmoji(for: answer)
        descriptionsAnimalLabel.text = getDescription(for: answer)
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    
    // MARK: - Get Answer
    private func getAnswer(for listAnswers: [Answer]) -> Dictionary<AnimalType,
        Int>.Element? {
            
        var animals = [AnimalType.cat : 0,
                       AnimalType.dog : 0,
                       AnimalType.rabbit : 0,
                       AnimalType.turtle : 0]
        
        for answer in listAnswers {
            animals[answer.type]? += 1
        }
        
        guard let answer = animals.sorted(by: { $0.1 < $1.1 }).first else { return nil }
        return answer
    }
    
    // MARK: - Get Description
    private func getDescription(for answer: Dictionary<AnimalType,
        Int>.Element?) -> String {
        guard let description = answer?.key.definition else { return "Error"}
        return description
    }
    
    // MARK: - Get Emoji
    private func getEmoji(for answer: Dictionary<AnimalType, Int>.Element?) -> String {
        guard let emoji = answer?.key.rawValue else { return "Error"}
        return String("Вы - \(emoji)")
    }
}
