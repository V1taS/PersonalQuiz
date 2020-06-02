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
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for animal in answers {
            animal.type
            print(animal.type)
        }
        
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }

}
