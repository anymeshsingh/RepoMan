import Cocoa
import Alamofire

class LoginViewController: NSViewController {

    @IBOutlet weak var loginButton: NSButton!
    @IBOutlet weak var tokenField: NSTextField!
    @IBOutlet weak var tokenFieldCell: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer?.backgroundColor = CGColor(red: 0.59, green: 0.84, blue: 0.27, alpha: 1.0)
//        tokenField.isBordered = true
//        tokenFieldCell.bezelStyle = .roundedBezel
//        tokenFieldCell.focusRingMaskBounds(forFrame: NSRect(x: tokenField.bounds.maxX, y: tokenField.bounds.maxY, width: 250, height: 40), in: self.view)
//        tokenFieldCell.drawingRect(forBounds: NSRect(x: tokenField.bounds.maxX, y: tokenField.bounds.maxY, width: 250, height: 40))
    }
    
    @IBAction func login(_ sender: NSButton) {
        if (tokenField.stringValue == "") {
            return
        }
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate, let itemManager = appDelegate.statusItemManager else { return }
        itemManager.isLoading = true
        itemManager.showLoadingView()
        itemManager.currentToken = tokenField.stringValue
        itemManager.githubController.fetchUserDetails(token: tokenField.stringValue) { (result) in
            switch result {
            case .success(_):
                itemManager.githubController.fetchUserRepos(token: self.tokenField.stringValue) { (res) in
                    switch res {
                    case .success(_):
                        DispatchQueue.main.async {
                            itemManager.isLoading = false
                            itemManager.showMainView()
                        }
                        break
                    case .failure(let error):
                        debugPrint(error)
                        break
                    }
                }
                return
            case .failure(let error):
                debugPrint("User API Error: ", error)
                break
            }
        }
        
//        fetchGithubUser { (result) in
//            switch result {
//            case .success(let user):
//                self.user = user
//                DispatchQueue.main.async {
//                    guard let appDelegate = NSApplication.shared.delegate as? AppDelegate, let itemManager = appDelegate.statusItemManager else { return }
//                    itemManager.showMainView(user: user)
//                }
//                break
//            case .failure(let error):
//                print("error", error)
//                return
//            }
//        }
    }
    
    
//    func fetchGithubUser(completion: @escaping (Result<GithubUser, Error>) -> ()) {
//
//        let headers: HTTPHeaders = [
//            "Authorization": "Token \(tokenField.stringValue)",
//        ]
//
//        AF.request("https://api.github.com/user", headers: headers).responseData { (response) in
//            if (response.error != nil) {
//                completion(.failure(response.error!))
//            }
//            do {
//                let data = try JSONDecoder().decode(GithubUser.self, from: response.data!)
//                completion(.success(data))
//                return
//            } catch let jsonError {
//                completion(.failure(jsonError))
//                return
//            }
//        }
        
//        let urlString : String = "https://api.github.com/user"
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        var request: URLRequest = URLRequest(url: url)
//        request.setValue("Token \(tokenField.stringValue)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
//
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            do {
//                let quotes = try JSONDecoder().decode(GithubUser.self, from: data!)
//                completion(.success(quotes))
//                return
//            } catch let jsonError {
//                completion(.failure(jsonError))
//                return
//            }
//
//        }.resume()
//    }
    
}

//extension NSViewController {
//func goToScreen(id : String, animate: Bool) {
//let storyBoard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
//let newViewController = storyBoard.instantiateController(withIdentifier: id)
//if animate {
//    self.present(newViewController as! NSViewController, animator: animate as! NSViewControllerPresentationAnimator)
//} else
//{
//    self.presentAsModalWindow(newViewController as! NSViewController)
//}
//}
//}
