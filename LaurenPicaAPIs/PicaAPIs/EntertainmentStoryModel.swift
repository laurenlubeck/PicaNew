//
//  EntertainmentStoryModel.swift
//  PicaAPIs
//
//  Created by Lauren Lubeck  on 3/16/15.
//  Copyright (c) 2015 Lauren Lubeck. All rights reserved.
//

import Foundation


class EntertainmentStoryModel: NSObject, Printable {
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