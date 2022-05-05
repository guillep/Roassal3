"
this class is created for example09BigVisualization2raised19
because there it is hard to balance de rtree by now.

This class balance de tree using equal number or nodes for each tree. because of that.
users should provide a (2 raisedTo: n) number of nodes to compute the tree.
rembember a balance tree offers a better search experience 
"
Class {
	#name : #RSExampleRenderTree,
	#superclass : #RSRenderTree,
	#category : #'Roassal3-Rendering'
}

{ #category : #adding }
RSExampleRenderTree >> addAll: aCollection [
	root := RSRNode new.
	root addAll: aCollection
]
