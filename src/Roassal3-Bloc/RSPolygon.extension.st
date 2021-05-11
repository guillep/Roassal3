Extension { #name : #RSPolygon }

{ #category : #'*Roassal3-Bloc' }
RSPolygon >> asBlElement [

	^ self asBlGeometry asElement
		  size: self encompassingRectangle extent;
		  border: self blBorder;
		  background: self blPaint;
		  yourself
]

{ #category : #'*Roassal3-Bloc' }
RSPolygon >> asBlGeometry [

	^ BlPolygonGeometry vertices: self points
]
