//
//  ConfirmationModel.swift
//  RecipeApp
//
//  Created by Varun Sharma on 31/08/23.
//

import Foundation
import UIKit

struct ConfirmationModel {
    var veggies: [String]
    var herbs: [String]
    var extra: [String]
}


var confirmationModel = ConfirmationModel(
    veggies: [],
    herbs: [],
    extra: []
)

struct RecipeModel {
    var recipe: [String]
    var ingredients: [[String]]
    var image: [UIImage?]
}

var recipeModel = RecipeModel(
    recipe: ["one","two"],
    ingredients: [["one"],["two"]],
    image:  [UIImage(named:"spice"),UIImage(named:"spice")]
)


