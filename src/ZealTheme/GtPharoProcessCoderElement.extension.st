Extension { #name : 'GtPharoProcessCoderElement' }

{ #category : '*ZealTheme' }
GtPharoProcessCoderElement >> variablesListElement [
	| list |
	list := BrColumnedList new.
	list margin: (BlInsets all: 10).
	list addEventHandler: (GtPhlowListToSelectHandler new transformation: [ :each | each last ]).
	list column
		title: 'Icon';
		stencil: [ :each | 
			| icon |
			icon := [ each last gtInspectorIcon ifNil: [ each last class systemIcon ] ]
				on: Error
				do: [ :error | self iconNamed: #smallWarningIcon ].
			icon asElement
				margin:
					(BlInsets
						top: 3
						left: 10
						bottom: 3
						right: 0) ].
	list column
		title: 'Variable';
		stencil: [ :each | 
			BrLabel new
				aptitude: (BrGlamorousLabelAptitude new foreground: ZealDarkMode textColor);
				text: each first asString;
				hMatchParent;
				vMatchParent;
				margin:
					(BlInsets
						top: 3
						left: 10
						bottom: 3
						right: 0) ].
	list column
		title: 'Value';
		stencil: [ :each | 
			BrLabel new
				aptitude: (BrGlamorousLabelAptitude new foreground: ZealDarkMode textColor);
				text: (each last printStringLimitedTo: 50);
				hMatchParent;
				vMatchParent;
				margin:
					(BlInsets
						top: 3
						left: 10
						bottom: 3
						right: 0) ].
	^ list
]
