Extension { #name : 'GtCreationFormWidget' }

{ #category : '*ZealTheme' }
GtCreationFormWidget >> initialize [
	super initialize.
	onAccept := [ :aValue | self phlow spawnObject: aValue ].
	self layout: BlFlowLayout vertical.
	self margin: (BlInsets all: 5).
	self background: (Color fromHexString: '#262626').
	self
		constraintsDo: [ :c | 
			c horizontal exact: 400.
			c vertical fitContent ]
]
