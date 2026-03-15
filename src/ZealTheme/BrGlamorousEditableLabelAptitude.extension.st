Extension { #name : 'BrGlamorousEditableLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousEditableLabelAptitude >> initialize [
	super initialize.
	defaultBackground ifNil: [ defaultBackground := self theme status neutralBackgroundColor ].
	focusedBackground ifNil: [ focusedBackground := self theme editor focusedBorderColor ].
	defaultBorderColor ifNil: [ defaultBorderColor := self theme editor borderColor ].
	focusedBorderColor ifNil: [ focusedBorderColor := self theme editor focusedBorderColor ].
	
	defaultForeground := Color white alpha: 0.85.
	minWidth := 20.
	self
		addChangeProperty: #(widget constraints minWidth)
		with: [ self minWidth ].
	self
		add:
			(styleLook := BrStyleCommonAptitude new
				default: [ :aStyle | 
					aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
					aStyle background: defaultBackground.
					aStyle border: BlBorder empty ];
				when: BrEditorModeState editable
					style: [ :aStyle | aStyle background: (self theme default contentBackground) ];
				when: [ :aState | aState focused not and: BrEditorModeState editable ]
					style: [ :aStyle | 
					aStyle
						border: (BlBorder paint: defaultBorderColor width: 1) ];
				when: [ :aState | aState focused and: BrEditorModeState editable ]
					style: [ :aStyle | 
					aStyle
						border: (BlBorder paint: focusedBorderColor width: 1) ];
				when: [ :aState | aState hovered and: BrEditorModeState readOnly ]
					style: [ :aStyle | aStyle background: defaultBackground darker ];
				when: [ :aState | aState focused and: BrEditorModeState readOnly ]
					style: [ :aStyle | 
					aStyle background: focusedBackground.
					aStyle
						do: [ self foreground: Color white ]
						after: [ self foreground: self defaultForeground ] ])
]
