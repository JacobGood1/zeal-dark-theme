Extension { #name : 'GtFilterLabelElement' }

{ #category : '*ZealTheme' }
GtFilterLabelElement >> initializeStyling [
	self
		addAptitude: (BrStyleCommonAptitude new
				default: [ :aStyle | 
					aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
					aStyle background: self theme status neutralBackgroundColor ];
				hovered: [ :aStyle | aStyle background: self theme status neutralBackgroundColor darker ];
				focused: [ :aStyle | aStyle background: self theme editor focusedBorderColor lighter lighter ]).
	self
		addAptitude: (BrStyleCommonAptitude new
				// GtFilterTagLabelId / #label;
				default: [ :aStyle | aStyle foreground: ZealDarkMode textColor ];
				focused: [ :aStyle | aStyle foreground: Color white ])
]
