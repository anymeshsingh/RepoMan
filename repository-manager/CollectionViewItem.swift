//
//  CollectionViewItem.swift
//  repository-manager
//
//  Created by Animesh Singh on 16/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    @IBOutlet weak var repoName: NSTextField!
    
    var repo: GithubRepo?
    var https_link: String?
    var ssh_link: String?
    //    var imageFile: ImageFile? {
//      didSet {
//        guard isViewLoaded else { return }
//        if let imageFile = imageFile {
//          imageView?.image = imageFile.thumbnail
//          textField?.stringValue = imageFile.fileName
//        } else {
//          imageView?.image = nil
//          textField?.stringValue = ""
//        }
//      }
//    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.wantsLayer = true
//      view.layer?.backgroundColor = NSColor.lightGray.cgColor
        
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        view.layer?.cornerRadius = 3.0
//        repoName.stringValue = "Hello WOrld"
        https_link = ""
        ssh_link = ""
    }
    @IBAction func onHttpsPressed(_ sender: Any) {
        print(self.https_link)
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        if let url = self.https_link {
            pasteBoard.setString(url, forType: .string)
        }
    }
    @IBAction func onShhPressed(_ sender: Any) {
        print(self.ssh_link)
        let pasteBoard = NSPasteboard.general
        if let url = self.ssh_link {
            pasteBoard.setString(url, forType: .string)
        }
    }
    
}
