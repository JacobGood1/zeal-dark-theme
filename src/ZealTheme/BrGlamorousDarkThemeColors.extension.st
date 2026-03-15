Extension { #name : 'BrGlamorousDarkThemeColors' }

{ #category : '*ZealTheme' }
BrGlamorousDarkThemeColors >> initialize [
	super initialize.

	primaryTextColor := Color fromHexString: '#EAEAEA'.
	secondaryTextColor := Color fromHexString: '#B3B3B3'.
	tertiaryTextColor := Color fromHexString: '#8A8A8A'.
	disabledTextColor := Color fromHexString: '#666666'.
	invertedTextColor := Color fromHexString: '#171B22'.
	appBackgroundColor := Color fromHexString: '#171B22'.
	backdropBackgroundColor := Color fromHexString: '#232830'.
	backdropEmphasisBackgroundColor := Color fromHexString: '#B3B3B3'.
	sidebarBackgroundColor := Color fromHexString: '#30353E'.
	contentBackgroundColor := Color fromHexString: '#232830'.
	groupBackgroundColor := nil.
	raisedBackgroundColor := nil.
	floatBackgroundColor := nil.
	sidebarTextColor := Color fromHexString: '#CFCFCF'.
]
