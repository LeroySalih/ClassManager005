//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol ParentDelegate {
    func onExit()
}

class RedVC : UIViewController{
    
    var delagate:ParentDelegate?
    
    @objc
    func handleClick() {
        print("[NextVC]clicked")
        guard let d = delagate else { return }
        dismiss(animated: true) {
            print("Dismissed")
        }
        d.onExit()
    }
    
    var button : UIButton = {
        
        var button:UIButton = UIButton(frame: CGRect(x: 150, y: 200, width: 200, height: 20))
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Exit", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        return button
    }()
    
    override func loadView(){
        let view = UIView(frame: CGRect(x:0,y:0,width:100, height:100))
        view.backgroundColor = .red
        
        view.addSubview(button)
        self.view = view
    }
    
    }

class BlueVC : UIViewController{
    
    var delagate:ParentDelegate?
    
    @objc
    func handleClick() {
        print("[NextVC]clicked")
        guard let d = delagate else { return }
        dismiss(animated: true) {
            print("Dismissed")
        }
        d.onExit()
    }
    
    var button : UIButton = {
        
        var button:UIButton = UIButton(frame: CGRect(x: 150, y: 200, width: 200, height: 20))
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Exit", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        return button
    }()
    
    override func loadView(){
        let view = UIView(frame: CGRect(x:0,y:0,width:100, height:100))
        view.backgroundColor = .blue
        
        view.addSubview(button)
        self.view = view
    }
    
}

class MyViewController : UIViewController, ParentDelegate {
    func onExit() {
    }
    
    @objc
    func handleBlueClick() {
       print("clicked")
        let nextVC = BlueVC()
        nextVC.delagate = self
       present(nextVC, animated: true)
    }
    
    @objc
    func handleRedClick() {
        print("clicked")
        let nextVC = BlueVC()
        nextVC.delagate = self
        present(nextVC, animated: true)
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        
        let redButton = UIButton(frame: CGRect(x: 100, y:250, width: 50, height: 29))
        redButton.backgroundColor   = .red
        redButton.setTitle("Edit", for: .normal)
        
        redButton.addTarget(self, action: #selector(handleRedClick), for: .touchUpInside)
        view.addSubview(redButton)
        
        let blueButton = UIButton(frame: CGRect(x: 25, y:250, width: 50, height: 29))
        blueButton.backgroundColor   = .blue
        blueButton.setTitle("Edit", for: .normal)
        
        blueButton.addTarget(self, action: #selector(handleBlueClick), for: .touchUpInside)
        view.addSubview(blueButton)
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
