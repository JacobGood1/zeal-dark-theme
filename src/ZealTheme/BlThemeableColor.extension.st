Extension { #name : 'BlThemeableColor' }

{ #category : '*ZealTheme' }
BlThemeableColor >> adjustBrightness: brightness [
	^ self resolvedColor adjustBrightness: brightness
]

{ #category : '*ZealTheme' }
BlThemeableColor >> adjustSaturation: saturation brightness: brightness [
	^ self resolvedColor adjustSaturation: saturation brightness: brightness
]

{ #category : '*ZealTheme' }
BlThemeableColor >> alpha: aFloat [
	"Resolve the themeable color and return a new Color with the given alpha"
	^ (self blocResolveColorForTheme: (BlTheme default)) alpha: aFloat
]

{ #category : '*ZealTheme' }
BlThemeableColor >> asHexString [
	^ self resolvedColor asHexString
]

{ #category : '*ZealTheme' }
BlThemeableColor >> darker [
	^ self resolvedColor darker
]

{ #category : '*ZealTheme' }
BlThemeableColor >> lighter [
	^ self resolvedColor lighter
]

{ #category : '*ZealTheme' }
BlThemeableColor >> mixed: proportion with: aColor [
	^ self resolvedColor mixed: proportion with: aColor
]

{ #category : '*ZealTheme' }
BlThemeableColor >> muchDarker [
	^ self resolvedColor muchDarker
]

{ #category : '*ZealTheme' }
BlThemeableColor >> muchLighter [
	^ self resolvedColor muchLighter
]

{ #category : '*ZealTheme' }
BlThemeableColor >> negated [
	^ self resolvedColor negated
]

{ #category : '*ZealTheme' }
BlThemeableColor >> resolvedColor [
	"Resolve this themeable color against the current theme"
	^ self blocResolveColorForTheme: BlTheme default
]
