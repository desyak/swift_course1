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
        bigPhoto2.isHidden = false
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
        recogniser1.direction =  .right
        let recogniser2 = UISwipeGestureRecognizer(target: self, action: #selector(photoPinch1(gesture: )))
        recogniser2.direction = .left
        //recogniser1.maximumNumberOfTouches = 1
        bigPhoto2.addGestureRecognizer(recogniser2)
        bigPhoto2.addGestureRecognizer(recogniser1)
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func photoPinch1(gesture: UISwipeGestureRecognizer) {
        let direction = gesture.direction
        

        if direction == .left {
            if rowIndex! <= (photos.count - 2) {
                rowIndex! += 1
                backImage = photos[rowIndex!].idPhoto
                bigPhoto2.image = backImage
                let swipeLeftOld = CABasicAnimation(keyPath: "position.x")
                swipeLeftOld.toValue = 0 - view.frame.size.width/2
                //swipeRightOld.duration = 1
                let scaleLeftOld = CABasicAnimation(keyPath: "transform.scale")
                scaleLeftOld.fromValue = 1
                scaleLeftOld.toValue = 0.8
                //scaleOld.duration = 2
                let swipeGroupLeftOld = CAAnimationGroup()
                swipeGroupLeftOld.duration = 1
                swipeGroupLeftOld.animations = [swipeLeftOld, scaleLeftOld]
                bigPhoto2.layer.add(swipeGroupLeftOld, forKey: nil)
                
                let swipeLeftNew = CABasicAnimation(keyPath: "position.x")
                swipeLeftNew.toValue =  view.frame.size.width/2
                swipeLeftNew.fromValue = view.frame.size.width + view.frame.size.width/2
                //swipeRightNew.duration = 1
                let scaleLeftNew = CABasicAnimation(keyPath: "transform.scale")
                scaleLeftNew.fromValue = 0.8
                scaleLeftNew.toValue = 1
                //scaleNew.duration = 2
                let swipeGroupLeftNew = CAAnimationGroup()
                swipeGroupLeftNew.animations = [swipeLeftNew, scaleLeftNew]
                swipeGroupLeftNew.duration = 1
                bigPhoto1.layer.add(swipeGroupLeftNew, forKey: nil)
                
                

                
            } else {
                rowIndex = 0
                backImage = photos[0].idPhoto
                bigPhoto2.image = backImage
                let swipeLeftOld = CABasicAnimation(keyPath: "position.x")
                swipeLeftOld.toValue = 0 - view.frame.size.width/2
                //swipeRightOld.duration = 1
                let scaleLeftOld = CABasicAnimation(keyPath: "transform.scale")
                scaleLeftOld.fromValue = 1
                scaleLeftOld.toValue = 0.8
                //scaleOld.duration = 2
                let swipeGroupLeftOld = CAAnimationGroup()
                swipeGroupLeftOld.duration = 1
                swipeGroupLeftOld.animations = [swipeLeftOld, scaleLeftOld]
                bigPhoto2.layer.add(swipeGroupLeftOld, forKey: nil)
                
                let swipeLeftNew = CABasicAnimation(keyPath: "position.x")
                swipeLeftNew.toValue =  view.frame.size.width/2
                swipeLeftNew.fromValue = view.frame.size.width + view.frame.size.width/2
                //swipeRightNew.duration = 1
                let scaleLeftNew = CABasicAnimation(keyPath: "transform.scale")
                scaleLeftNew.fromValue = 0.8
                scaleLeftNew.toValue = 1
                //scaleNew.duration = 2
                let swipeGroupLeftNew = CAAnimationGroup()
                swipeGroupLeftNew.animations = [swipeLeftNew, scaleLeftNew]
                swipeGroupLeftNew.duration = 1
                bigPhoto1.layer.add(swipeGroupLeftNew, forKey: nil)
                
            }
        } else if direction == .right {
            if rowIndex! != 0 {
                rowIndex! -= 1
                backImage = photos[rowIndex!].idPhoto
                bigPhoto2.image = backImage
                let swipeRightOld = CABasicAnimation(keyPath: "position.x")
                swipeRightOld.toValue = view.frame.size.width + view.frame.size.width/2
                //swipeRightOld.duration = 1
                let scaleRightOld = CABasicAnimation(keyPath: "transform.scale")
                scaleRightOld.fromValue = 1
                scaleRightOld.toValue = 0.8
                //scaleOld.duration = 2
                let swipeGroupRightOld = CAAnimationGroup()
                swipeGroupRightOld.duration = 1
                swipeGroupRightOld.animations = [swipeRightOld, scaleRightOld]
                bigPhoto2.layer.add(swipeGroupRightOld, forKey: nil)
                
                let swipeRightNew = CABasicAnimation(keyPath: "position.x")
                swipeRightNew.toValue =  view.frame.size.width/2
                swipeRightNew.fromValue = 0 - view.frame.size.width/2
                swipeRightNew.duration = 1
                let scaleRightNew = CABasicAnimation(keyPath: "transform.scale")
                scaleRightNew.fromValue = 0.8
                scaleRightNew.toValue = 1
                //scaleNew.duration = 2
                let swipeGroupRightNew = CAAnimationGroup()
                swipeGroupRightNew.animations = [swipeRightNew, scaleRightNew]
                swipeGroupRightNew.duration = 1
                bigPhoto1.layer.add(swipeGroupRightNew, forKey: nil)
                
                
            } else {
                rowIndex = (photos.count - 1)
                backImage = photos[rowIndex!].idPhoto
                bigPhoto2.image = backImage
                let swipeRightOld = CABasicAnimation(keyPath: "position.x")
                swipeRightOld.toValue = view.frame.size.width + view.frame.size.width/2
                //swipeRightOld.duration = 1
                let scaleRightOld = CABasicAnimation(keyPath: "transform.scale")
                scaleRightOld.fromValue = 1
                scaleRightOld.toValue = 0.8
                //scaleOld.duration = 2
                let swipeGroupRightOld = CAAnimationGroup()
                swipeGroupRightOld.duration = 1
                swipeGroupRightOld.animations = [swipeRightOld, scaleRightOld]
                bigPhoto2.layer.add(swipeGroupRightOld, forKey: nil)
                
                let swipeRightNew = CABasicAnimation(keyPath: "position.x")
                swipeRightNew.toValue =  view.frame.size.width/2
                swipeRightNew.fromValue = 0 - view.frame.size.width/2
                //swipeRightNew.duration = 1
                let scaleRightNew = CABasicAnimation(keyPath: "transform.scale")
                scaleRightNew.fromValue = 0.8
                scaleRightNew.toValue = 1
                //scaleNew.duration = 2
                let swipeGroupRightNew = CAAnimationGroup()
                swipeGroupRightNew.animations = [swipeRightNew, scaleRightNew]
                swipeGroupRightNew.duration = 1
                bigPhoto1.layer.add(swipeGroupRightNew, forKey: nil)
            }
        }
        photoNumber.currentPage = rowIndex!
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


