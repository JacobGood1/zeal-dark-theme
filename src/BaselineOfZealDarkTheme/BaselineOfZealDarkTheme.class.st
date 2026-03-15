Class {
	#name : 'BaselineOfZealDarkTheme',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfZealDarkTheme',
	#package : 'BaselineOfZealDarkTheme'
}

{ #category : 'baseline' }
BaselineOfZealDarkTheme >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'ZealDarkTheme'
		]
]
