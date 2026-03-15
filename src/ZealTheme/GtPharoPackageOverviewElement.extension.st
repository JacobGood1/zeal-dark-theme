Extension { #name : 'GtPharoPackageOverviewElement' }

{ #category : '*ZealTheme' }
GtPharoPackageOverviewElement >> createClassTypesList [
	^ BrGroupedList new
		hMatchParent;
		vFitContentLimited;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		background: ZealDarkMode contentBackground;
		padding: (BlInsets top: 0 bottom: 10 left: 10 right: 10);
		headerElementStencil: [ BrLabel new
			margin: (BlInsets top: 10);
			aptitude: (BrGlamorousLabelAptitude new foreground: Color gray) ];
		headerDataBinder: [ :aLabel :eachItem | aLabel text: eachItem domainObject ]
]

{ #category : '*ZealTheme' }
GtPharoPackageOverviewElement >> createRoundedPaneElement [
	^ BrVerticalPane new
		hMatchParent;
		vFitContent;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		addAptitude: BrShadowAptitude;
		background: ZealDarkMode contentBackground;
		padding: (BlInsets all: 10);
		margin: (BlInsets all: 5)
]

{ #category : '*ZealTheme' }
GtPharoPackageOverviewElement >> initialize [
	super initialize.
	
	self background: ZealDarkMode contentBackground.
	self matchParent.
	self padding: (BlInsets top: 20 bottom: 20 left: 20 right: 20).
	
	self addChild: (headerElement := self createPackageHeader).
	
	self addChild: (BrHorizontalPane new
		matchParent;
		margin: (BlInsets top: 10);
		addChild: (self createRoundedPaneElement addChild: (behaviorTypesList := self createClassTypesList));
		addChild: (
			BrVerticalPane new
				matchParent;
				margin: (BlInsets left: 10);
				addChild: (self createRoundedPaneElement
					addChild: (extendedMethodsElement := self createExtensionMethodsStatistic));
				addChild: (self createRoundedPaneElement
					addChild: (dependenciesShortElement := self createPackageDependenciesStatistic));
				addChild: (self createRoundedPaneElement
					addChild: (whichBaselineElement := self createWhichBaselineElement))))
]
