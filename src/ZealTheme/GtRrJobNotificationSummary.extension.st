Extension { #name : 'GtRrJobNotificationSummary' }

{ #category : '*ZealTheme' }
GtRrJobNotificationSummary >> initialize [
	super initialize.
	
	self
		constraintsDo: [ :c | 
			c vertical exact: 21.
			c horizontal fitContent ].
	self layout: BlLinearLayout horizontal.
	self border: (BlBorder paint: Color orange width: 2).
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	self padding: (BlInsets left: 5 right: 5).
	self background: ZealDarkMode contentBackground.
	
	self initializeResultLabels
]
