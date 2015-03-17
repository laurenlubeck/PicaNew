//
//  ViewController.swift
//  PicaAPIs
//
//  Created by Lauren Lubeck  on 3/11/15.
//  Copyright (c) 2015 Lauren Lubeck. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var json: JSON?
    var worldNewsStoryURLArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nibs
        
    pullWorldNews()
//        pullUSNews()
//        pullBusinessNews()
//        pullTechnologyNews()
//        pullEntertainmentNews()
//        pullSportsNews()
//        pullScienceNews()
//        pullHealthNews()
//        pullSpotlightNews()
   //     pullDataFromEmbedly()
    }
    
    
    func pullWorldNews() {
        //WORLD NEWS DATA MANAGER
        WorldNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (worldNewsData) -> Void in
            let json = JSON(data: worldNewsData)
            
            // retrieve list of stories
            if let worldNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [WorldStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in worldNewsStoryURLArray {
                    var storyURL: String? = storyDict["WorldURL"]["href"].stringValue
                    var storyName: String? = storyDict["WorldURL"]["text"].stringValue
                    
                    var story = WorldStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullUSNews() {
        //US NEWS DATA MANAGER
        USNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (usNewsData) -> Void in
            let json = JSON(data: usNewsData)
            
            // retrieve list of stories
            if let usNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [USStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in usNewsStoryURLArray {
                    var storyURL: String? = storyDict["USURL"]["href"].stringValue
                    var storyName: String? = storyDict["USURL"]["text"].stringValue
                    
                    var story = USStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullBusinessNews() {
        //BUSINESS NEWS DATA MANAGER
        BusinessNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (businessNewsData) -> Void in
            let json = JSON(data: businessNewsData)
            
            // retrieve list of stories
            if let businessNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [BusinessStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in businessNewsStoryURLArray {
                    var storyURL: String? = storyDict["BusinessURL"]["href"].stringValue
                    var storyName: String? = storyDict["BusinessURL"]["text"].stringValue
                    
                    var story = BusinessStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullTechnologyNews() {
        //TECHNOLOGY NEWS DATA MANAGER
        TechnologyNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (technologyNewsData) -> Void in
            let json = JSON(data: technologyNewsData)
            
            // retrieve list of stories
            if let technologyNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [TechnologyStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in technologyNewsStoryURLArray {
                    var storyURL: String? = storyDict["technologyURL"]["href"].stringValue
                    var storyName: String? = storyDict["technologyURL"]["text"].stringValue
                    
                    var story = TechnologyStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullEntertainmentNews() {
        //ENTERTAINMENT NEWS DATA MANAGER
        EntertainmentNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (entertainmentNewsData) -> Void in
            let json = JSON(data: entertainmentNewsData)
            
            // retrieve list of stories
            if let entertainmentNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [EntertainmentStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in entertainmentNewsStoryURLArray {
                    var storyURL: String? = storyDict["entertainmentURL"]["href"].stringValue
                    var storyName: String? = storyDict["entertainmentURL"]["text"].stringValue
                    
                    var story = EntertainmentStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullSportsNews() {
        //SPORTS NEWS DATA MANAGER
        SportsNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (sportsNewsData) -> Void in
            let json = JSON(data: sportsNewsData)
            
            // retrieve list of stories
            if let sportsNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [SportsStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in sportsNewsStoryURLArray {
                    var storyURL: String? = storyDict["sportsURL"]["href"].stringValue
                    var storyName: String? = storyDict["sportsURL"]["text"].stringValue
                    
                    var story = SportsStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullScienceNews() {
        //SCIENCE DATA MANAGER
        ScienceNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (scienceNewsData) -> Void in
            let json = JSON(data: scienceNewsData)
            
            // retrieve list of stories
            if let scienceNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [ScienceStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in scienceNewsStoryURLArray {
                    var storyURL: String? = storyDict["scienceURL"]["href"].stringValue
                    var storyName: String? = storyDict["scienceURL"]["text"].stringValue
                    
                    var story = ScienceStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    func pullHealthNews() {
        //HEALTH DATA MANAGER
        HealthNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (healthNewsData) -> Void in
            let json = JSON(data: healthNewsData)
            
            // retrieve list of stories
            if let healthNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [HealthStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in healthNewsStoryURLArray {
                    var storyURL: String? = storyDict["healthURL"]["href"].stringValue
                    var storyName: String? = storyDict["healthURL"]["text"].stringValue
                    
                    var story = HealthStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    
    func pullSpotlightNews() {
        //SPOTLIGHT DATA MANAGER
        SpotlightNewsDataManager.getTopStoriesDataFromFileWithSuccess{ (spotlightNewsData) -> Void in
            let json = JSON(data: spotlightNewsData)
            
            // retrieve list of stories
            if let spotlightNewsStoryURLArray = json["results"]["collection1"].array {
                
                // create mutable array to hold objects
                var stories = [SpotlightStoryModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in spotlightNewsStoryURLArray {
                    var storyURL: String? = storyDict["SpotlightURL"]["href"].stringValue
                    var storyName: String? = storyDict["SpotlightURL"]["text"].stringValue
                    
                    var story = SpotlightStoryModel(storyName: storyName, storyURL: storyURL)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
    
    func pullDataFromEmbedly() {
        // DATA MANAGER
        EmbedlyDataManager.getStoryInfoFromFileWithSuccess{ (embedlyData) -> Void in
            let json = JSON(data: embedlyData)
            
            // retrieve list of stories
            if let embedlyStoryURLArray = json.array {
                
                // create mutable array to hold objects
                var stories = [EmbedlyModel]()
                
                //loop through all the items and create new instacnce of story model
                for storyDict in embedlyStoryURLArray {
                    var storyName: String? = storyDict["title"].stringValue
                    var storyURL: String? = storyDict["url"].stringValue
                    var storyContent: String? = storyDict["content"].stringValue
                    
                    var story = EmbedlyModel(storyName: storyName, storyURL: storyURL, storyContent: storyContent)
                    stories.append(story)
                }
                //print for debugging
                println(stories)
            }
            
        }
    }
    
}

