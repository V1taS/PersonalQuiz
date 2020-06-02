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
        
        barbuttom.leftBarButtonItem?.tintColor = .green
        
        var cat = 0
        var dog = 0
        var rabbit = 0
        var turtle = 0
        
        for animal in answers {
            if animal.type == .cat { cat += 1 }
            if animal.type == .dog { dog += 1 }
            if animal.type == .rabbit { rabbit += 1 }
            if animal.type == .turtle { turtle += 1 }
            print(animal.type)
        }
        
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }

}
