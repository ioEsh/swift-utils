import Cocoa

class ViewModifier {
    /**
     *
     */
    class func applyColor(view:NSView,_ nsFillColor:NSColor = NSColor.clearColor(),_ nsLineColor:NSColor = NSColor.clearColor(),_ lineWidth:Int = 0){
        let cgFillColor:CGColor = CGColorParser.cgColor(nsFillColor)
        if(nsFillColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("fill")
            view.layer!.backgroundColor = cgFillColor
            
        }
        let cgLineColor:CGColor = CGColorParser.cgColor(nsLineColor)
        //Swift.print(nsLineColor)
        if(nsLineColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("line")
            view.layer!.borderColor = cgLineColor
            view.layer!.borderWidth = CGFloat(lineWidth)
        }
    }
    /**
     * Sets the position of an NSView instance
     * TODO: make the same method for size
     */
    class func position(view:NSView,_ point:CGPoint){
        view.frame.origin = point
    }
}