Extension { #name : 'LeEvaluatedSnippetElement' }

{ #category : '*ZealTheme' }
LeEvaluatedSnippetElement >> newArrowElement [
	"Instantiate and return a new element playing a role of a down arrow."
	<return: #BlElement>
	^ BlElement new
		size: 24@16;
		visibility: BlVisibility gone; 
		geometry: (BlPolygonGeometry vertices: { 0@0 . 24@0 . 12@16 } );
		margin: (BlInsets top: 13 right: 5 bottom: 0 left: 0);
		background: (Color fromHexString: '#444444');
		constraintsDo: [ :c |
			"Let's put arrow in the middle of its cell"
			c linear horizontal alignCenter.
			c linear vertical alignCenter ].
]

{ #category : '*ZealTheme' }
LeEvaluatedSnippetElement >> newPreviewContainer [
	| previewContainer |
	previewContainer := BlElement new.
	^ previewContainer
		layout: BlLinearLayout vertical;
		addAptitude: BrShadowAptitude new;
		visibility: BlVisibility gone; 
		padding: (BlInsets bottom: 5);
		margin: (BlInsets top: 5 bottom: 5);
		background: self theme default contentBackground;
		addChild: (BrResizer new
			target: previewContainer;
			beBottom;
			aptitude: BrGlamorousResizerAptitude;
			constraintsDo: [ :c | 
				c ignoreByLayout.
				c ignored horizontal weight: 0.5 ]);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: self previewHeight ]
]
