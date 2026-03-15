Extension { #name : 'GtPhlowProtoView' }

{ #category : '*ZealTheme' }
GtPhlowProtoView >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 1;
		stencil: [ 
			| aContainer |
			aContainer := BlElement new
				margin: (BlInsets all: 20);
				background: (Color fromHexString: '#262626');
				aptitude: BrShadowAptitude;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			self asElementDo: [ :aNewElement | 
				aContainer addChild: aNewElement ].
			aContainer ]
]
