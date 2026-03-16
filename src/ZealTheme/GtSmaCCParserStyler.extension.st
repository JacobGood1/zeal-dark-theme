Extension { #name : 'GtSmaCCParserStyler' }

{ #category : '*ZealTheme' }
GtSmaCCParserStyler class >> jediStyler: aParserClass [
	<smaccStyler: #JediParser priority: 50>
	^ (self forParser: aParserClass)
		stylerRules:
		   {GtSmaCCCommentStylerRule
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#9E9E9E') ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediNumberNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#FF9800') ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediStringNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#C98A75') ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediKeywordNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#00BCD4'). styler italic ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediKeywordArgNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#00BCD4'). styler italic ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediBooleanNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#E1BEE7'). styler italic ].
			GtSmaCCNodeStylerRule
				nodeClassName: #JediClassNode
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#64B5F6') ].
			JediRainbowStylerRule
				colors: ({'64B5F6'. '81C784'. 'EF9A9A'. 'FFE082'. 'FFAB91'. 'CE93D8'. '80DEEA'}
					collect: [ :hex | Color fromHexString: hex ]).
			JediFunctionStylerRule
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#E1BEE7'). styler italic ].
			GtSmaCCNodeVariableStylerRule
				nodeClassName: #SmaCCErrorNode
				variableNames: #(dismissedTokens errorToken)
				styleBlock: [ :styler | styler foreground: (Color fromHexString: '#F44336') ]}
]
