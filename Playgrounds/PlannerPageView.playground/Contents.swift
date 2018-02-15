//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UILabel {
    func headingFont() -> UIFont? {return UIFont(name:"Avenir", size: 36)}
    func subHeadingFont() -> UIFont? {return UIFont(name:"Avenir", size: 20)}
}

class PlannerPageView : UIView
{
    
    var learningObjectives:[String] = ["Learing Objective 1", "Learing Objective 2",]
    var resources:[String] = ["Resource 1", "Resource 2",]

    var classLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.headingFont()
        label.textAlignment = .center
        return label
    }()

    var roomLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        label.textAlignment = .center

        return label
    }()
    
    var lessonLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
    //    label.textAlignment = .center
        
        return label
    }()
    
    var unitLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
    //    label.textAlignment = .center
        
        return label
    }()
    
    var subjectLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
     //   label.textAlignment = .center
        
        return label
    }()
    
    var loLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //   label.textAlignment = .center
        
        return label
    }()
    
    var resourcesLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //   label.textAlignment = .center
        
        return label
    }()

    func updateUI(){
        classLabel.text = "10C"
        classLabel.sizeToFit()

        roomLabel.text = "PC105"
        roomLabel.sizeToFit()
        
        lessonLabel.text = "Multiplying Decimal Numbers"
        lessonLabel.sizeToFit()
        
        unitLabel.text = "Numbers"
        unitLabel.sizeToFit()
        
        subjectLabel.text = "Math"
        unitLabel.sizeToFit()
        
        loLabel.text = "Learning Objectives"
        loLabel.sizeToFit()
        
        resourcesLabel.text = "Resources"
        resourcesLabel.sizeToFit()
        
    }

    func buildUI(){
    
        let classStackView = UIStackView()
        classStackView.translatesAutoresizingMaskIntoConstraints = false
        classStackView.axis = .vertical
        classStackView.addArrangedSubview(classLabel)
        classStackView.addArrangedSubview(roomLabel)
        
        addSubview (classStackView)
        
        let lessonStackView = UIStackView()
        lessonStackView.translatesAutoresizingMaskIntoConstraints = false
        lessonStackView.axis = .vertical
        lessonStackView.addArrangedSubview(lessonLabel)
        lessonStackView.addArrangedSubview(unitLabel)
        lessonStackView.addArrangedSubview(subjectLabel)
        
        addSubview(lessonStackView)
        
        let loStackView:UIStackView = UIStackView()
        loStackView.translatesAutoresizingMaskIntoConstraints = false
        loStackView.axis = .vertical
        
    
        addSubview(loLabel)
        learningObjectives.forEach({
            
            let label:UILabel = UILabel()
            label.text = $0
            label.sizeToFit()
            loStackView.addArrangedSubview(label)
        })
        
        addSubview(loStackView)
        
        addSubview(resourcesLabel)
        
        let resourcesStackView:UIStackView = UIStackView()
        resourcesStackView.translatesAutoresizingMaskIntoConstraints = false
        resourcesStackView.axis = .vertical
        
        
        resources.forEach({
            let label:UILabel = UILabel()
            label.text = $0
            label.sizeToFit()
            resourcesStackView.addArrangedSubview(label)
        })
        
        addSubview(resourcesStackView)
        
        NSLayoutConstraint.activate([
            classStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        //    classStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            classStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         //   classStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            lessonStackView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor),
            lessonStackView.leadingAnchor.constraint(equalTo: classStackView.trailingAnchor, constant:10),
            
            loLabel.topAnchor.constraint(equalTo: classStackView.bottomAnchor, constant: 10),
            loLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            loStackView.topAnchor.constraint(equalTo:loLabel.bottomAnchor),
        loStackView.leadingAnchor.constraint(equalTo:safeAreaLayoutGuide.leadingAnchor),
        loStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            resourcesLabel.topAnchor.constraint(equalTo: loStackView.bottomAnchor, constant: 10),
            resourcesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            resourcesStackView.topAnchor.constraint(equalTo: resourcesLabel.bottomAnchor, constant: 10),
            
            resourcesStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        updateUI()
        buildUI()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        backgroundColor = .green
        updateUI()
        buildUI()
    }
    
     required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let page = PlannerPageView(frame: CGRect(x: 10, y: 10, width: 400, height: 400))
        
        view.addSubview(page)
        
        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
