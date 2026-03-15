Extension { #name : 'GtMagritteEditorAptitude' }

{ #category : '*ZealTheme' }
GtMagritteEditorAptitude >> initialize [
	super initialize.
	defaultBackground := Color transparent.
	defaultForeground := Color white alpha: 0.85.
	minWidth := 5.
	self addChangeProperty: #(widget constraints minWidth) with: [ self minWidth ].
	self
		add: (styleLook := BrStyleCommonAptitude new
					default: [ :aStyle | 
						aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
						aStyle background: self defaultBackground.
						aStyle border: BlBorder empty ];
					when: BrEditorModeState editable
						style: [ :aStyle | aStyle background: Color transparent ];
					when: [ :aState | aState focused and: BrEditorModeState editable ]
						style: [ :aStyle | aStyle border: (BlBorder paint: self theme editor focusedBorderColor width: 1) ];
					when: [ :aState | aState hovered and: BrEditorModeState readOnly ]
						style: [ :aStyle | aStyle background: BrGlamorousColors disabledButtonBackgroundColor ];
					when: [ :aState | aState focused and: BrEditorModeState readOnly ]
						style: [ :aStyle | 
							aStyle background: self theme editor focusedBorderColor.
							aStyle
								do: [ self foreground: Color white ]
								after: [ self foreground: self defaultForeground ] ])
]
