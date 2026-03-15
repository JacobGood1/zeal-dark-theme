Extension { #name : 'LePageEditableTitleElement' }

{ #category : '*ZealTheme' }
LePageEditableTitleElement >> createTitleElement [
	| anEditor |
	anEditor := BrEditor new
			aptitude: ((BrGlamorousEditableLabelAptitude basicNew
					setDefaultBorderColor: Color transparent;
					setFocusedBorderColor: Color transparent;
					initialize)
					fontSize: 25;
					defaultBackground: Color transparent;
					glamorousRegularFont;
					bold);
			margin: (BlInsets
					top: 8
					left: LeSnippetView contentPaddingLeft + 3
					bottom: 8
					right: 0);
			padding: (BlInsets
					top: 5
					left: 5
					bottom: 5
					right: 5);
			hMatchParent;
			vFitContent;
			background: self theme default contentBackground;
			when: BrEditorAcceptWish do: [ :aWish | self onAcceptTitleWish: aWish ];
			when: BlFocusOutEvent do: [ :anEvent | self acceptPageTitle ];
			addShortcut: (BlShortcutWithAction new
					combination: BlKeyCombination enter;
					action: [ :aShortcutEvent | 
						self acceptPageTitle.
						self pageViewModel pageModel
							addSnippet: (LeTextSnippet string: '')
							beforeIndex: 1 ]);
			addShortcut: (BlShortcutWithAction new
					combination: BlKeyCombination primaryG;
					action: [ :aShortcutEvent | 
						self hasPage
							ifTrue: [ aShortcutEvent currentTarget phlow spawnTool: self pageViewModel asPhlowTool ] ]);
			addShortcut: (BlShortcutWithAction new
					combination: BlKeyCombination primaryB;
					action: [ :aShortcutEvent | 
						self hasPage
							ifTrue: [ aShortcutEvent currentTarget phlow spawnTool: self pageViewModel asPhlowTool ] ]);
			addShortcut: (BlShortcutWithAction new
					combination: BlKeyCombination primaryR;
					action: [ :aShortcutEvent | aShortcutEvent currentTarget switchToEditor ]);
			addShortcut: (BlShortcutWithAction new
					combination: BlKeyCombination primaryR;
					action: [ :aShortcutEvent | 
						self hasPage
							ifTrue: [ Clipboard clipboardText: self pageViewModel pageTitle asString ] ]).
	^ anEditor
]
