Class {
	#name : 'ZealDarkMode',
	#superclass : 'Object',
	#category : 'ZealTheme',
	#package : 'ZealTheme'
}

{ #category : 'api' }
ZealDarkMode class >> activate [
	"Override BrGlamorousColors class variables with dark values then patch aptitudes"
	
	"Borders"
	self set: #LightBorderColor to: self lightBorderColor.
	self set: #DarkBorderColor to: self darkBorderColor.
	self set: #PrimaryBorderColor to: self primaryAccentColor.
	self set: #ActiveColor to: self activeAccentColor.
	
	"Button borders"
	self set: #ButtonBorderColor to: self buttonBorderColor.
	self set: #HoveredButtonBorderColor to: self primaryAccentColor.
	self set: #PressedButtonBorderColor to: self activeAccentColor.
	self set: #DisabledButtonBorderColor to: self fadedBackground.
	
	"Status borders"
	self set: #SuccessBorderColor to: self successColor.
	self set: #ErrorBorderColor to: self errorColor.
	self set: #FailureBorderColor to: self warningColor.
	
	"Button backgrounds"
	self set: #ButtonBackgroundColor to: self buttonBackground.
	self set: #DisabledButtonBackgroundColor to: self contentBackground darker.
	self set: #FadedBackgroundColor to: self fadedBackground.
	
	"Status backgrounds"
	self set: #PaleErrorBackgroundColor to: (Color fromHexString: '#3B1515').
	self set: #PaleFailureBackgroundColor to: (Color fromHexString: '#332200').
	self set: #PaleSuccessBackgroundColor to: (Color fromHexString: '#1B3318').
	self set: #ErrorBackgroundColor to: (Color fromHexString: '#5B1A1A').
	self set: #SuccessBackgroundColor to: (Color fromHexString: '#2E5B2E').
	self set: #FailureBackgroundColor to: (Color fromHexString: '#5B3D00').
	self set: #NeutralBackgroundColor to: self headerBackground.
	self set: #NewsBackgroundColor to: (Color fromHexString: '#332200').
	
	"Button text"
	self set: #ButtonTextColor to: (self textColor alpha: 0.75).
	self set: #HoveredButtonTextColor to: self primaryAccentColor.
	self set: #PressedButtonTextColor to: self activeAccentColor.
	self set: #DisabledButtonTextColor to: self disabledTextColor.
	self set: #FadedTextColor to: self secondaryTextColor.
	
	"Backgrounds"
	self set: #BackdropColor to: self backdropBackground.
	self set: #ShadowColor to: self shadowColor.
	
	"Header"
	self set: #HeaderBackgroundColor to: self headerBackground.
	self set: #SecondaryHeaderBackgroundColor to: self secondaryHeaderBackground.
	self set: #HeaderTextColor to: self textColor.
	self set: #DisabledHeaderTextColor to: self disabledTextColor.
	
	"Editor"
	self set: #EditorBorderColor to: self lightBorderColor.
	self set: #FocusedEditorBorderColor to: self primaryAccentColor.
	
	"List items"
	self set: #HoveredListItemBackgroundColor to: (Color white alpha: 0.08).
	self set: #SelectedListItemBackgroundColor to: (self primaryAccentColor alpha: 0.25).
	self set: #PressedListItemBackgroundColor to: (Color white alpha: 0.15).
	self set: #DeselectedListItemBackgroundColor to: Color transparent.
	
	"Text and misc"
	self set: #TextHighlightColor to: (self warningColor alpha: 0.3).
	self set: #TextMarkupColor to: self secondaryTextColor.
	self set: #DebuggerTextHighlightColor to: (self errorColor alpha: 0.2).
	self set: #FormLabelTextColor to: (self textColor alpha: 0.65).
	self set: #LinkColor to: self primaryAccentColor.
	self set: #LinkWithErrorColor to: self errorColor.
	self set: #ExpandCollapseTriangleBackgroundColor to: self secondaryTextColor.
	
	"Activate theme object and fix shadow"
	BlTheme default: BrGlamorousDarkTheme new.
	
	"Fix inherited theme singleton so all elements see dark theme"
	BlElementInheritedTheme default instVarNamed: 'theme' put: BlTheme default.
	
	"Patch aptitudes that hardcode Color white"
	self patchAptitudes.
	
	"Repaint existing elements"
	self repaintAll.
	
	"Reload GT world with dark theme"
	GtWorld allInstances do: [:w | [w close] on: Error do: [:e | ]].
	GtWorld openDefault.
	
	^ 'Dark mode activated'
]

{ #category : 'colors' }
ZealDarkMode class >> activeAccentColor [
	"Active/pressed accent"
	^ Color fromHexString: '#42A5F5'
]

{ #category : 'colors' }
ZealDarkMode class >> appBackground [
	"Darkest background - root space, window background"
	^ Color fromHexString: '#171B22'
]

{ #category : 'colors' }
ZealDarkMode class >> backdropBackground [
	"Backdrop behind content - slightly lighter than app background"
	^ Color fromHexString: '#1B1F26'
]

{ #category : 'colors' }
ZealDarkMode class >> buttonBackground [
	"Default button background"
	^ Color fromHexString: '#2A2F37'
]

{ #category : 'colors' }
ZealDarkMode class >> buttonBorderColor [
	"Button borders"
	^ Color fromHexString: '#525764'
]

{ #category : 'colors' }
ZealDarkMode class >> contentBackground [
	"Main content areas - editors, panels, cards"
	^ Color fromHexString: '#232830'
]

{ #category : 'colors' }
ZealDarkMode class >> darkBorderColor [
	"Prominent borders"
	^ Color fromHexString: '#636876'
]

{ #category : 'actions' }
ZealDarkMode class >> deactivate [
	self stopWatcher.
	BrGlamorousColors initialize.
	BlTheme default: BrGlamorousLightTheme new.
	^ 'Light mode restored'
]

{ #category : 'colors' }
ZealDarkMode class >> disabledTextColor [
	"Disabled text"
	^ Color white alpha: 0.25
]

{ #category : 'colors' }
ZealDarkMode class >> errorColor [
	"Error status"
	^ Color fromHexString: '#F44336'
]

{ #category : 'colors' }
ZealDarkMode class >> fadedBackground [
	"Faded/disabled background, hover states"
	^ Color fromHexString: '#373C46'
]

{ #category : 'colors' }
ZealDarkMode class >> headerBackground [
	"Headers, toolbars"
	^ Color fromHexString: '#272C34'
]

{ #category : 'colors' }
ZealDarkMode class >> iconColor [
	"Icon fill/stroke color"
	^ Color white alpha: 0.85
]

{ #category : 'initialization' }
ZealDarkMode class >> initialize [
	"Called automatically when the package is loaded"
	self activate
]

{ #category : 'colors' }
ZealDarkMode class >> lightBorderColor [
	"Subtle borders, dividers"
	^ Color fromHexString: '#414652'
]

{ #category : 'private' }
ZealDarkMode class >> patchAptitudes [
	"Patch core aptitudes that hardcode Color white to use theme colors instead"
	
	"Fix BlSpace default root background"
	BlSpace compile: 'defaultRootBackground
	^ (BlTheme default class name asString includesSubstring: ''Dark'')
		ifTrue: [ Color fromHexString: ''#171B22'' ]
		ifFalse: [ Color white ]' classified: 'initialization'.
	
	"Fix BrGlamorousDefaultDarkTheme shadow (was green)"
	BrGlamorousDefaultDarkTheme compile: 'initializeConstants
	super initializeConstants.
	self constantAt: #defaultShadowColor put: (Color black alpha: 0.5).
	self constantAt: #primaryBorderColor put: (Color fromHexString: ''#525764'')' classified: 'initialization'.
	
	"Fix editor spacing background"
	BrGlamorousEditorSpacingAptitude compile: 'initialize
	super initialize.
	self
		addChangeProperty: #(widgetContent background)
		with: [ self theme default contentBackground ].
	self
		addChangeProperty: #(widgetContent border)
		with: [ BlBorder paint: self theme editor borderColor width: 1 ]' classified: 'initialization'.
	
	"Fix tab group header background"
	BrGlamorousTabGroupSwitcherHeaderAptitude compile: 'initialize
	super initialize.
	self header addAptitude: BrGlamorousFocusableShadowAptitude.
	self addChangeProperty: #(header geometry) with: [ BlStadiumGeometry new ].
	self addChangeProperty: #(header background) with: [ self theme default contentBackground ]. 
	self addChangeProperty: #(header layout) with: [ BlLinearLayout horizontal alignCenter ].
	self addChangeProperty: #(tabbar layout) with: [ 
		BlLinearLayout horizontal alignCenter cellSpacing: 0 ].
	self add: (BrLayoutResizerAptitude new
		anyToFitContent: self header).
	self header addAptitude: (BrLayoutResizerAptitude new
		anyToFitContent: self scrollTabbar).
	self scrollTabbar addAptitude: (BrLayoutResizerAptitude new
		anyToFitContent: self tabbar)' classified: 'initialization'.
	
	"Fix tab switcher backgrounds"
	BrGlamorousTabSwitcherAptitude compile: 'createCommonStyleAptitude
	| dark |
	dark := (BlTheme default class name asString includesSubstring: ''Dark'').
	^ (BrStyleCommonAptitude new
		default: [ :aStyle | aStyle background: (dark ifTrue: [ Color fromHexString: ''#2D2D2D'' ] ifFalse: [ Color white ]) ];
		hovered: [ :aStyle | aStyle background: (dark ifTrue: [ Color fromHexString: ''#3A3A3A'' ] ifFalse: [ Color veryVeryLightGray lighter ]) ];
		pressed: [ :aStyle | aStyle background: (dark ifTrue: [ Color fromHexString: ''#444444'' ] ifFalse: [ Color veryVeryLightGray ]) ];
		selected: [ :aStyle | aStyle background: self theme item selectedColor ])' classified: 'initialization'.
	
	"Fix expander background"
	BrGlamorousExpanderAptitude compile: 'initialize
	| aShadowLook |
	super initialize.
	aShadowLook := BrShadowAptitude new.
	toggle := BrInlineExpanderElement new
		aptitude: BrGlamorousTriangleInCircleExpanderAptitude;
		toggleAction: [ self widget fireEvent: BrExpansionToggleWish new ].
	sidebar := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent ];
		background: Color veryVeryLightGray;
		addChild: toggle.
	container := BlElement new
		padding: (BlInsets all: 10);
		layout: BlLinearLayout horizontal.
	self add: (BrStyleCommonAptitude new
		collapsed: [ :aStyle |
			aStyle border: (BlBorder paint: Color veryVeryLightGray width: 1).];
		expanded: [ :aStyle |
			aStyle background: self theme default contentBackground.
			aStyle do: [ self add: aShadowLook ] after: [ self remove: aShadowLook ] ]).
	self addChangeAddChildAs: #(content) with: [ container ].
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: 3 ].
	self addChangeAddChildAs: #(content sidebar) with: [ sidebar ]' classified: 'initialization'.
	
	"Fix anchored (popover/tooltip) background"
	BrGlamorousAnchoredAptitude compile: 'initialize
	super initialize.
	background := self theme default contentBackground.
	border := self theme button defaultBorderColor asBlBorder.
	cornerRadius := 4.
	self
		add: BrShadowAptitude new;
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry cornerRadius: self cornerRadius element: widget ];
		addChangeProperty: #(widget background) with: [ self background ];
		addChangeProperty: #(widget border)
			with: [ border asBlBorder ]' classified: 'initialization'.
	
	"Fix menu item backgrounds"
	BrMenuItemAptitude compile: 'initialize
	super initialize.
	self
		add: (BrStyleCommonAptitude new
				default: [ :aStyle | aStyle background: self theme default contentBackground ];
				when: BlElementState hovered & BlElementState selected
					style: [ :aStyle | aStyle background: self theme item selectedColor ];
				when: BlElementState hovered not & BlElementState selected
					style: [ :aStyle | aStyle background: self theme item hoveredColor ];
				pressed: [ :aStyle | aStyle background: self theme item pressedColor ])' classified: 'initialization'.
	
	BrMenuItemElement compile: 'initializeCommonStyling
	self
		addAptitude: (BrStyleCommonAptitude new
				default: [ :aStyle | aStyle background: self theme default contentBackground ];
				hovered: [ :aStyle | aStyle background: self theme item selectedColor ];
				pressed: [ :aStyle | aStyle background: self theme item pressedColor ])' classified: 'initialization'.
	
	BrMenuSubmenuItemElement compile: 'initializeStyling
	self
		addAptitude: (BrStyleCommonAptitude new
				default: [ :aStyle | aStyle background: self theme default contentBackground ];
				hovered: [ :aStyle | aStyle background: self theme item selectedColor ];
				pressed: [ :aStyle | aStyle background: self theme item pressedColor ])' classified: 'initialization'
]

{ #category : 'colors' }
ZealDarkMode class >> primaryAccentColor [
	"Primary accent - links, focus, selection"
	^ Color fromHexString: '#2196F3'
]

{ #category : 'as yet unclassified' }
ZealDarkMode class >> repaintAll [
	"Force dark backgrounds on all white/light elements in all spaces"
	| darkContent darkBg iconColor lightText count |
	darkContent := ZealDarkMode contentBackground.
	darkBg := ZealDarkMode secondaryHeaderBackground.
	iconColor := Color white alpha: 0.85.
	lightText := Color white alpha: 0.85.
	count := 0.
	BlSpace allSubInstances do: [ :space |
		space root background: ZealDarkMode appBackground.
		space root withAllChildrenBreadthFirstDo: [ :el |
			| bg |
			bg := el background.
			"Handle BlThemeableBackground with stale light theme"
			(bg class name = 'BlThemeableBackground') ifTrue: [
				| cachedBg cachedTheme |
				cachedBg := bg instVarNamed: 'background'.
				cachedTheme := bg instVarNamed: 'theme'.
				(cachedTheme notNil and: [ cachedTheme class name includesSubstring: 'Light' ]) ifTrue: [
					| c |
					c := cachedBg paint color.
					(c red > 0.8 and: [ c green > 0.8 and: [ c blue > 0.8 ] ]) ifTrue: [
						el background: (c red > 0.9 ifTrue: [ darkContent ] ifFalse: [ darkBg ]).
						count := count + 1 ] ] ].
			"Handle BlPaintBackground"
			(bg isKindOf: BlPaintBackground) ifTrue: [
				| c |
				c := bg paint color.
				"Handle BlThemeableColor with white cached color"
				(c class name = 'BlThemeableColor') ifTrue: [
					| cachedColor |
					cachedColor := c instVarNamed: 'color'.
					(cachedColor notNil and: [ cachedColor red > 0.8 and: [ cachedColor green > 0.8 and: [ cachedColor blue > 0.8 and: [ cachedColor alpha > 0.5 ] ] ] ])
						ifTrue: [ 
							el background: (cachedColor red > 0.9 ifTrue: [ darkContent ] ifFalse: [ darkBg ]).
							count := count + 1 ] ].
				"Handle plain light colors"
				((c respondsTo: #red) and: [ (c class name = 'BlThemeableColor') not and: [
					c red > 0.8 and: [ c green > 0.8 and: [ c blue > 0.8 and: [ c alpha > 0.5 ] ] ] ] ])
					ifTrue: [ 
						el background: (c red > 0.9 ifTrue: [ darkContent ] ifFalse: [ darkBg ]).
						count := count + 1 ].
 ].
			"Recolor black text in BlTextElement"
			(el isKindOf: BlTextElement) ifTrue: [
				| text |
				text := el text.
				(text size > 0) ifTrue: [
					| hasFg |
					hasFg := false.
					[(text attributesAt: 1) do: [:attr |
						(attr isKindOf: BlTextForegroundAttribute) ifTrue: [hasFg := true]]] on: Error do: [:e | ].
					hasFg ifFalse: [
						text attribute: (BlTextForegroundAttribute paint: lightText).
						count := count + 1]]] ] ].
	^ count
]

{ #category : 'colors' }
ZealDarkMode class >> secondaryHeaderBackground [
	"Secondary headers, sidebars"
	^ Color fromHexString: '#30353E'
]

{ #category : 'colors' }
ZealDarkMode class >> secondaryTextColor [
	"Secondary/muted text"
	^ Color fromHexString: '#9E9E9E'
]

{ #category : 'private' }
ZealDarkMode class >> set: aSymbol to: aColor [
	(BrGlamorousColors classVariableNamed: aSymbol) value: aColor
]

{ #category : 'colors' }
ZealDarkMode class >> shadowColor [
	"Shadow color"
	^ Color black alpha: 0.5
]

{ #category : 'colors' }
ZealDarkMode class >> successColor [
	"Success status"
	^ Color fromHexString: '#4CAF50'
]

{ #category : 'colors' }
ZealDarkMode class >> textColor [
	"Primary text color"
	^ Color white alpha: 0.85
]

{ #category : 'colors' }
ZealDarkMode class >> warningColor [
	"Warning/failure status"
	^ Color fromHexString: '#FF9800'
]
