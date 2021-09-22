//
//  myClass.swift
//  iOS_Week_1
//
//  Created by Ege Seçkin on 23.09.2021.
//

import Foundation

class myClass{
    let name: String
    let surname: String
    let age: Int
    
    init(name: String, surname: String, age: Int){
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    func display(){
            print("Your name is \(name) \(surname) and your age is \(age)")
    }
}
