Extension { #name : 'GtSmaCCTransformationToolkitDebuggerElement' }

{ #category : '*ZealTheme' }
GtSmaCCTransformationToolkitDebuggerElement >> inspectorListElement [
	| list |
	list := BrColumnedList new.
	list margin: (BlInsets all: 5).
	list border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1).
	list addEventHandler: (GtPhlowListToSelectHandler new transformation: [ :variableNode | variableNode value ]).
	list rowStencil: BrGlamorousColumnedListSelectableRowElementStencilBuilder new.
	(list column)
		title: 'Name';
		cellStencil:
				[ (BrLabel new)
						aptitude: (BrGlamorousLabelAptitude new foreground: ZealDarkMode textColor);
						hMatchParent;
						vFitContent;
						margin:
								(BlInsets
										top: 3
										left: 10
										bottom: 3
										right: 0) ];
		dataBinder: [ :aCellElement :aVariableNode | aCellElement text: aVariableNode key asRopedText ].
	(list column)
		title: 'Value';
		cellStencil:
				[ (BrLabel new)
						aptitude: BrGlamorousLabelAptitude new;
						hMatchParent;
						vFitContent;
						margin:
								(BlInsets
										top: 3
										left: 10
										bottom: 3
										right: 0) ];
		dataBinder:
				[ :aCellElement :aVariableNode | 
					| aRawValue |
					aRawValue := aVariableNode value.
					aCellElement
						text:
							([ aRawValue gtDisplayString asRopedText ]
								on: Error , Halt
								do: [ :error | error messageText asRopedText foreground: Color red ]) ].
	^ list
]
