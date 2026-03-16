Extension { #name : 'BlTextStyler' }

{ #category : '*ZealTheme' }
BlTextStyler >> style: aBlText [
	<return: #BlText>
	^ BlTextStylerTelemetry
		rootTimeSync: [ Processor activeProcess name, '  ', self class name, ': ', (aBlText first: (20 min: aBlText size)) asString ]
		during: [
			| anUnstyledText aStyledText |
			anUnstyledText := aBlText unstyle.
			aStyledText := self privateStyle: anUnstyledText characters.
			aStyledText text ]
]
