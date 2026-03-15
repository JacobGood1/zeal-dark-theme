Extension { #name : 'LeElementSnippetElement' }

{ #category : '*ZealTheme' }
LeElementSnippetElement >> defaultErrorStencil [
	^ BrValuableStencil new valuable: [ :anException | | container message |
		container := BlElement new.
		container layout: BlLinearLayout horizontal.
		message := errorText ifNil: [ anException messageText ].
		container addChild: (BlTextElement new
			text: 'Debug' translated asRopedText;
			border: (BlBorder paint: Color gray width: 1);
			labelMeasurement;
			background: (Color fromHexString: '#262626');
			padding: (BlInsets top: 5 left: 8 bottom: 5 right: 8);
			geometry: (BlRoundedRectangleGeometry cornerRadius: 3);
			when: BlClickEvent do: [ [ anException defaultAction ] fork ]).
		container addChild: (BlTextElement new 
			margin: (BlInsets left: 10 right: 10);
			constraintsDo: [ :c |
				c horizontal exact: 1200.
				c vertical exact: 14 ];
			text: message asRopedText).
		container ].
]
