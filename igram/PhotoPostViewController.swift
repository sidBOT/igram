//
//  PhotoPostViewController.swift
//  igram
//
//  Created by siddhant on 2/7/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit
import Parse

class PhotoPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var image: UIImage!
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        photoView.isUserInteractionEnabled = true
        photoView.addGestureRecognizer(tapGestureRecognizer)
        
        photoView.layer.cornerRadius = 8.0
        photoView.clipsToBounds = true
        
        super.viewDidLoad()

    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        photoView.image = originalImage
        dismiss(animated: true, completion: nil)
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: newSize.width, height: newSize.height))
        let resizeImageView = UIImageView(frame: rect)
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    @IBAction func sharePhotoAction(_ sender: Any) {
        let image = resize(image: photoView.image!, newSize: (photoView.image?.size)!)
        let cap = captionTextField.text
        
        Post.postUserImage(image: image, withCaption: cap) { (bool, error) in
            if let error = error {
                print("Error")
                print(error.localizedDescription)
            }else{
                print("saved")
                self.captionTextField.text!.removeAll()
                
            }
            
            
        }
        
    }


}
