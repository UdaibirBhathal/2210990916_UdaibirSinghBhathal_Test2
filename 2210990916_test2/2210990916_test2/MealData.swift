//
//  MealData.swift
//  2210990916_test2
//
//  Created by Udaibir Singh Bhathal on 23/11/24.
//

import Foundation


struct Meal{
    var name: String
    var calorieCount: String
    var preparationTime: String
    var category: String
    var thumbnail: String
}

var meals: [Meal] = [
    Meal(name: "Pancakes", calorieCount: "350", preparationTime: "15 min", category: "Vegetarian", thumbnail: "pancakes"),
    Meal(name: "Salad", calorieCount: "250", preparationTime: "10 min", category: "Non-Vegetarian", thumbnail: "salad"),
]
