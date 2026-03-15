Extension { #name : 'GtPharoClassExpanderAttribute' }

{ #category : '*ZealTheme' }
GtPharoClassExpanderAttribute >> buildBehaviorCoder [
	| editorElement |
	editorElement := GtCoderElement forClass: classToExpand.
	editorElement background: ZealDarkMode contentBackground.
	editorElement
		aptitude: BrShadowAptitude
				+ (BrGlamorousWithVerticalResizerAptitude new
						beBottom;
						yourself).
	editorElement
		height: 400;
		margin: (BlInsets
				top: 3
				right: 10
				bottom: 10
				left: 10).
	^ editorElement
]
