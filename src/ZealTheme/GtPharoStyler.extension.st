Extension { #name : 'GtPharoStyler' }

{ #category : '*ZealTheme' }
GtPharoStyler >> parenthesesColors [
	"Light green parentheses for dark mode"
	^ { Color fromHexString: '#81C784' } "Material Green 300"
]

{ #category : '*ZealTheme' }
GtPharoStyler >> visitBinaryMessage: aBinaryMessage [
	aBinaryMessage selectorParts do: [:each |
		self
			attributes: { BlTextForegroundAttribute color: (Color fromHexString: '#E1BEE7') }
			from: each startPosition
			to: each stopPosition].
	^ super visitBinaryMessage: aBinaryMessage
]

{ #category : '*ZealTheme' }
GtPharoStyler >> visitKeywordMessage: aKeywordMessage [
	aKeywordMessage selectorParts do: [:each |
		self
			attributes: { BlTextForegroundAttribute color: (Color fromHexString: '#E1BEE7') }
			from: each startPosition
			to: each stopPosition].
	^ super visitKeywordMessage: aKeywordMessage
]

{ #category : '*ZealTheme' }
GtPharoStyler >> visitUnaryMessage: anUnaryMessage [
	anUnaryMessage selectorParts do: [:each |
		self
			attributes: { BlTextForegroundAttribute color: (Color fromHexString: '#E1BEE7') }
			from: each startPosition
			to: each stopPosition].
	^ super visitUnaryMessage: anUnaryMessage
]
