import Cocoa

class TestViewController: NSViewController {
    
    var textLabel: NSTextField!
    var tokenTextField: NSTextField!
    var loginButton: NSButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.blue.cgColor
        textLabel = NSTextField()
        textLabel.stringValue = "RepoMan"
        textLabel.isEditable = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        tokenTextField = NSTextField()
        tokenTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tokenTextField)
        
        loginButton = NSButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        setupConstrainst()
    }
    
    func setupConstrainst() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
