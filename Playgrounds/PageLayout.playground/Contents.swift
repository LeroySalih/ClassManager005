//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static func appColor() -> UIColor { return UIColor(red: 231, green: 231, blue: 231)}
    static func borderColor() -> UIColor { return UIColor(red: 75, green: 75, blue: 75)}
    static func pageBackground() -> UIColor { return UIColor(red: 247, green: 247, blue: 247)}
    
}

extension UIFont {
    static func RegisterFonts ()  {
        
        let cfURL = Bundle.main.url(forResource: "Roboto-Light", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
    }
}



class PlannerPageVC : UIViewController {
    
    var classLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    var roomLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subjectLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var unitLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lessonLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var headingBorderView: UIView = {
        var view:UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 80, green: 227, blue: 184)
        view.layer.cornerRadius = 2
        view.layer.shadowColor = UIColor(red: 100, green: 100, blue: 100).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        return view
    }()
    
    override func loadView() {
        
        let backgroundVW:UIView = UIView()
        backgroundVW.backgroundColor = UIColor.appColor()
        
        let pageView:UIView = UIView()
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageView.layer.borderWidth = 1
        pageView.layer.borderColor = UIColor.borderColor().cgColor
        pageView.layer.cornerRadius = 10
        pageView.backgroundColor = .pageBackground()
        //pageView.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: 5, height: 5), radius: 5, scale: true)
        pageView.layer.shadowColor = UIColor(red: 100, green: 100, blue: 100).cgColor
        pageView.layer.shadowOpacity = 1
        pageView.layer.shadowOffset = CGSize.zero
        pageView.layer.shadowRadius = 10
        //pageView.layer.shouldRasterize = true
        
        let pageInner:UIView = UIView()
        pageInner.translatesAutoresizingMaskIntoConstraints = false
        pageInner.layer.borderWidth = 1
        pageInner.layer.borderColor = UIColor.borderColor().cgColor
        pageInner.backgroundColor = .white
        
        backgroundVW.addSubview(pageView)
        backgroundVW.addSubview(pageInner)
        
        [classLabel, roomLabel, subjectLabel, unitLabel, lessonLabel, headingBorderView].forEach { (view) in
            pageInner.addSubview(view)
        }
        
        
        pageInner.addSubview(classLabel)
        pageInner.addSubview(roomLabel)
        
        UIFont.RegisterFonts()
        
        classLabel.text = "10C"
        classLabel.font = UIFont(name: "Roboto-Light", size:  36.0)
        classLabel.sizeToFit()
        
        roomLabel.text = "r110"
        roomLabel.textAlignment = .center
        roomLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        
        subjectLabel.text = "Maths"
        
        roomLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        roomLabel.textColor = UIColor.gray
        
        unitLabel.text = "Number 4"
        unitLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        
        lessonLabel.text = "Multiplying Decimals"
        lessonLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        
        
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: backgroundVW.topAnchor, constant: 10),
            pageView.leadingAnchor.constraint(equalTo: backgroundVW.leadingAnchor, constant: 10),
            pageView.trailingAnchor.constraint(equalTo: backgroundVW.trailingAnchor, constant: -10),
            pageView.bottomAnchor.constraint(equalTo: backgroundVW.bottomAnchor, constant: -10),
            
            pageInner.topAnchor.constraint(equalTo: backgroundVW.topAnchor, constant: 30),
            pageInner.leadingAnchor.constraint(equalTo: backgroundVW.leadingAnchor, constant: 30),
            pageInner.trailingAnchor.constraint(equalTo: backgroundVW.trailingAnchor, constant: -30),
            pageInner.bottomAnchor.constraint(equalTo: backgroundVW.bottomAnchor, constant: -30),
            
            classLabel.topAnchor.constraint(equalTo: pageInner.topAnchor, constant: 10),
            classLabel.leadingAnchor.constraint(equalTo: pageInner.leadingAnchor, constant: 10),
            
            roomLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 5),
            roomLabel.leadingAnchor.constraint(equalTo: classLabel.leadingAnchor),
            roomLabel.trailingAnchor.constraint(equalTo: classLabel.trailingAnchor),
            
            subjectLabel.topAnchor.constraint(equalTo:classLabel.topAnchor),
            subjectLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
        //    subjectLabel.trailingAnchor.constraint(equalTo: pageInner.trailingAnchor, constant: -10),
            
            unitLabel.topAnchor.constraint(equalTo:subjectLabel.bottomAnchor, constant: 5),
            unitLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
        //    unitLabel.trailingAnchor.constraint(equalTo: pageInner.trailingAnchor, constant: -10),
            
            lessonLabel.topAnchor.constraint(equalTo:unitLabel.bottomAnchor, constant: 5),
            lessonLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
            
            headingBorderView.topAnchor.constraint(equalTo: lessonLabel.bottomAnchor, constant: 10),
            headingBorderView.leadingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            headingBorderView.trailingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            headingBorderView.heightAnchor.constraint(equalToConstant: 5)
            
            
            ])
        self.view = backgroundVW
    }
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = PlannerPageVC()
