Extension { #name : 'GtSceneryInspectorElement' }

{ #category : '*ZealTheme' }
GtSceneryInspectorElement >> initialize [
	"I am a container for an inspector view, which will depend on the kind of object I am inspecting."
	<tag: #sceneryListeners>
	super initialize.
	self
		layout: BlFrameLayout new;
		background: ZealDarkMode contentBackground;
		margin: (BlInsets all: 10);
		addAptitude: self shadowAptitude
]
