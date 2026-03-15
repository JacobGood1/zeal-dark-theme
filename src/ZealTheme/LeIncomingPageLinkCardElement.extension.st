Extension { #name : 'LeIncomingPageLinkCardElement' }

{ #category : '*ZealTheme' }
LeIncomingPageLinkCardElement >> initialize [
	super initialize.
	
	self
		layout: BlLinearLayout vertical;
		hMatchParent;
		vFitContent;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		padding: (BlInsets all: 7);
		background: self theme default contentBackground;
		preventChildrenMouseEvents.
		
	previewContainer := self createPreviewContainer.
	self addChild: previewContainer.
		
	self addViewModel: BrButtonModel new.
	self addAptitude: (BrLazyStyleCommonAptitude new
		default: [ :s | s border: BlBorder empty ];
		hovered: [ :s | s border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: 1) ]).
	self addAptitude: BrShadowAptitude new.
		
	self addAptitude: (BrLayoutResizerAptitude new
		inherit: [ previewContainer ])
]
