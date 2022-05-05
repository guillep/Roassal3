"
RSAbstractRenderTree defines 2 methods to search shapes.

`shapeWithAction: eventClass forPositionInPixels: position`

`shapeWithActionForPositionInPixels: position`

subclasses of this tree should override Collection abstract methods
"
Class {
	#name : #RSAbstractRenderTree,
	#superclass : #Collection,
	#category : #'Roassal3-Rendering'
}

{ #category : #'finding/searching' }
RSAbstractRenderTree >> shapesWithPoint: position [
	
	^ self subclassResponsibility
	
]
