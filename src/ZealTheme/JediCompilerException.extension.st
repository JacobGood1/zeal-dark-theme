Extension { #name : 'JediCompilerException' }

{ #category : '*ZealTheme' }
JediCompilerException >> generateEditor [
	| anEditor source text topParent errorNode |
	topParent := nodeThatFailed topParent.
	source := topParent completeSource asString.
	errorNode := nodeThatFailed.
	text := source asRopedText glamorousCodeFont.
	anEditor := BrEditor new
		text: text;
		aptitude: BrGlamorousCodeEditorAptitude + BrGlamorousEditorSearchTextAptitude.
	anEditor
		constraintsDo: [ :e | 
			e vertical matchParent.
			e horizontal matchParent ];
		beReadOnlyWithSelection;
		background: Color transparent;
		margin: (BlInsets all: 10).
	"Re-apply Jedi syntax colors after the aptitude has initialized"
	BlTaskAction enqueueElement: anEditor action: [ :a |
		| styledText |
		styledText := anEditor text.
		JediParser gtStyler style: styledText ast: topParent.
		"Highlight the error node with a red box"
		errorNode stopPosition isZero ifFalse: [
			(styledText
				from: (errorNode startPosition min: source size)
				to: (errorNode stopPosition min: source size))
				attributes: { BlTextHighlightAttribute new
					beNotOverwritableByStyler;
					paint: ((Color fromHexString: 'FF6666') alpha: 0.3) } ].
		anEditor text: styledText ].
	self editor: anEditor
]

{ #category : '*ZealTheme' }
JediCompilerException >> gtReaderError: aView [
	<gtView>
	<gtExceptionView>
	| topParent |
	topParent := nodeThatFailed topParent.
	topParent completeSource isNil ifTrue: [ ^ aView empty ].
	^ aView explicit
		priority: 5;
		title: 'Error';
		stencil: [ | container errorMessage |
			self applyChanges.
			errorMessage := BrLabel new
				text: (self messageText asRopedText 
					foreground: (Color fromHexString: 'FF6666'));
				aptitude: (BrGlamorousLabelAptitude new glamorousCodeFont fontSize: 16);
				padding: (BlInsets all: 8);
				constraintsDo: [ :c | c horizontal matchParent. c vertical fitContent ].
			container := BrVerticalPane new matchParent.
			container addChild: errorMessage.
			container addChild: editor.
			container ]
]
