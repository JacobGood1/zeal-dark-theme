Extension { #name : 'GtAbstractExpandableDebuggerElement' }

{ #category : '*ZealTheme' }
GtAbstractExpandableDebuggerElement >> buildDetailsTabElement [
	| compositeView tabGroup |
	
	compositeView := self collectDetailsPaneDebuggingViews.
	
	tabGroup := compositeView asElementDo: [ :e | e ].
	tabGroup
		matchParent;
		background: ZealDarkMode contentBackground.
	self addDefaultTabsToGroup: tabGroup.
			
	^ tabGroup
]
