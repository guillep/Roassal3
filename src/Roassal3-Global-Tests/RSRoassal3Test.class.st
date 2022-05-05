Class {
	#name : #RSRoassal3Test,
	#superclass : #RSTest,
	#category : #'Roassal3-Global-Tests-Core'
}

{ #category : #tests }
RSRoassal3Test >> testLinearRenderCollection [
	| canvas shape box list |
	canvas := RSCanvas new.
	box := RSBox new size: 10.
	canvas add: box.
	box draggable.
	canvas renderCollection: RSLinearRenderTree new.
	shape := canvas shapeWithActionForPositionInPixels: canvas extent / 2.
	self assert: shape equals: box.
	shape := canvas shapeWithActionForPositionInPixels: 0@0.
	self assert: shape equals: canvas.
	
	list := canvas renderCollection shapesWithPoint: 0@0.
	self assert: list equals: {box}.
	list := canvas renderCollection shapesWithPoint: 20@0.
	self assert: list isEmpty.
]

{ #category : #tests }
RSRoassal3Test >> testOpen [

	| v |
	v := RSCanvas new open.
	self assert: v class == SystemWindow.
	v delete.
]

{ #category : #tests }
RSRoassal3Test >> testOpenOnce [

	| v |
	v := RSCanvas new openOnce.
	self assert: v class == SystemWindow.
	v delete.
]

{ #category : #tests }
RSRoassal3Test >> testRemoveInteractionIfPresent [
	| box |
	box := RSBox new.
	self deny: (box announcer handleSubscriberClass: RSPopup).
	box popup.
	self assert: (box announcer handleSubscriberClass: RSPopup).
	
	box removeInteractionIfPresent: RSPopup.
	self deny: (box announcer handleSubscriberClass: RSPopup).
	self deny: box hasEventCallback.
	
	box := RSBox new.
	box popup. 
	self assert: (box announcer handleEventClass: RSMouseMove).
	box removeInteractionIfPresent: RSMouseMove.
	self assert: (box announcer handleEventClass: RSMouseMove).
]

{ #category : #tests }
RSRoassal3Test >> testRenderCollection [
	| canvas shape list |
	canvas := RSCanvas new.
	canvas renderCollection: RSRenderTree new.
	self assert: canvas renderCollection class equals: RSRenderTree.
	shape := canvas 
		shapeWithAction: RSPositionChangedEvent
		forPositionInPixels: 10@10.
	self assert: shape equals: canvas.
	list := canvas renderCollection shapesWithPoint: 0@0.
	self assert: list isEmpty.
	
]

{ #category : #tests }
RSRoassal3Test >> testSubscriberClass [
	| box |
	box := RSBox new.
	self deny: (box announcer handleSubscriberClass: RSPopup).
	box popup.
	self assert: (box announcer handleSubscriberClass: RSPopup).
	"but popup adds a lot of events, RSPopup is not an event"
	self deny: (box announcer handleEventClass: RSPopup).
	{RSPopup activationEvent}, RSPopup removeEvents do: [ :evt | self assert:  (box announcer handleEventClass: evt). ]

]

{ #category : #tests }
RSRoassal3Test >> testsRsValue [
	| myCutomObjectValueProvider posiblesValuesForRoassal model colors |
	myCutomObjectValueProvider := NSScale category10.
		
	posiblesValuesForRoassal:= {
		Color red.
		nil.
		Color random.
		[ Color random ].
		#color.
		[ :obj | obj color ].
		myCutomObjectValueProvider  }.
		
	model := Morph new.

	colors := posiblesValuesForRoassal collect: [ :value |
		value rsValue: model ] as: OrderedCollection.
	self assert: (colors includes: nil).
	colors remove: nil.
	colors do: [ :color | self assert: color class equals: Color ]
]
