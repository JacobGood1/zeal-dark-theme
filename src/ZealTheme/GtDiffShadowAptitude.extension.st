Extension { #name : 'GtDiffShadowAptitude' }

{ #category : '*ZealTheme' }
GtDiffShadowAptitude >> newShadowLook [
	^ BrStyleCommonAptitude new
		default: [ :aStyle |
			aStyle
				background: ZealDarkMode contentBackground;
				effect: BrGlamorousShadowEffect new ];
		yourself
]
