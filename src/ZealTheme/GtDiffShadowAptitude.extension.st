Extension { #name : 'GtDiffShadowAptitude' }

{ #category : '*ZealTheme' }
GtDiffShadowAptitude >> newShadowLook [
	^ BrStyleCommonAptitude new
		default: [ :aStyle |
			aStyle
				background: (Color fromHexString: '#262626');
				effect: BrGlamorousShadowEffect new ];
		yourself
]
