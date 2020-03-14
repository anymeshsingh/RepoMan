//
//  MainViewController.swift
//  repository-manager
//
//  Created by Animesh Singh on 09/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    @IBOutlet weak var usernameLabel: NSTextField!
    @IBOutlet weak var profileImage: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var delegate: StatusItemManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.stringValue = delegate?.githubController.user?.login ?? ""
        
        do {
            let url = URL(string: delegate?.githubController?.user?.avatar_url ?? "")
            let img: NSImage! = NSImage(data: try Data(contentsOf: url!)) ?? NSImage(named: "NSImageNameQuickLookTemplate")
            profileImage.image = roundCorners(image: img, width: 450, height: 450)
//            profileImage.layer?.masksToBounds = true
//            profileImage.layer?.cornerRadius = 50
        } catch (_) {
            
        }
        
        configureCollectionView()
    }
    
    fileprivate func configureCollectionView() {
      // 1
      let flowLayout = NSCollectionViewFlowLayout()
      flowLayout.itemSize = NSSize(width: 280, height: 75)
      flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
      flowLayout.minimumInteritemSpacing = 10.0
      flowLayout.minimumLineSpacing = 20.0
      collectionView.collectionViewLayout = flowLayout
      // 2
      view.wantsLayer = true
      // 3
//      collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    func roundCorners(image: NSImage, width: CGFloat = 192, height: CGFloat = 192) -> NSImage {
        let xRad = width / 2
        let yRad = height / 2
        let existing = image
        let esize = existing.size
        let newSize = NSMakeSize(esize.width, esize.height)
        let composedImage = NSImage(size: newSize)

        composedImage.lockFocus()
        let ctx = NSGraphicsContext.current
        ctx?.imageInterpolation = NSImageInterpolation.high

        let imageFrame = NSRect(x: 0, y: 0, width: width, height: height)
        let clipPath = NSBezierPath(roundedRect: imageFrame, xRadius: xRad, yRadius: yRad)
        clipPath.windingRule = NSBezierPath.WindingRule.evenOdd
        clipPath.addClip()

        let rect = NSRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        image.draw(at: NSZeroPoint, from: rect, operation: NSCompositingOperation.sourceOver, fraction: 1)
        composedImage.unlockFocus()

        return composedImage
    }
    
}

extension MainViewController : NSCollectionViewDataSource {
  
  func numberOfSections(in collectionView: NSCollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return delegate?.githubController.repos?.count ?? 0
  }

  func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    
    guard let collectionViewItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath) as? CollectionViewItem else {
        return CollectionViewItem()
    }
//    guard let collectionViewItem = item as? CollectionViewItem else {return item}
    guard let repoName = delegate?.githubController.repos?[indexPath.item].name, let http_url = delegate?.githubController.repos?[indexPath.item].clone_url, let ssh_url = delegate?.githubController.repos?[indexPath.item].ssh_url else {
        return collectionViewItem
    }
    collectionViewItem.repoName.stringValue = repoName
    collectionViewItem.https_link = http_url
    collectionViewItem.ssh_link = ssh_url
    return collectionViewItem
  }
  
}
