#import "@local/lingex:2.0.0": *


Example #exref(<donkey>) has two interpretations: an existential interpretation, as in #exref(<exist>), and a universal interpretation, as in #exref(<forall>).

#ex(<donkey>)[
	Every farmer who owns a donkey cherishes it.
	#a(<exist>)[ 
		Existential interpretation: ... cherishes some donkeys they owns.
	]
	#a(<forall>)[ 
		Universal interpretation: ... cherishes all donkeys they owns.
	]
]

Do note:

#ex[
	Examples don’t need labels if they aren’t referenced.
	#a[
		Sub-examples don’t need labels either.
	]
]
