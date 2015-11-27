# Eighty #

Eighty takes one parameter: the minimal character-per-line count. If the parameter is not given, then
the line count will be 80. Eighty reads from the standard input:

	echo "hello world" | ./eighty 5

Another method is by catting a file:

	cat filename | ./eighty

## Operations ##

Eighty breaks only on spaces or paragraphs.
Eighty will ignore lines beginning with proper tabs. These lines must form proper paragraphs.
Paragraphs are designated using two newlines.

	Paragraph one

	Paragraph two

		Ignored indentation
	Not ignored

	Paragraph three
		Unignored indentation

		Ignored line
		another ignored line
		and another ignored line

	Not ignored

		Ignored line
		another ignored line
		and another ignored line
	Not ignored

## Precautions ##

Eighty ought to get preprocessed text that has stripped multiple spaces from lines
not starting with a tab. The text should also be ensured not to have lines starting
with tabs inside the paragraph, as the tab will be appended blindly and hence cause
visual artefacts. Normal markdown should be handled well.
