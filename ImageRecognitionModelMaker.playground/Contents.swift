import CreateML
import Foundation

// Training and test data folder's path
let trainingDataURL = URL(fileURLWithPath: "your_training_folder_path")
let testingDataURL = URL(fileURLWithPath: "your_testing_folder_path")

do {
    // Load training data
    let trainingData = MLImageClassifier.DataSource.labeledDirectories(at: trainingDataURL)
    
    // Create the image classifier
    let classifier = try MLImageClassifier(trainingData: trainingData)
    
    // Save the trained mode
    let modelURL = URL(fileURLWithPath: "path_where_you_want_to_save_the_model.mlmodel")
    try classifier.write(to: modelURL)
    
    print("Model successfully trained and saved!")

    // Evaluate the model with test data
    let testingData = MLImageClassifier.DataSource.labeledDirectories(at: testingDataURL)
    let evaluation = classifier.evaluation(on: testingData)
    
} catch {
    print("An error has occurred: \(error.localizedDescription)")
}


