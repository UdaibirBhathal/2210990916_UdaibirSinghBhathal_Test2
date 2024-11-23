//
//  AddMealTableViewController.swift
//  2210990916_test2
//
//  Created by Udaibir Singh Bhathal on 23/11/24.
//

import UIKit

class AddMealTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var newMeal: Meal?
    
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var calorieTextField: UITextField!
    @IBOutlet weak var preparationTimeTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var choosePhotoButton: UIButton!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        saveButton.isEnabled = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    func textFieldChanged(){
//        if !recipeNameTextField.isEmpty{
//            saveButton.isEnabled = true
//        }
//    }
    
    func updateUI(){
        guard let meal = newMeal else{
            return
        }
        recipeNameTextField.text = meal.name
        calorieTextField.text = "\(meal.calorieCount) calories"
        preparationTimeTextField.text = meal.preparationTime
        categoryTextField.text = meal.category
//        thumbnailImageView.image = meal.image(URL)thumbnail
    }
    
    @IBAction func textChanged(_ sender: Any) {
        if recipeNameTextField.text != "" && calorieTextField.text != "" && preparationTimeTextField.text != "" && categoryTextField.text != ""{
            saveButton.isEnabled = true
            newMeal = Meal(name: recipeNameTextField.text ?? "", calorieCount: calorieTextField.text ?? "", preparationTime: preparationTimeTextField.text ?? "", category: categoryTextField.text ?? "", thumbnail: "")
        }
        
    }
    
//    init?(coder: NSCoder, newMeal: Meal?){
//        self.newMeal = newMeal
//        super.init(coder: coder)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBAction func choosePhotoButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("User has chosen camera")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)})
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("User has chosen photo library")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(photoLibraryAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        thumbnailImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = recipeNameTextField.text, !name.isEmpty, let calories = Int(calorieTextField.text ?? "0"), let preparationTime = preparationTimeTextField.text, let category = categoryTextField.text else { return }
            performSegue(withIdentifier: "unwindToMealPLan", sender: self)
        
    }
    
    // MARK: - Table view data source
}
