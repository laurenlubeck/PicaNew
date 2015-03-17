//
//  kimonoWorldNews.swift
//  
//
//  Created by Lauren Lubeck  on 3/11/15.
//
//


import Foundation

let WorldNewsURL = "https://www.kimonolabs.com/api/c3n2vkue?apikey=3MAFVw8HV8unxmVRt4ICqU0sdOVLbv1L"

class WorldNewsDataManager {
    
    class func getTopStoriesDataFromFileWithSuccess(success: ((worldNewsData: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: WorldNewsURL)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(worldNewsData: urlData)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.laurenlubeck", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}