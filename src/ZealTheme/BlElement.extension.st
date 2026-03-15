Extension { #name : 'BlElement' }

{ #category : '*ZealTheme' }
BlElement >> gtPreviewFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Preview';
		priority: 2;
		actionUpdateButton;
		stencil: [
			| aPreviewElement aLabel aCaptionText anAddedToSceneHandler aRemovedFromSceneHandler |
			aCaptionText := [ 
				'This is a statically rendered preview', 
					(self isAttachedToSceneGraph 
						ifTrue: [ ' (clickable preview)' ]
						ifFalse: [ ' (not clickable preview)' ]) ].
			aLabel := BrLabel new
					alignCenter;
					hMatchParent;
					aptitude: (BrGlamorousLabelAptitude new foreground: Color gray; glamorousRegularSmallSize);
					text: aCaptionText value.
					
				anAddedToSceneHandler := BlEventHandler
				on: BlElementAddedToSceneGraphEvent 
				do: [ :anEvent | aLabel text: aCaptionText value ].
			aRemovedFromSceneHandler := BlEventHandler
				on: BlElementRemovedFromSceneGraphEvent 
				do: [ :anEvent | aLabel text: aCaptionText value ].
			
			aLabel 
				when: BlElementAddedToSceneGraphEvent 
					do: [ :anEvent | 
						anEvent currentTarget text: aCaptionText value.
						self addEventHandler: anAddedToSceneHandler.
						self addEventHandler: aRemovedFromSceneHandler ];
				when: BlElementRemovedFromSceneGraphEvent 
					do: [ :anEvent | 
						self removeEventHandler: anAddedToSceneHandler.
						self removeEventHandler: aRemovedFromSceneHandler ].
			
			aPreviewElement := BrVerticalPane new.
			aPreviewElement
				matchParent;
				background: aPreviewElement theme status neutralBackgroundColor;
				padding: (BlInsets top: 10 left: 10 bottom: 5 right: 10);
				addChild: (BrFrame new
					matchParent;
					background: (Color fromHexString: '#262626');
					addAptitude: BrShadowAptitude;
					padding: (BlInsets all: 10);
					margin: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
					addChild: (BlScrollableElement new
						id: #scrollable;
						constraintsDo: [ :c |
							c horizontal matchParent.
							c vertical matchParent ];
						addChild: self gtPreviewElement);
					addAptitude: BrGlamorousWithHorizontalScrollbarAptitude;
					addAptitude: BrGlamorousWithVerticalScrollbarAptitude);
				addChild: aLabel.
			aPreviewElement ]
]
