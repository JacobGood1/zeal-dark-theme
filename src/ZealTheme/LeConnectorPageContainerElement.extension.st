Extension { #name : 'LeConnectorPageContainerElement' }

{ #category : '*ZealTheme' }
LeConnectorPageContainerElement >> initialize [ 
		| aCloseButton aRightResizer aBottomResizer |
	super initialize.
	self layout: BlLinearLayout horizontal.
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c accountTransformation ].
	self clipChildren: false.
	innerContainer := BlElement new.
	innerContainer
		clipChildren: false;
		size: 400@400;
		padding: (BlInsets all: 5);
		addAptitude: BrGlamorousFocusableShadowAptitude new;
		background: self theme default contentBackground;
		layout: BlLinearLayout new.
	self
		when: BlClickEvent  
		do: [ self toggleVolume ].
	
	aRightResizer := BlElement new
		aptitude: BrGlamorousResizerRightBarAptitude new;
		background: BrGlamorousColors editorBorderColor;
		constraintsDo: [ :c | 
			c margin: (BlInsets right: 0). 
			c horizontal exact: 3.];
		addEventHandler: (BlResizerRightListener new 
			resizeTarget: innerContainer; 
			minimumExtent: 75@0).
	aBottomResizer := BlElement new
		aptitude: BrGlamorousResizerBottomBarAptitude new;
		background: BrGlamorousColors editorBorderColor;
		constraintsDo: [ :c | 
			c margin: (BlInsets bottom: 0). 
			c vertical exact: 3.];
		addEventHandler: (BlResizerBottomListener new 
			resizeTarget: innerContainer; 
			minimumExtent: 0@75).
	aCloseButton := GtInspectorRoundButtonStencil new asElement
		icon: (BrPlusIconStencil close asElement);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -10 left: 0 bottom: 0 right: -10).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ];
		action: [ :e |  
			e 
				allParentsDetect: [:aParent | aParent isKindOf: LeConnectorPageContainerElement] 
				ifFound: [:aParent | self connectorElement removeChild: aParent ] 
				ifNone: [] ].
	pageElement := LeConnectorPageElement new.
	pageElement matchParent.
	pageElement when: GtPhlowObjectToSpawn do: [ :spawnEvent | 
			| isInspect |
			isInspect := spawnEvent target userData includesKey: #isInspectButton.
			isInspect ifFalse: [
				self connectorElement addEntity: spawnEvent object fromPageElement: self.
				spawnEvent consumed: true ] ].
	innerContainer addChild: pageElement.
	innerContainer addChild: aCloseButton.
	self addChild: innerContainer.
	self addChild: aRightResizer.
	self addChild: aBottomResizer
]
