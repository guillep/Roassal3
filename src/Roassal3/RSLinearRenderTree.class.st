"
Internally uses an OrderedCollection/RSGroup to iterate over the shapes.
This is the reason why is a linear render tree or linear search
"
Class {
	#name : #RSLinearRenderTree,
	#superclass : #RSAbstractRenderTree,
	#instVars : [
		'group'
	],
	#category : #'Roassal3-Rendering'
}

{ #category : #adding }
RSLinearRenderTree >> add: newObject [ 
	group add: newObject
]

{ #category : #enumerating }
RSLinearRenderTree >> do: aBlock [ 
	group do: aBlock
]

{ #category : #initialization }
RSLinearRenderTree >> initialize [
	super initialize.
	group := RSGroup new.
]

{ #category : #removing }
RSLinearRenderTree >> remove: oldObject ifAbsent: anExceptionBlock [
	group remove: oldObject ifAbsent: anExceptionBlock
]

{ #category : #'finding/searching' }
RSLinearRenderTree >> shapesWithPoint: position [
	| result |
	group reverseDo: [ :shape |
		result := shape shapeWithActionForPosition: position.
		result ifNotNil: [ ^ { result }  ].
		 ].
	^ {  }
	
]
