Extension { #name : 'GtInspectorElementLiveViewContainer' }

{ #category : '*ZealTheme' }
GtInspectorElementLiveViewContainer >> updateAsElementPreviewView [
	| label previewContainer scaledPreview preview |
	self removeChildren.
	self margin: (BlInsets all: 10).
	self layout: BlLinearLayout vertical.
	preview := [ element asSpartaForm asElement ]
		on: Error
		do: [ :anException | 
			anException asDebuggableElement ].
	scaledPreview := preview asScalableElement maxScale: 1.0.
	preview
		when: BlClickEvent
		do: [ :anEvent | self gtOnPreviewClickEvent: anEvent ].
	previewContainer := BlElement new
			aptitude: BrShadowAptitude;
			layout: BlLinearLayout new;
			background: (Color fromHexString: '#262626');
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			addChild: scaledPreview as: #preview.
	label := BrLabel new
			aptitude: (BrGlamorousLabelAptitude new foreground: Color gray);
			text: 'You see a static preview because this element already has a parent.'
					asRopedText glamorousRegularFont readonly;
			alignCenter;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent.
				c linear horizontal alignCenter ].
	self addChild: previewContainer as: GtInspectorElementPreviewContainerId.
	self addChild: label as: #description
]
