//
//  PhotoViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 14.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {


    @IBOutlet var bigPhoto1: UIImageView!
    @IBOutlet var bigPhoto2: UIImageView!
    @IBOutlet var photoNumber: UIPageControl!
    var frontImage: UIImage!
    var backImage: UIImage!
    
    var photos = [Photo]()
    var rowIndex: Int? = nil
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        bigPhoto1.isHidden = false
        bigPhoto2.isHidden = true
        frontImage = photos[rowIndex!].idPhoto
        backImage = photos[rowIndex!].idPhoto
        let imageRatio = frontImage.size.width/frontImage.size.height
        print("width = \(bigPhoto1.frame.size.width)")
        print("height = \(bigPhoto1.frame.size.height)")
        bigPhoto1.frame.size.height = bigPhoto1.frame.size.width * imageRatio
        bigPhoto1.image = frontImage
        
        bigPhoto2.frame.size.height = bigPhoto2.frame.size.width * imageRatio
        bigPhoto2.image = frontImage
        
        photoNumber.numberOfPages = photos.count
        photoNumber.currentPage = rowIndex!
        //let recogniser1 = UIPanGestureRecognizer.init(target: self, action: #selector(photoPinch1(gesture: )))
        
        let recogniser1 = UISwipeGestureRecognizer(target: self, action: #selector(photoPinch1(gesture: )))
        //recogniser1.maximumNumberOfTouches = 1
        bigPhoto1.addGestureRecognizer(recogniser1)
        // Do any additional setup after loading the view.
    }
    
    

    @objc func photoPinch1(gesture: UISwipeGestureRecognizer) {
        let direction = gesture.direction
        //let direction = gesture.translation(in: self.view)
        if direction == .right {
            print("to the rigth")
            if rowIndex! <= (photos.count - 2) {
                backImage = photos[(rowIndex)!+1].idPhoto
                bigPhoto2.image = backImage
                bigPhoto2.isHidden.toggle()
                bigPhoto1.isHidden.toggle()
                UIView.transition(from: bigPhoto1, to: bigPhoto2, duration: 2, options: .curveEaseInOut, completion: nil)
                
            } else {
                backImage = photos[0].idPhoto
                bigPhoto2.image = backImage
                bigPhoto2.isHidden.toggle()
                bigPhoto1.isHidden.toggle()
                UIView.transition(from: bigPhoto1, to: bigPhoto2, duration: 2, options: .curveEaseInOut, completion: nil)
            }
        } else {
            print("to the left")
            if rowIndex! != 0 {
                backImage = photos[(rowIndex)!-1].idPhoto
                bigPhoto2.image = backImage
                bigPhoto2.isHidden.toggle()
                bigPhoto1.isHidden.toggle()
                UIView.transition(from: bigPhoto1, to: bigPhoto2, duration: 2, options: .curveEaseInOut, completion: nil)
                
            } else {
                backImage = photos[(photos.count - 1)].idPhoto
                bigPhoto2.image = backImage
                bigPhoto2.isHidden.toggle()
                bigPhoto1.isHidden.toggle()
                UIView.transition(from: bigPhoto1, to: bigPhoto2, duration: 2, options: .curveEaseInOut, completion: nil)
            }
        }
        view.setNeedsDisplay()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


