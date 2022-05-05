"
An R-tree for roassal3
"
Class {
	#name : #RSRenderTree,
	#superclass : #RSAbstractRenderTree,
	#instVars : [
		'root'
	],
	#category : #'Roassal3-Rendering'
}

{ #category : #adding }
RSRenderTree >> add: newObject [ 
	root isNilNode 
		ifTrue: [ root := RSRNode new: newObject ]
		ifFalse: [ root add: newObject ].
	^ newObject
]

{ #category : #enumerating }
RSRenderTree >> do: aBlock [ 
	root do: aBlock
]

{ #category : #accessing }
RSRenderTree >> height [
	^ root height
	
]

{ #category : #initialization }
RSRenderTree >> initialize [
	super initialize.
	root := RSRNilNode new.
]

{ #category : #testing }
RSRenderTree >> isBalanced [
	^ root isBalanced
]

{ #category : #testing }
RSRenderTree >> isEmpty [
	^ root isEmpty
]

{ #category : #'finding/searching' }
RSRenderTree >> nodesIntersetcsRectangle: aRectangle [
	| res |
	res := OrderedCollection new.
	root nodesIntersetcsRectangle: aRectangle list: res.
	^ res
]

{ #category : #accessing }
RSRenderTree >> rectangle [
	^ root rectangle
]

{ #category : #removing }
RSRenderTree >> remove: oldObject ifAbsent: anExceptionBlock [ 
	
	^ root isNilNode
		ifTrue: anExceptionBlock
		ifFalse: [ | removedObject |
			removedObject := root remove: oldObject.
			removedObject 
				ifNil: anExceptionBlock
				ifNotNil: [
					root isInvalid
						ifTrue: [ root := RSRNilNode new ]
					]
			].
]

{ #category : #accessing }
RSRenderTree >> root [
	^ root
]

{ #category : #'finding/searching' }
RSRenderTree >> shapesWithPoint: aPoint [ 
	| res |
	res := OrderedCollection new.
	root nodesWithPoint: aPoint list: res.
	^ res
]
