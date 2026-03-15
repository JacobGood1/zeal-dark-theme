Extension { #name : 'GtAbstractDefineClassFixItAction' }

{ #category : '*ZealTheme' }
GtAbstractDefineClassFixItAction >> addCreateClassAttributeInEditor: aBrTextEditor [
	| text stencilBlock attribute adornmentAttribute |
	text := aBrTextEditor text.
	stencilBlock := [ | element |
		element := self formCreationElement.
		sourceCoder package
			ifNotNil: [ :package | element form packageAndTagName packageName: package name ].
		sourceCoder packageTag
			ifNotNil: [ :tag | element form packageAndTagName tagName: tag name ].
		element
			addAptitude: BrShadowAptitude;
			background: (Color fromHexString: '#262626');
			margin: (BlInsets all: 10);
			padding: (BlInsets all: 8);
			constraintsDo: [ :c | 
				c textFlow pushLine.
				c horizontal matchParent ].
		element ].
	adornmentAttribute := BrTextAdornmentDynamicAttribute new
			beAppend;
			stencil: stencilBlock.
	attribute := BrGlamorousTriangleExpanderTextAttribute new
			isExpanded: true;
			createdAttributes: {adornmentAttribute};
			attributesCreatingBlock: [ adornmentAttribute ];
			yourself.
	(text from: node name startPosition to: node name stopPosition)
		highlight: (BrGlamorousColors errorBackgroundColor alpha: 0.5).
	text
		attributes: {attribute.
				adornmentAttribute}
		from: self attributePosition
		to: self attributePosition
]
