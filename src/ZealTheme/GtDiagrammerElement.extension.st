Extension { #name : 'GtDiagrammerElement' }

{ #category : '*ZealTheme' }
GtDiagrammerElement >> initializeCanvas [
	canvasContainer := GtDiagrammerCard new.
	canvasContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	canvasContainer background: (Color fromHexString: '#262626').
	
	canvas := BlElement new.
	canvas constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	canvasContainer addChild: canvas
]
