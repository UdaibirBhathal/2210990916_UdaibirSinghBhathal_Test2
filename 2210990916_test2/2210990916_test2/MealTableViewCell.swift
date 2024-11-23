//
//  MealTableViewCell.swift
//  2210990916_test2
//
//  Created by Udaibir Singh Bhathal on 23/11/24.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    
    @IBOutlet var thumbnailView: UIImageView!
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var calorieCount: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton){
        guard let recipeName = recipeName.text, let calorieCount = calorieCount.text, let preparationTime = timeLabel.text else { return }
        let message = "Name: \(recipeName), Calorie: \(calorieCount), Preparation Time: \(preparationTime)"
        let activityController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        if let currentVC = self.window?.rootViewController {
            currentVC.present(activityController, animated: true)
        }
    }
    
    func updateUI(meal: Meal){
        recipeName.text = meal.name
        calorieCount.text = "\(meal.calorieCount) calories"
        timeLabel.text = "\(meal.preparationTime)"
        thumbnailView.image = UIImage(named: meal.thumbnail) ?? UIImage(named: "default")
    }
    
}
