Extension { #name : 'GtFileBrowserDirectoryElement' }

{ #category : '*ZealTheme' }
GtFileBrowserDirectoryElement >> initialize [
	super initialize.
	
	self matchParent.
	self background: ZealDarkMode contentBackground.
	
	self padding: (BlInsets all: 10).
	toolbar := self createFolderToolbar. 
	toolbar
		hMatchParent
		vFitContent;
		margin: (BlInsets top: 0 left: 13 bottom: 15 right: 0).
	content := self createFolderContent.
	content matchParent.
	
	self addChildren: { 
		toolbar.
		content
	}
]
