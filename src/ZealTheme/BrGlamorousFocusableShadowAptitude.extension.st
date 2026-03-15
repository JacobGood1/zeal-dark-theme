Extension { #name : 'BrGlamorousFocusableShadowAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousFocusableShadowAptitude >> initialize [
	super initialize.
	self
		add:
			(BrLazyStyleCommonAptitude new
				focused: [ :aStyle | 
					aStyle
						do: [ self color: self theme default primaryBorderColor ]
						after: [ self color: ((Color fromHexString: '#666666') alpha: 0.5) ] ])
]
