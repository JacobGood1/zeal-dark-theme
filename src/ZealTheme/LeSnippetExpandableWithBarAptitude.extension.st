Extension { #name : 'LeSnippetExpandableWithBarAptitude' }

{ #category : '*ZealTheme' }
LeSnippetExpandableWithBarAptitude >> initializeSnippetExpander [
	snippetExpander := BlElement new
		constraintsDo: [ :c |
			c horizontal exact: 8.
			c vertical matchParent ];
		background: ZealDarkMode lightBorderColor;
		geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new topLeft: 4; topRight: 0; bottomRight: 0; bottomLeft: 4))
]
