Extension { #name : 'GtSceneDriller' }

{ #category : '*ZealTheme' }
GtSceneDriller >> newTreeRowElement [
	| hoverColor pressedColor |
	hoverColor := ZealDarkMode textColor.
	pressedColor := ZealDarkMode textColor.
	^ BrHorizontalPane new
		hMatchParent;
		vFitContent;
		alignCenterLeft;
		addChildren: {
			BrLabel new
				beSmallSize;
				id: #elementLabel;
				aptitude: BrGlamorousLabelAptitude new.
			BrButton new
				beTinySize;
				id: #elementId;
				aptitude: (BrGlamorousButtonLabelAptitude new
							hoveredColor: hoverColor;
							pressedColor: pressedColor) +
						(BrGlamorousButtonRectangularAptitude
							paddingScale: 0.8
							heightScale: 0.85
							cornerRadius: 3) + (BrStyleCommonAptitude new
					default: [ :s | s background: (Color gray alpha: 0.1) ];
					hovered: [ :s | s background: (Color gray alpha: 0.2) ];
					pressed: [ :s | s background: (Color gray alpha: 0.3) ]);
				action: [ :aButtonElement | aButtonElement phlow spawnObject: aButtonElement model ].
			BrLabel new
				beSmallSize;
				id: #elementResizers;
				aptitude: (BrGlamorousLabelAptitude new foreground: Color gray).
			BrButton new
				beTinySize;
				id: #phlowContext;
				aptitude: (BrGlamorousButtonLabelAptitude new
							hoveredColor: hoverColor;
							pressedColor: pressedColor) +
						(BrGlamorousButtonRectangularAptitude
							paddingScale: 0.8
							heightScale: 0.85
							cornerRadius: 3) + (BrStyleCommonAptitude new
					default: [ :s | s background: (Color gray alpha: 0.1) ];
					hovered: [ :s | s background: (Color gray alpha: 0.2) ];
					pressed: [ :s | s background: (Color gray alpha: 0.3) ]);
				action: [ :aButtonElement | aButtonElement phlow spawnObject: aButtonElement model ].
			BrButton new
				beTinySize;
				id: #whenAddedToSceneGraph;
				aptitude: (BrGlamorousButtonLabelAptitude new
							hoveredColor: hoverColor;
							pressedColor: pressedColor) +
						(BrGlamorousButtonRectangularAptitude
							paddingScale: 0.8
							heightScale: 0.85
							cornerRadius: 3) + (BrStyleCommonAptitude new
					default: [ :s | s background: (self theme status failureBackgroundColor alpha: 0.6) ];
					hovered: [ :s | s background: (self theme status failureBackgroundColor alpha: 0.8) ];
					pressed: [ :s | s background: (self theme status failureBackgroundColor alpha: 1.0) ]);
				action: [ :aButtonElement | aButtonElement phlow spawnObject: aButtonElement model ] }
]
