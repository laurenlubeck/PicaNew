//
//  EmbedlyModel.swift
//  PicaAPIs
//
//  Created by Lauren Lubeck  on 3/16/15.
//  Copyright (c) 2015 Lauren Lubeck. All rights reserved.
//

import Foundation

class EmbedlyModel: NSObject, Printable {
    let storyName: String
    let storyURL: String
    let storyContent: String
    // let storyPhoto:
    
    override var description: String {
        return "Name: \(storyName), URL: \(storyURL), Content:\(storyContent)"
    }
    
    init(storyName: String?, storyURL: String?, storyContent: String?) {
        self.storyName = storyName ?? ""
        self.storyURL = storyURL ?? ""
        self.storyContent = storyContent ?? ""
    }
}