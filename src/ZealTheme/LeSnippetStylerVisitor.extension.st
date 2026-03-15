Extension { #name : 'LeSnippetStylerVisitor' }

{ #category : '*ZealTheme' }
LeSnippetStylerVisitor >> newExpandedElement: aLink [
	| aTarget anElement aContainer |
	aContainer := BrFrame new
		addAptitude: BrShadowAptitude;
		addAptitude: BrGlamorousWithVerticalResizerAptitude;
		background: self theme default contentBackground;
		padding: (BlInsets all: 5);
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c textFlow pushLine ];
		hMatchParent;
		vExact: 300.
	aTarget := self snippetViewModel snippetModel linkTarget: aLink.
	anElement := aTarget
		ifNil: [ BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: 'empty';
				alignCenter ]
		ifNotNil: [ aTarget asPreviewElement
				matchParent ].
	aContainer addChild: anElement.
	^ aContainer
]
