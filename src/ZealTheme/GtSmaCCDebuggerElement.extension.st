Extension { #name : 'GtSmaCCDebuggerElement' }

{ #category : '*ZealTheme' }
GtSmaCCDebuggerElement >> buildParserActions [
	stateActionsList := BrColumnedList new.
	stateActionsList 
		margin: (BlInsets all: 10); 
		addAptitude: BrShadowAptitude;
		background: ZealDarkMode contentBackground;
		rowStencil: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new cellSpacing: 10).
	stateActionsList column
		title: 'Symbol';
		stencil: [ :each | 
			| text |
			text := each first asRopedText.
			text
				attributes:
					(each third
						ifTrue: [ {(BlTextForegroundAttribute paint: ZealDarkMode textColor).
							BlFontWeightAttribute bold} ]
						ifFalse: [ {(BlTextForegroundAttribute paint: Color red)} ]).
			BrLabel new
				aptitude: BrGlamorousLabelAptitude new;
				text: text;
				margin: (BlInsets top: 5 bottom: 5)].
	stateActionsList column
		title: 'Action';
		stencil: [ :each | 
			| text |
			text := each second asRopedText.
			text
				attributes:
					(each third
						ifTrue: [ {(BlTextForegroundAttribute paint: ZealDarkMode textColor).
							BlFontWeightAttribute bold} ]
						ifFalse: [ {(BlTextForegroundAttribute paint: Color red)} ]).
			BrLabel new
				aptitude: BrGlamorousLabelAptitude new;
				text: text;
				margin: (BlInsets top: 5 bottom: 5) ].
	^ stateActionsList
]

{ #category : '*ZealTheme' }
GtSmaCCDebuggerElement >> buildParserStack [
	parserStackList := BrColumnedList new.
	parserStackList
		margin: (BlInsets all: 10);
		addAptitude: BrShadowAptitude;
		background: ZealDarkMode contentBackground;
		rowStencil: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new cellSpacing: 10).
	parserStackList
		addEventHandler: (GtPhlowListToSelectHandler new transformation: [ :each | each first = '' ifFalse: [ each last ] ]).
	parserStackList
		when: BrSelectionChanged
		do: [ :event | event selectedDo: [ :each | self selectedStackItem: (parserStackList items at: each first) last ] ].
	(parserStackList column)
		title: 'Symbol';
		stencil:
				[ :each | 
					(BrLabel new)
						aptitude: (BrGlamorousLabelAptitude new foreground: ZealDarkMode textColor);
						text: (each first ifNil: [ '' ]);
						margin: (BlInsets top: 5 bottom: 5) ].
	(parserStackList column)
		title: 'Value';
		stencil:
				[ :each | 
					(BrLabel new)
						aptitude: BrGlamorousLabelAptitude new;
						text: each last displayString;
						margin: (BlInsets top: 5 bottom: 5) ].
	^ parserStackList
]

{ #category : '*ZealTheme' }
GtSmaCCDebuggerElement >> buildSource [
	| editorElement text |
	text := self session inputText asRopedText.
	text attributes: GtSmaCCCoder defaultTextAttributes.
	editorElement := BrEditor new.
	editorElement
		matchParent;
		margin: (BlInsets all: 10);
		addAptitude: BrShadowAptitude;
		background: ZealDarkMode contentBackground;
		padding: (BlInsets all: 10).
	sourceEditor := editorElement editor.
	sourceEditor text: text.
	^ editorElement
]
