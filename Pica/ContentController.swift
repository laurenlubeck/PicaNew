//
//  ContentController.swift
//  Pica
//
//  Created by Vivek Sudarsan on 3/9/15.
//  Copyright (c) 2015 Vivek Sudarsan. All rights reserved.
//

import UIKit
extension UILabel {
    func kern(kerningValue:CGFloat) {
        self.attributedText =  NSAttributedString(string: self.text ?? "", attributes: [NSKernAttributeName:kerningValue, NSFontAttributeName:font, NSForegroundColorAttributeName:self.textColor])
    }
}

class ContentController: UIViewController {

    var pageIndex : Int = 0
    var titleText: String = ""
    var imageFile: String?
    var categoryText: String = ""
    
    var titleLabel = UILabel()
    var articleImage = UIImageView()
    var bottomShadow = UIImageView()
    var categoryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.clipsToBounds = true
        
        view.addSubview(articleImage)
        
        view.addSubview(bottomShadow)
        view.addSubview(titleLabel)
        view.addSubview(categoryLabel)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -90))
        view.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.9, constant: 0))
        
        categoryLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        var categoryLeftConstraint = NSLayoutConstraint(item: categoryLabel, attribute: .Left, relatedBy: .Equal, toItem: titleLabel, attribute: .Left, multiplier: 1.0, constant: 0)
        view.addConstraint(NSLayoutConstraint(item: categoryLabel, attribute: .Bottom, relatedBy: .Equal, toItem: titleLabel, attribute: .Top, multiplier: 1.0, constant: -13))
        view.addConstraint(NSLayoutConstraint(item: categoryLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 19))
        view.addConstraint(categoryLeftConstraint)

        
        articleImage.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(item: articleImage, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: articleImage, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: articleImage, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1.0, constant: 0))
        

        bottomShadow.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(item: bottomShadow, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bottomShadow, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bottomShadow, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier:0.7, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bottomShadow, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier:1.0, constant: 0))
    
        categoryLabel.text = "  \(categoryText.uppercaseString)  "
        categoryLabel.backgroundColor = UIColor(red: 0.462, green: 0.0, blue: 1.0, alpha: 1.0)
        categoryLabel.font = UIFont(name: "AvenirNext-Bold", size: 12)
        categoryLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        categoryLabel.sizeToFit()
        categoryLabel.kern(1.0)
        
        titleLabel.text = titleText
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.font = UIFont(name: "Didot", size: 27)
        titleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.numberOfLines = 0
        
        articleImage.layer.cornerRadius = 2.0
        
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 3
        let attributes = [NSParagraphStyleAttributeName : style]
        
        titleLabel.attributedText = NSAttributedString(string: titleLabel.text!, attributes:attributes)
        
        bottomShadow.contentMode = UIViewContentMode.ScaleToFill
        bottomShadow.image = UIImage(named: "bottomshadow.png")
        
        
        articleImage.contentMode = UIViewContentMode.ScaleAspectFill
        
//        if let image = imageFile {
//            let url = NSURL(string: image)
//            if let imageURL = url {
//                let data = NSData(contentsOfURL: imageURL)
//                if let dataURL = data{
//                    articleImage.image = UIImage(data: dataURL)
//                }
//            }
//        }

        
        
        
        //articleImage.image = UIImage(contentsOfFile: "\(imageFile)")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
