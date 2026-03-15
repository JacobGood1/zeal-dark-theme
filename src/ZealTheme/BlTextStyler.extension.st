Extension { #name : 'BlTextStyler' }

{ #category : '*ZealTheme' }
BlTextStyler >> style: aBlText [
	<return: #BlText>
	^ BlTextStylerTelemetry
		rootTimeSync: [ Processor activeProcess name, '  ', self class name, ': ', (aBlText first: (20 min: aBlText size)) asString ]
		during: [
			| anUnstyledText aStyledText |
			anUnstyledText := aBlText unstyle.
			"Set default light foreground for dark mode"
			anUnstyledText foreground: ZealDarkMode textColor.
			aStyledText := self privateStyle: anUnstyledText characters.
			aStyledText text ]
]
