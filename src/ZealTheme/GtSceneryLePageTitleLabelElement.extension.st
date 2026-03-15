Extension { #name : 'GtSceneryLePageTitleLabelElement' }

{ #category : '*ZealTheme' }
GtSceneryLePageTitleLabelElement >> initializeLabelAptitude [
	"Default label with dark background, and no border."
	<todo: 'The hover color is eagerly computed by BrStyleAptitude>>#when:style: -- how can we look it up dynamically?'>
	
	labelAptitude := BrGlamorousEditableLabelAptitude new
		glamorousRegularFontAndSize bold
		defaultBackground: (Color fromHexString: '#262626');
		yourself.
	labelAptitude styleLook
		default: [ :aStyle | 
			aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 0).
			aStyle background: (Color fromHexString: '#262626').
			aStyle border: BlBorder empty ].
	^ labelAptitude
]
