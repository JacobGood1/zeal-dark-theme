Extension { #name : 'GtInspectorConnectorSwitchStencil' }

{ #category : '*ZealTheme' }
GtInspectorConnectorSwitchStencil >> create [
	^ BrButton new
		background: (Color fromHexString: '#262626');
		aptitude: BrTextLabelAptitude  + BrShadowAptitude new;
		constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent. c padding: (BlInsets all:5)];
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		layout: BlLinearLayout horizontal alignCenter;
		when: BlMouseEnterEvent do: [ :anEvent | anEvent currentTarget background: (Color fromHexString: '#333333') ];
		when: BlMouseLeaveEvent do: [ :anEvent | anEvent currentTarget background: (Color fromHexString: '#262626') ];
		yourself
]
