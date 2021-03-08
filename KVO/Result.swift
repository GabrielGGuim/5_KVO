
import Foundation

class Result: NSObject {
    
    var note = 0 {
        didSet {
            self.result = self.note > 6 ? true:false
        }
    }
    
    @objc dynamic var result = false
}
