Extension { #name : 'BrGlamorousTabWithoutBarAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousTabWithoutBarAptitude >> initialize [
	super initialize.
	self add: (BrGlamorousTextLabelAptitude new foreground: ZealDarkMode textColor).
	self add: BrLayoutAlignmentAptitude new.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal ].
	self add: (BrStyleCommonAptitude new
		default: [ :aStyle | aStyle padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12) ])
]
