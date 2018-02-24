//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// This View Controller will display the list of items....
class TextListViewController : UIViewController {
    
    var list:[String] = [] {
        didSet {
            buildStackView()
        }
    }
    var label:String = "" {
        didSet {
            listTitleLabel.text = label
            listTitleLabel.sizeToFit()
        }
    }
    
    var listTitleLabel:UILabel = {
        
        var label:UILabel = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    // Will hold each list item
    var textListStackView : UIStackView = {
    
        var stackView:UIStackView = UIStackView()
        // Use Constraints to layout the view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.backgroundColor = .blue
        
        return stackView
    }()
    
    func buildStackView(){
        textListStackView.subviews.forEach { (subView) in
            subView.removeFromSuperview()
        }
        
        textListStackView.addArrangedSubview(listTitleLabel)
        
        // Add each item
        list.forEach { (item) in
            let label:UILabel = UILabel()
            label.text = item
            label.sizeToFit()
            textListStackView.addArrangedSubview(label)
        }
        
    }
    //
    override func loadView() {
        print ("[TextListViewController]::loadView Called")
        
        let view:UIView = UIView()
        
        // Use Constraints to layout the view
        view.translatesAutoresizingMaskIntoConstraints = false
        
        buildStackView()
        
        //
        view.addSubview(textListStackView)
        
        self.view = view
        
    }
    
    override func viewDidLoad() {
        print ("[TextListViewController]::viewDidload Called")
        
        view.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            
            textListStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textListStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textListStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textListStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
 
        ])
        
    }
    
}

class MyViewController : UIViewController {
    
    var pageStackView:UIStackView = {
        let stackView:UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
        
    }()
    
    var label:UILabel = {
        
        var label :UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thats all folks"
    
        label.sizeToFit()
        return label
        
    }()
    
    
    @objc func onAdditemClicked(){
        var list = self.lessonObjectivesListViewController.list
        list.append("New Item")
        self.lessonObjectivesListViewController.list = list
    }
    
    var button:UIButton = {var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onAdditemClicked), for: .touchUpInside)
        return button
        
        }()
    
    var resourcesListViewController : TextListViewController = {
        let textListViewController:TextListViewController = TextListViewController()
        textListViewController.label = "Resources"
        textListViewController.list = ["Item 1", "Item 2", "Item 3"]
        return textListViewController
    }()
    
    var lessonObjectivesListViewController : TextListViewController = {
        let textListViewController:TextListViewController = TextListViewController()
        textListViewController.label = "Learning Objectives"
        textListViewController.list = ["Item 1", "Item 2", "Item 3"]
        return textListViewController
    }()
    
    override func loadView() {
        let view = UIView()
        
        resourcesListViewController.didMove(toParentViewController: self)
        lessonObjectivesListViewController.didMove(toParentViewController: self)
        
        view.addSubview(pageStackView)
        
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        
        pageStackView.addArrangedSubview(lessonObjectivesListViewController.view)
        pageStackView.addArrangedSubview(resourcesListViewController.view)
    
        pageStackView.addArrangedSubview(label)
        pageStackView.addArrangedSubview(button)
        
        NSLayoutConstraint.activate([
            pageStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pageStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            pageStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
   //         pageStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
            ])
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
