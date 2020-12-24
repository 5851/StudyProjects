//
//  ModelDetail.swift
//  HomeWork9
//
//  Created by MAC on 24.12.2020.
//

import SwiftUI
import CoreML
import Vision

struct ModelDetail: View {

    // MARK: - Properties
    let model: Model
    @State var typeFood = ""
    @State var percent = ""
    @State var result = "Да"

    // MARK: - Body
    var body: some View {
        VStack {
            Image(model.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)

            HStack {
                VStack {
                    Text("Это пельмени?")
                    Text(typeFood)
                }

                Spacer()

                VStack {
                    Text("Вероятность?")
                    Text(percent)
                }
            }
            .padding([.leading, .trailing], 30)

            Spacer()
            Button {
                self.identifyModel()
            } label: {
                Text("Идентифицировать")
            }
        } // VStack
        .navigationBarTitle(Text(model.name), displayMode: .inline)
    }

    // MARK: - Core ML
    func identifyModel() {
        let error = buildAndRunClassificationRequest(imageName: model.imageName)
        if (error != nil) {
            print(error!)
        }
    }

    func buildAndRunClassificationRequest(imageName: String)  -> NSError? {

        var analysisRequests = [VNRequest]()
        let visionQueue = DispatchQueue(label: "Main queue")
        let image = UIImage(named: imageName)
        let error: NSError! = nil

        guard let objectRecognition = createClassificationRequest() else {
            return NSError(domain: "ModelDetail", code: -1,
                           userInfo: [NSLocalizedDescriptionKey: "The classification request failed."])
        }
        analysisRequests = ([objectRecognition])
        let requestHandler = VNImageRequestHandler(data: (image?.pngData())!, options: [:])
        visionQueue.async {
            do {
                try requestHandler.perform(analysisRequests)
            } catch {
                print("Error: Vision request failed with error \"\(error)\"")
            }
        }
        return error
    }

    func createClassificationRequest() -> VNCoreMLRequest? {
        do {
            let objectClassifier = try VNCoreMLModel(for: MLModel(contentsOf: PelmeniModel.urlOfModelInThisBundle))
            let classificationRequest = VNCoreMLRequest(model: objectClassifier, completionHandler: { (request, error) in
                if let results = request.results as? [VNClassificationObservation] {
                    self.typeFood = results.first!.identifier
                    self.percent = "\(results.first!.confidence * 100) %"
                }
            })
            return classificationRequest

        } catch let error as NSError {
            print("Model failed to load: \(error).")
            return nil
        }
    }
}
