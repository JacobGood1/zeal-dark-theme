Extension { #name : 'GtInspectorConnectorSwitchStencil' }

{ #category : '*ZealTheme' }
GtInspectorConnectorSwitchStencil >> create [
	^ BrButton new
		background: ZealDarkMode contentBackground;
		aptitude: BrTextLabelAptitude  + BrShadowAptitude new;
		constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent. c padding: (BlInsets all:5)];
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		layout: BlLinearLayout horizontal alignCenter;
		when: BlMouseEnterEvent do: [ :anEvent | anEvent currentTarget background: ZealDarkMode secondaryHeaderBackground ];
		when: BlMouseLeaveEvent do: [ :anEvent | anEvent currentTarget background: ZealDarkMode contentBackground ];
		yourself
]
