Extension { #name : 'BrGlamorousEditorDarkTheme' }

{ #category : '*ZealTheme' }
BrGlamorousEditorDarkTheme >> initializeColors [
	super initializeColors
]

{ #category : '*ZealTheme' }
BrGlamorousEditorDarkTheme >> initializeConstants [
	super initializeConstants.
	
	"Variables"
	self constantAt: #pharoDeclaredVariableForeground put: (Color fromHexString: '#2196F3').
	self constantAt: #pharoUndeclaredVariableForeground put: (Color fromHexString: '#F44336').
	self constantAt: #pharoSelfVariableForeground put: (Color fromHexString: '#00BCD4').
	self constantAt: #pharoSuperVariableForeground put: (Color fromHexString: '#00BCD4').
	self constantAt: #pharoThisContextVariableForeground put: (Color fromHexString: '#00BCD4').
	
	"Keywords and control flow"
	self constantAt: #pharoPragmaForeground put: (Color fromHexString: '#4CAF50').
	self constantAt: #pharoReturnArrowForeground put: (Color fromHexString: '#427BB7').
	
	"Strings"
	self constantAt: #pharoStringLiteralForeground put: (Color fromHexString: '#C98A75').
	self constantAt: #pharoSymbolLiteralForeground put: (Color fromHexString: '#C586C0').
	self constantAt: #pharoCharacterLiteralForeground put: (Color fromHexString: '#C98A75').
	
	"Literals"
	self constantAt: #pharoNumberLiteralForeground put: (Color fromHexString: '#FF9800').
	self constantAt: #pharoNilLiteralForeground put: (Color fromHexString: '#FF9800').
	self constantAt: #pharoBooleanLiteralForeground put: (Color fromHexString: '#FF9800').
	
	"Comments and errors"
	self constantAt: #pharoCommentForeground put: (Color fromHexString: '#9E9E9E').
	self constantAt: #pharoErrorTokenForeground put: (Color fromHexString: '#F44336')
]
