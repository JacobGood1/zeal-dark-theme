Extension { #name : 'GtSceneryTextStencil' }

{ #category : '*ZealTheme' }
GtSceneryTextStencil >> create [
	<tag: #sceneryListeners>
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude;
		text: text;
		size: extent;
		background: (Color fromHexString: '#262626');
		margin: (BlInsets all: 10);
		when: BrEditorTextChanged do: [ :e | self text: e text ]
]
