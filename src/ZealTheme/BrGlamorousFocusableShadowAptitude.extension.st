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
						after: [ self color: (ZealDarkMode darkBorderColor alpha: 0.5) ] ])
]
