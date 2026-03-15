Extension { #name : 'GtInspectorRoundButtonStencil' }

{ #category : '*ZealTheme' }
GtInspectorRoundButtonStencil >> create [
	^ BrButton new
		background: (Color fromHexString: '#262626');
		aptitude: BrIconAptitude + BrGlamorousFocusableShadowAptitude new;
		geometry: BlEllipseGeometry new;
		layout: BlLinearLayout horizontal alignCenter;
		exact: self size;
		when: BlMouseEnterEvent do: [ :anEvent | anEvent currentTarget background: Color veryVeryLightGray lighter ];
		when: BlMouseLeaveEvent do: [ :anEvent | anEvent currentTarget background: (Color fromHexString: '#262626') ];
		yourself
]
