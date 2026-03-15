Extension { #name : 'LeStringSnippetElement' }

{ #category : '*ZealTheme' }
LeStringSnippetElement >> initializeIndicatorElement [
	indicatorStencil := GtSpotterDropdownButtonStencil new
			icon: nil;
			label: 'String';
			tooltip: 'Set string parser';
			aptitude: [ BrGlamorousButtonWithLabelAptitude - BrGlamorousButtonExteriorAptitude ];
			beSmallSize;
			hidePreview;
			extent: 300@400;
			receiver: LeStringSpotterStart selector: #new;
			objectActOn: [ :anActOnEvent :aParserClass :aButton | self onParserSelected: aParserClass actOnEvent: anActOnEvent ].
	indicatorElement := indicatorStencil asElement.
	indicatorElement
		background: (Color fromHexString: '#262626');
		margin: (BlInsets top: 5 right: 5);
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignTop ]
]
