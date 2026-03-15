Extension { #name : 'GtPharoMethodCoderTagsElement' }

{ #category : '*ZealTheme' }
GtPharoMethodCoderTagsElement >> newProtocolEditor [
	| anEditor |
	anEditor := BrEditableLabel new
			text: (self protocolStringFor: pharoMethodCoderViewModel);
			constraintsDo: [ :c | c minWidth: 100 ];
			aptitude: (BrGlamorousEditableLabelAptitude new
					glamorousCodeFont;
					defaultForeground: ZealDarkMode textColor;
					fontSize: 13);
			padding: (BlInsets all: 4);
			switchToEditor;
			requestFocus;
			when: BlKeyDownEvent
				do: [ :evt | 
					evt currentTarget
						fireEvent: (BrDropdownContentChanged new content: (BlElement new size: 0 @ 0)) ];
			when: BrEditorAcceptWish
				do: [ :aWish | 
					aWish currentTarget fireEvent: BrDropdownHideWish new.
					pharoMethodCoderViewModel coder renameProtocol: aWish text asString trimBoth.
					self updateProtocolButton ];
			when: BrEditorCancelWish
				do: [ :aWish | aWish currentTarget fireEvent: BrDropdownHideWish new ];
			whenKey: BlKeyCombination primaryC
				labelDo: [ :aShortcutEvent :aShortcut | Clipboard clipboardText: aShortcutEvent currentTarget text asString ].
	(GtCompletionController
		on: anEditor
		strategy: GtMethodProtocolCompletionStrategy new) install.
	^ anEditor
]
