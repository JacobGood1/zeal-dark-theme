Extension { #name : 'BrCursorStencil' }

{ #category : '*ZealTheme' }
BrCursorStencil >> create [
	^ BrCursorElement new
		constraintsDo: [ :c |
			c horizontal exact: 1.
			c vertical matchParent ];
		background: ZealDarkMode textColor
]
