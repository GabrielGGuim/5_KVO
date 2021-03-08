
import UIKit

class ViewController: UIViewController {
    
    //MARK: - Atributtes
    
    var observation: NSKeyValueObservation?
    
    let result = Result()
    
    let tfNote: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter note here"
        tf.font = UIFont.systemFont(ofSize: 25)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.keyboardType = UIKeyboardType.numberPad
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(verifyNote), for: .editingChanged)
        return tf
    }()
    
    let btnResult: UIButton = {
        let btn = UIButton()
        btn.setTitle("Result", for: .normal)
        btn.backgroundColor = .gray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    //MARK: - Instance Methods
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tfNote)
        self.view.addSubview(btnResult)
        
        self.constraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
    }
    
    //MARK: - Methods

    @objc func verifyNote(_ textField: UITextField){
        let stringNote = textField.text!
        
        if let note = Int(stringNote){
            self.result.note = note
        }else{return}
        
    }
    
    func observe() {
        self.observation = self.result.observe(\.result, options: [.new]) { [weak self] _, change in
            guard let self = self else { return }
            
            if let value = change.newValue {
                if(value){
                    self.btnResult.backgroundColor = .green
                }else{
                    self.btnResult.backgroundColor = .gray
                }
            }
        }
    }
    
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            
            tfNote.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant:30),
            tfNote.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tfNote.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            btnResult.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnResult.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            btnResult.heightAnchor.constraint(equalToConstant: 60),
            btnResult.widthAnchor.constraint(equalToConstant: 120)
        ])
        
    }
    
}

