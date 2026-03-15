Extension { #name : 'GtFilterTagElement' }

{ #category : '*ZealTheme' }
GtFilterTagElement >> createEditableLabel [
	| anEditor |
	anEditor := BrEditor new
		beMode: BrTextEditorEditableSingleLineMode new;
		fitContent;
		id: GtFilterTagEditorId;
		aptitude: BrGlamorousRegularEditorAptitude new glamorousRegularFont glamorousCodeSmallSize;
		background: ZealDarkMode contentBackground;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		margin: (BlInsets top: 2 left: 0 bottom: 2 right: 3);
		padding: (BlInsets top: 1 left: 2 bottom: 1 right: 2);
		constraintsDo: [ :c | c minWidth: 16 ];
		text: ''.
	anEditor addShortcut: (BlShortcutWithAction new
		combination: BlKeyCombination enter;
		action: [ :anEvent |
			self
				requestUpdateFilter: filterDescriptor
				value: anEvent currentTarget text asString trimmed ]).
	anEditor when: BlFocusOutEvent do: [ :anEvent |
		anEvent isDueToRemoval
			ifFalse: [
				self
					requestUpdateFilter: filterDescriptor
					value: anEvent currentTarget text asString trimmed ] ].
	^ anEditor
]

{ #category : '*ZealTheme' }
GtFilterTagElement >> initialize [
	super initialize.
	
	availableFilterDescriptors := #().
	
	self
		fitContent;
		alignCenterLeft;
		beInSingleCompositionLayer;
		beFocusable.
	
	self addAptitude:
		(BrStyleCommonAptitude new
			default: [ :aStyle | 
				aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
				aStyle background: self theme status neutralBackgroundColor ];
			hovered: [ :aStyle | 
				aStyle background: self theme status neutralBackgroundColor darker ];
			focused: [ :aStyle |
				aStyle background: self theme editor focusedBorderColor lighter lighter ]).
	filterLabel := self createFilterLabelHandle.
	filterLabel margin: (BlInsets top: 2 right: 0 bottom: 2 left: 4).
	filterPickerHandle := self createFilterPickerHandle.
	filterPickerHandle margin: (BlInsets top: 1 right: 4).
	self addChildren:  {
		filterLabel.
		filterPickerHandle
	}.
	self addAptitude: (BrStyleCommonAptitude new
		// #label;
		default: [ :aStyle | aStyle foreground: ZealDarkMode textColor ];
		focused: [ :aStyle | aStyle foreground: Color white ]).
	self addAptitude: (BrStyleCommonAptitude new
		// #icon;
		default: [ :aStyle | aStyle background: ZealDarkMode textColor ];
		focused: [ :aStyle | aStyle background: Color white ]).
	self when: BlClickEvent do: [ :anEvent |
		anEvent consumed: true.
		self hasFocus
			ifTrue: [
				filterLabel dispatchEvent: (BrDropdownShowWish new) ].
		self requestFocus ].
	filterPickerHandle
		when: BlClickEvent
		do: [ :anEvent | filterLabel dispatchEvent: BrDropdownShowWish new ].
	self addShortcut: (BlShortcutWithAction new
		combination: (BlKeyCombination backspace);
		action: [ self requestRemoveFilter: filterDescriptor ])
]
