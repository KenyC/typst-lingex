#let exlingcounter = counter("exling")
#let ex(.. its) = {
	let args = its.pos()
	let name = if args.len() == 1 {
		none
	} else if args.len() == 2 and type(args.at(0)) == label {
		args.at(0)
	} else {
		panic("Command #ex only takes up to two arguments")
	}
	let it = args.last();


	block[
		#exlingcounter.step(level: 1)
		#if name != none {
			name
		}
		#grid(
			columns : (auto, auto),
			gutter: 5pt,
			[(#context exlingcounter.display())],
			it
		)
	]
}

#let a(..its) = {
	let args = its.pos()
	let (label, content) = if args.len() == 1{
			(none, args.at(0))
		} 
		else if args.len() == 2 and type(args.at(0)) == label{
			args
		}
		else {
			panic("Command #a only takes up to two arguments")
		}

	[
		#v(0.8em, weak: true)
		#exlingcounter.step(level: 2)
		#grid(
			columns: (1em, auto),
			context exlingcounter.display((.. nums) =>
				numbering("a.", nums.pos().last())
			),
			block[
				#content
			],
		)
		#label
	]
} 
#let exref(it, color: none) = context {
	if type(it) != label {
		panic("exref requires an argument of type label")
	}
	let locations = query(it)
	if locations.len() > 0 {
		let location = locations.last().location();
		let excounter = counter("exling");
		let value_counter = excounter.at(location);
		let colored(it) = if color == none {it} else {text(color, it)}
		link(
			location,
			[(] +
			colored(numbering(
				"1a",
				..value_counter
			)) +
			[)] 
		)
	}
	else {
		panic("No reference with name '" + it + "'")
	}
}
