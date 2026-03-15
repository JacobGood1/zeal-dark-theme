Extension { #name : 'GtPhlowBasicViewsToolContentElement' }

{ #category : '*ZealTheme' }
GtPhlowBasicViewsToolContentElement >> buildToolLabel [
	^(BrLabel new)
		aptitude: ((BrGlamorousLabelAptitude new)
					foreground: (Color white alpha: 0.5);
					labelDo: 
							[:aLabel |
							aLabel
								editorMeasurement;
								padding: BlInsets empty]);
		preventMeAndChildrenMouseEvents;
		text: self toolName;
		margin: (BlInsets
					top: 8
					left: 0
					bottom: 8
					right: 0);
		padding: (BlInsets all: 5);
		hMatchParent;
		vFitContent;
		background: (Color fromHexString: '#262626')
]
