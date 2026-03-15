Extension { #name : 'GtDiagrammerLabelledElement' }

{ #category : '*ZealTheme' }
GtDiagrammerLabelledElement >> initialize [
	super initialize.
	self size: 75@50.
	self border: (BlBorder paint: Color black width: 1).
	self background: (Color fromHexString: '#262626').
	self initializeEditor.
]
