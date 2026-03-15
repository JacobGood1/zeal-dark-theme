Extension { #name : 'GtCompilationNotificationSummary' }

{ #category : '*ZealTheme' }
GtCompilationNotificationSummary >> initialize [
	super initialize.
	self
		constraintsDo: [ :c | 
			c vertical exact: 21.
			c horizontal fitContent ].
	self layout: BlLinearLayout horizontal.
	self border: (BlBorder paint: Color orange width: 2).
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	self padding: (BlInsets left: 5 right: 5).
	self background: (Color fromHexString: '#262626').
	self
		addChild: (executedLabel := BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					beSmallSize;
					hFitContent;
					vExact: 15;
					margin: (BlInsets all: 3);
					layout: BlLinearLayout horizontal alignCenter;
					geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
					text: 'Compiling 0%')
]
