//
//  USStoryModel.swift
//  
//
//  Created by Lauren Lubeck  on 3/16/15.
//
//

import Foundation

class USStoryModel: NSObject, Printable {
    let storyName: String
    let storyURL: String
    
    override var description: String {
        return "Name: \(storyName), URL: \(storyURL)"
    }
    
    init(storyName: String?, storyURL: String?) {
        self.storyName = storyName ?? ""
        self.storyURL = storyURL ?? ""
    }
}