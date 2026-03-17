Extension { #name : 'GtCoderCardElement' }

{ #category : '*ZealTheme' }
GtCoderCardElement >> coderNameTextFrom: aString [
	"Convert a coder's name to a styled text"
	<return: #BlText>
	^ aString asRopedText glamorousCodeFont bold
		foreground: self theme button defaultTextColor
]
