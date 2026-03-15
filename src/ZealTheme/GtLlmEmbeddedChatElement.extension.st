Extension { #name : 'GtLlmEmbeddedChatElement' }

{ #category : '*ZealTheme' }
GtLlmEmbeddedChatElement >> initialize [
	super initialize.
	self fitContent.
	self background: (Color fromHexString: '#262626').
	self layout: BlLinearLayout vertical.
	self addChildFirst: self toolbar
]
