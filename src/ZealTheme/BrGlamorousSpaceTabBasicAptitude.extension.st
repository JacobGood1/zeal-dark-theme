Extension { #name : 'BrGlamorousSpaceTabBasicAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousSpaceTabBasicAptitude >> initialize [
	super initialize.
	self add: BrGlamorousSpaceTabActionbarAptitude new.
	self add: BrLayoutAlignmentAptitude new.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal ].
	self
		add:
			(BrLazyStyleCommonAptitude new
				default: [ :aStyle | 
					aStyle margin: (BlInsets top: 0 right: 1).
					aStyle
						geometry:
							(BlRoundedRectangleGeometry
								cornerRadii:
									(BlCornerRadii new
										topLeft: 4;
										topRight: 4;
										bottomLeft: 0;
										bottomRight: 0)).
					aStyle
						padding:
							(BlInsets
								top: 4
								left: 10
								bottom: 4
								right: 10) ];
				when: (BlElementState deselected & BlElementState hovered not)
					style: [ :aStyle | aStyle background: Color transparent ];
				when: (BlElementState deselected & BlElementState hovered)
					style: [ :aStyle :aTheme | aStyle background: aTheme default backdropBackground ];
				selected: [ :aStyle :aTheme | aStyle background: aTheme default backdropBackground ])
]
