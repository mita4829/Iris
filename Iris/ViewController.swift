//
//  ViewController.swift
//  Iris
//
//  Created by Michael Tang on 4/22/17.
//  Copyright (c) 2017 Michael Tang. All rights reserved.
//  Tesseract OCR, Lyndsey Scott


import UIKit
import Foundation


class ViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //@IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textView: UITextView!    
    @IBOutlet weak var buttonGuardView: UIView!
    
    
    var activityIndicator:UIActivityIndicatorView!
    var messageToSendToBrailleController = String()
    //var originalTopMargin:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIViewset(); //Debug, sigbrt after shadow draw button press
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        // 1
        
        view.endEditing(true)
        //moveViewDown()
        // 2
        let imagePickerActionSheet = UIAlertController(title: "Snap/Upload Photo",
         message: nil, preferredStyle: .actionSheet)
         // 3
        
         if UIImagePickerController.isSourceTypeAvailable(.camera) {
         let cameraButton = UIAlertAction(title: "Take Photo",
         style: .default) { (alert) -> Void in
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.sourceType = .camera
         self.present(imagePicker,
         animated: true,
         completion: nil)
         }
         imagePickerActionSheet.addAction(cameraButton)
         }
         // 4
        
         let libraryButton = UIAlertAction(title: "Choose Existing",
         style: .default) { (alert) -> Void in
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.sourceType = .photoLibrary
         self.present(imagePicker,
         animated: true,
         completion: nil)
         }
        
         imagePickerActionSheet.addAction(libraryButton)
         // 5
         let cancelButton = UIAlertAction(title: "Cancel",
         style: .cancel) { (alert) -> Void in
         }
         imagePickerActionSheet.addAction(cancelButton)
         // 6
         present(imagePickerActionSheet, animated: true,
         completion: nil)
 
    }
    
    //Camera
    @IBAction func analyzePhoto(_ sender: UIButton) {
        view.endEditing(true)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            //imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            print("Mac cannot support camera")
        }
    }
    
    //Photo Library
    @IBAction func analyzeSavedPhoto(_ sender: UIButton) {
        view.endEditing(true)
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker,animated: true,completion: nil)
    }

    
    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {
        
        var scaledSize = CGSize(width: maxDimension, height: maxDimension)
        var scaleFactor:CGFloat
        
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        image.draw(in: CGRect(x:0, y:0, width:scaledSize.width, height:scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    // Activity Indicator methods
    
    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: view.bounds)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
        activityIndicator = nil
    }
    
    @IBAction func brailleTranslation(_ sender: UIButton) {
        if(textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            let alertController = UIAlertController(title: "Braille Translation", message: "Cannot translation empty text to braille viberations.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "continue", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        //remove newline, spaces, and non-alpnum char
        let lower = textView.text.lowercased()
        let noSpace = lower.replacingOccurrences(of: "\n", with: " ")
        let regex = String(noSpace.characters.filter { "01234567890abcdefghijklmnopqrstuvwxyz ".characters.contains($0) })
        //regex is the string containing no non-alphanum and no newlines
        messageToSendToBrailleController = regex
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController : BrailleController = segue.destination as! BrailleController
        destinationController.messageFromViewController = messageToSendToBrailleController
    }
    
    func performImageRecognition(image: UIImage) {
        // 1
        let tesseract = G8Tesseract()
        // 2
        tesseract.language = "eng+fra"
        // 3
        tesseract.engineMode = .tesseractCubeCombined
        // 4
        tesseract.pageSegmentationMode = .auto
        // 5
        tesseract.maximumRecognitionTime = 60.0
        // 6
        tesseract.image = image.g8_blackAndWhite()
        tesseract.recognize()
        // 7
        textView.text = tesseract.recognizedText
        
        textView.isEditable = true
        // 8
        removeActivityIndicator()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
            let scaledImage = scaleImage(image: selectedPhoto, maxDimension: 640)
            
            addActivityIndicator()
            dismiss(animated: true, completion: {
                self.performImageRecognition(image: scaledImage)
            })
        }
    }
    
    func UIViewset(){
        buttonGuardView.layer.shadowColor = UIColor.black.cgColor
        buttonGuardView.layer.shadowOpacity = 0.5
        buttonGuardView.layer.shadowOffset = CGSize.zero
        buttonGuardView.layer.shadowRadius = 3
        //Cache shadow avoiding redraw
        buttonGuardView.layer.shouldRasterize = true
    }
    
}




