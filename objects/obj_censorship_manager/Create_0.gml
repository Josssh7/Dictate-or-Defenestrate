line_height = 28;
column_width = 340;

function calculate_score() {
	var _score = 0;
	var _words = layer_get_all_elements("Text");
	for (var i = 0; i < array_length(_words); i++) {
		var _word = layer_instance_get_instance(_words[i]);
		if (_word.censored) _score += _word.value;
	}
	show_message(_score);
}

//Article Stuff
#region
articles = [
	{	headline: "Human Rights Violations But No More Inflation",
		content: [
			"The government today announced a series of new economic measures that effectively 'make inflation illegal' as outlined by our great leader. While officials claim the changes have once-and-for-all solved inflation, critics argue the policies are a bandaid solution and hardly activate meaningful change.",
			"Reports have emerged of new aggressive policing tactics, with eyewitnesses describing scenes of violence and intimidation. A viral video showed officers forcefully detaining a group of peaceful protestors, raising concerns over human rights violations.",
			"Officials have denied any wrongdoing, stating that 'maintaining order is paramount.' Meanwhile, activists continue to call for transparency and accountability, warning that unchecked authority could lead to further instability.",
		]
	},
	{	headline: "Efficiency Initiatives and Strongly Advised Reassignment",
		content: [
			"As part of the ongoing National Renewal Program, officials confirmed today that over 4,000 individuals have been forcefully reassigned from their posts across civil, educational, and media sectors. The Ministry of Order described the move as a 'strategic consolidation of talent,' aimed at eliminating inefficiencies and reinforcing loyalty within essential departments.",		
			"While some have welcomed the program as a necessary measure to protect societal stability, others have raised concerns over the lack of due process. Dismissals were reportedly based on internal evaluations, though the criteria remain undisclosed. Testimony from an unconfirmed whistleblower reveals that descriptions were highly biased and arbitrary, as part of a political purge.",
			"The program is expected to continue over the coming months, with further “adjustments” planned. Observers warn that the rapid centralization of power may have unforeseen consequences if public trust erodes.",
		]
	},
];

good_words = [
	"great",
	"paramount",
	"loyalty",
	"stability",
]

bad_words = [
	"bandaid",
	"hardly",
	"aggressive",
	"violence",
	"peaceful",
	"violations",
	"intimidation",
	"forcefully",
	"concerns",
	"instability",
	"biased",
	"arbitrary",
	"purge",
	"unforeseen",
	"erodes",
]
#endregion