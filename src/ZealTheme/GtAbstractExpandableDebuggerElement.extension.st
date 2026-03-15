Extension { #name : 'GtAbstractExpandableDebuggerElement' }

{ #category : '*ZealTheme' }
GtAbstractExpandableDebuggerElement >> buildDetailsTabElement [
	| compositeView tabGroup |
	
	compositeView := self collectDetailsPaneDebuggingViews.
	
	tabGroup := compositeView asElementDo: [ :e | e ].
	tabGroup
		matchParent;
		background: (Color fromHexString: '#262626').
	self addDefaultTabsToGroup: tabGroup.
			
	^ tabGroup
]
