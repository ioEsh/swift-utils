import Cocoa
import Foundation
protocol IView{
    var layer: CALayer?{get}
    var bounds: NSRect{get}
}
class FlippedView:NSView{//Organizes your view from top to bottom
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var flipped:Bool {
        get {
            return true
        }
    }
}