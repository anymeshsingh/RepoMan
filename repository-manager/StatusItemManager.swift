import Cocoa
import SwiftUI

class StatusItemManager: NSObject {

    var statusItem: NSStatusItem?
    var popover: NSPopover?
    var loginVC: LoginViewController?
    var githubUser: GithubUser?
    var currentToken: String?
    var githubController: GithubController!
    var isLoading: Bool = false
    
    override init() {
        super.init()
        initStatusItem()
        initPopover()
        githubController = GithubController()
    }
    
    fileprivate func initStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let itemImage = NSImage(named: "StatusBarButtonImage")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        statusItem?.button?.target = self
        statusItem?.button?.action = #selector(showView)
    }
    
    fileprivate func initPopover() {
        popover = NSPopover()
        popover?.behavior = .transient
    }
    
    @objc fileprivate func showView() {
        if (isLoading) {
            showLoginVC()
            return
        }
        if (githubController.user != nil) {
            showMainView()
        } else {
            showLoginVC()
        }
    }
    
    func showLoadingView() {
        guard let popover = popover, let button = statusItem?.button else { return }
        if (!isLoading) {
            return
        }

        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "LoadingView")) as? LoadingViewController else { return }

        popover.contentViewController = vc
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }
    
    @objc fileprivate func showLoginVC() {
        guard let popover = popover, let button = statusItem?.button else { return }
        if loginVC == nil {
            let storyboard = NSStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "LoginView")) as? LoginViewController else { return }
            loginVC = vc
        }
        
        popover.contentViewController = loginVC
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }
    
    func showMainView() {
        guard let popover = popover, let button = statusItem?.button else { return }
        if (githubController.user == nil) {
            return
        }
        // Add this line to hide the Converter view before the popover gets resized.
//        popover.contentViewController?.view.isHidden = true

        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "MainView")) as? MainViewController else { return }
        vc.delegate = self

        popover.contentViewController = vc
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }
//
//    func hideAbout() {
//        guard let popover = popover else { return }
//
//        // Add this line.
//        popover.contentViewController?.view.isHidden = true
//
//        popover.contentViewController?.dismiss(nil)
//        showConverterVC()
//        popover.contentViewController?.view.isHidden = false
//    }
}
