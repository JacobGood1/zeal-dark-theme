Extension { #name : 'GtInspectorRoundButtonStencil' }

{ #category : '*ZealTheme' }
GtInspectorRoundButtonStencil >> create [
	^ BrButton new
		background: ZealDarkMode contentBackground;
		aptitude: BrIconAptitude + BrGlamorousFocusableShadowAptitude new;
		geometry: BlEllipseGeometry new;
		layout: BlLinearLayout horizontal alignCenter;
		exact: self size;
		when: BlMouseEnterEvent do: [ :anEvent | anEvent currentTarget background: ZealDarkMode fadedBackground ];
		when: BlMouseLeaveEvent do: [ :anEvent | anEvent currentTarget background: ZealDarkMode contentBackground ];
		yourself
]
