//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-01.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnboarding") var isOboarding: Bool?
    @State private var image: Image?
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    let filters: [Filter] = Bundle.main.decode("filters.json")
    @State private var showingAlert = false
    @Environment(\.colorScheme) var colorScheme
    
    
    let context = CIContext()
    
    var body: some View {
        
        return NavigationView {
            VStack{
                ZStack{
                    Rectangle()
                        .fill(colorScheme == .light ? Color.white : Color.black)
                    //display the image
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    }else{
                        HStack {
                            Image(systemName: "photo.on.rectangle")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("Tap to select a picture")
                                .font(.headline)
                                .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                            
                        }
                    }
                }
                .onTapGesture{
                    //select an image
                    self.showingImagePicker = true
                }
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing:0){
                        ForEach(filters){ filter in
                                CategoryItem(filter: filter)
                                    .onTapGesture {
                                        transformImage(filterNum: filter.number)
                                    }
                        }
                    }
                }
                .padding(5)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            self.showingImagePicker = true
                        }, label: {
                            Image(systemName: "photo.on.rectangle")
                        })
                    }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(colorScheme == .light ? "logo_title" : "logo_title_white")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        Text("Vanilla")
                            .font(.title.bold())
                    }
                    }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save"){
                        //save the picture
                        guard let processedImage = self.processedImage else { return }

                        let imageSaver = ImageSaver()

                        imageSaver.successHandler = {
                            print("Success!")

                        }

                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }

                        imageSaver.writeToPhotoAlbum(image: processedImage)
                        showingAlert = true

                    }
                    
                    
                }
            }
            .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Photo saved successfully!"), message: Text("Have fun!"), dismissButton: .default(Text("Ok")))
                    }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                ImagePicker(image: self.$inputImage)
            }

        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        
        image = Image(uiImage: inputImage)
    }
    
    
    func transformImage(filterNum : String) {
        //var model: MLModel
        switch filterNum {
        case "1":
            let model = colorMonet()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "2":
            let model = chita()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "3":
            let model = watermelon()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "4":
            let model = glacier()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "5":
            let model = anita()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "6":
            let model = ipanema()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "7":
            let model = Palatnik()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "8":
            let model = azuleijos()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "9":
            let model = Xilo()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "10":
            let model = Flame()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "11":
            let model = glitch()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "12":
            let model = marry()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "13":
            let model = pixel()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        case "14":
            let model = starynight()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        default:
            let model = colorMonet()
            let img = inputImage
            if img != nil{
                do{
                    let predictionOutput = try model.prediction(image: pixelBuffer(from: img!)!)
                    let ciImage = CIImage(cvPixelBuffer: predictionOutput.stylizedImage)
                    let tempContext = CIContext(options: nil)
                    let tempImage = tempContext.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(predictionOutput.stylizedImage), height: CVPixelBufferGetHeight(predictionOutput.stylizedImage)))
                    let uiImage = UIImage(cgImage: tempImage!)
                    //imageAntonio = Image(uiImage: uiImage)
                    let preImage = uiImage.resize(to: img!.size)
                    image = Image(uiImage: preImage!)
                    processedImage = preImage
                    //loadImage()
                }catch let error as NSError {
                    print("CoreML Model Error: \(error)")
                }
            }
        }
        
    }
    
    
    func pixelBuffer(from image: UIImage) -> CVPixelBuffer? {
        // 1
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), true, 2.0)
        image.draw(in: CGRect(x: 0, y: 0, width: 512, height: 512))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
     
        // 2
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, 512, 512, kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return nil
        }
           
        // 3
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
           
        // 4
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: 512, height: 512, bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
           
        // 5
        context?.translateBy(x: 0, y: 512)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        // 6
        UIGraphicsPushContext(context!)
        image.draw(in: CGRect(x: 0, y: 0, width: 512, height: 512))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
            
        return pixelBuffer
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}

