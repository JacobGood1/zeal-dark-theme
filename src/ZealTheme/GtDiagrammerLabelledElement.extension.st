Extension { #name : 'GtDiagrammerLabelledElement' }

{ #category : '*ZealTheme' }
GtDiagrammerLabelledElement >> initialize [
	super initialize.
	self size: 75@50.
	self border: (BlBorder paint: ZealDarkMode textColor width: 1).
	self background: ZealDarkMode contentBackground.
	self initializeEditor.
]
