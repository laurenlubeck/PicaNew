//
//  ViewController.swift
//  Pica
//
//  Created by Vivek Sudarsan on 3/9/15.
//  Copyright (c) 2015 Vivek Sudarsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    var articleTitles:[String] = ["Hello","My Name","Is Vivek"]
    var currentIndex = 0
    var json: NSDictionary?
    var menu = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController.dataSource = self
        pageViewController.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);

        

        pageViewController.didMoveToParentViewController(self)
        
        var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        
        view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        

        
        if let url = NSURL(string: "http://mashable.com/stories.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                var jsonError: NSError?
                
                if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
                    self.json = jsonDict
                    // Required! We must update the UI only on the main queue, but this completion handler gets run in the background queue!
                    dispatch_async(dispatch_get_main_queue(), {
                        let startingViewController: ContentController = self.viewControllerAtIndex(0)!
                        let viewControllers: NSArray = [startingViewController]
                        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
                        
                        
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                        
                       
                        
                    })
                }
                

            })
            
            
            // Required to start the network task
            task.resume()
        }
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.view.addSubview(self.menu)
        menu.setTranslatesAutoresizingMaskIntoConstraints(false)
        menu.image = UIImage(named: "menu.png")
        view.addConstraint(NSLayoutConstraint(item: menu, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 30))
        view.addConstraint(NSLayoutConstraint(item: menu, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: menu, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.08, constant: 0))
        menu.contentMode = UIViewContentMode.ScaleAspectFit
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as ContentController).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as ContentController).pageIndex
        var articleCount:Int!
        
        if index == NSNotFound {
            return nil
        }
        
        index++
        
        if let json = self.json {
            if let newItem = json["hot"] as? NSArray {
                articleCount = newItem.count
            }
        }
        
        if (index == articleCount) {
            return nil
        }
        
        println(articleCount)
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentController?
    {

        let pageContentViewController = ContentController()
        
        if let json = self.json {
            if let newItem = json["hot"] as? NSArray {
                if let newRow = newItem[index] as? NSDictionary {
                    if let title = newRow["title"] as? NSString {
                        println(title)
                        pageContentViewController.titleText = title
                    }
                }
            }
        }
        
        if let json = self.json {
            if let newItem = json["hot"] as? NSArray {
                if let newRow = newItem[index] as? NSDictionary {
                    if let image = newRow["image"] as? NSString {
                        pageContentViewController.imageFile = image
                        if let image = pageContentViewController.imageFile {
                            let url = NSURL(string: image)
                            if let imageURL = url {
                                let data = NSData(contentsOfURL: imageURL)
                                if let dataURL = data{
                                    pageContentViewController.articleImage.image = UIImage(data: dataURL)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        if let json = self.json {
            if let newItem = json["hot"] as? NSArray {
                if let newRow = newItem[index] as? NSDictionary {
                    if let category = newRow["channel"] as? NSString {
                        pageContentViewController.categoryText = category
                    }
                }
            }
        }
        

        
        
        
       
        
      
        
        
        
        pageContentViewController.pageIndex = index
        currentIndex = index
        
        return pageContentViewController
    }
    
    
    
  //  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
   // {
    //    if let json = self.json {
    //        if let newItem = json["hot"] as? NSArray {
    //            println(newItem.count)
     //          return newItem.count
     //       }
     //   }
    //    return 0
  //  }
    
   // func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
   // {
   //     return 0
   // }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

