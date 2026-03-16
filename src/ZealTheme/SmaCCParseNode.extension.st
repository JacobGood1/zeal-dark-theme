Extension { #name : 'SmaCCParseNode' }

{ #category : '*ZealTheme' }
SmaCCParseNode >> gtExploreFor: aView [
	<gtView>
	| topParent |
	topParent := self topParent.
	topParent completeSource isNil ifTrue: [ ^ aView empty ].
	^ aView explicit
		priority: 5;
		title: 'Explore';
		stencil: [ | element editor tree allParents treeElement |
			element := BlElement new.
			element layout: BlLinearLayout horizontal.
			element
				constraintsDo: [ :c | 
					c vertical matchParent.
					c horizontal matchParent ].
			editor := self
					gtSourceEditorWithHighlight: BrGlamorousColors neutralBackgroundColor.
			editor
				constraintsDo: [ :e | 
					e vertical matchParent.
					e horizontal matchParent ];
				beReadOnlyWithSelection;
				addAptitude: BrShadowAptitude;
				background: ZealDarkMode contentBackground;
				margin: (BlInsets all: 10).
			element addChild: editor.
			treeElement := (topParent gtTreeFor: GtPhlowView empty)
					asElementDo: [ :e | e ].
			tree := treeElement children last.
			treeElement
				constraintsDo: [ :e | 
					e vertical matchParent.
					e horizontal matchParent ];
				aptitude: BrShadowAptitude;
				background: ZealDarkMode contentBackground;
				margin: (BlInsets all: 10).
			element addChild: treeElement.
			topParent gtHookEditor: editor toTree: tree.
			allParents := self allParents asIdentitySet.
			tree
				expandSuchThat: [ :each | 
					(allParents includes: each value last)
						or: [ each value second = #nodes
								and: [ allParents anySatisfy: [ :e | each value last includes: e ] ] ] ].
			tree viewModel root
				allChildrenNodesDepthFirstDo: [ :each | each value last = self ifTrue: [ tree selectAndScrollTo: each value ] ].
			element ]
]
