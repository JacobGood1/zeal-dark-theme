Extension { #name : 'GtNotificationBorderElement' }

{ #category : '*ZealTheme' }
GtNotificationBorderElement >> initializeElement [
	self 
		background: (Color fromHexString: '#262626');
		padding: (BlInsets top: 5 right: 5 bottom: 0 left: 5)
]
