import Foundation

/**
 * TODO: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples
 * TODO: ⚠️️ Rename initValues to config, as initvalues could indicate the start values, which it is not
 * TODO: ⚠️️ Consider using other names from regex proposal
 */
protocol PhysicsAnimKind5:class {
    associatedtype T: Advancable5
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    var state:AnimState5<T> {get set}
    var onFrame:(T)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
}
