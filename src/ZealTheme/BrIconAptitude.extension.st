Extension { #name : 'BrIconAptitude' }

{ #category : '*ZealTheme' }
BrIconAptitude >> icon: aStencilOrElement [
	self
		assert: [ aStencilOrElement isNotNil ]
		description: [ 'Icon must not be nil' ].
	iconElement := aStencilOrElement asElement.
	"Recolor dark icons for dark mode"
	(iconElement background isKindOf: BlPaintBackground) ifTrue: [
		| c |
		c := iconElement background paint color.
		((c respondsTo: #red) and: [c red < 0.5 and: [c green < 0.5 and: [c blue < 0.5 and: [c alpha > 0.5]]]]) ifTrue: [
			iconElement background: (Color white alpha: 0.85)]].
	self updateIcon
]
