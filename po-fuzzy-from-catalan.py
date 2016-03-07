#!/usr/bin/python3

import polib
import sys


po_val= polib.pofile(sys.argv[1])
po_cat= polib.pofile(sys.argv[2])


for entry_val in po_val:
	for entry_cat in po_cat:
		if entry_cat.msgid == entry_val.msgid and entry_cat.msgstr != entry_val.msgstr:
			print(" ** Found diff Catalan translation  : " + entry_cat.msgstr)
			if not 'fuzzy' in entry_val.flags:
				 entry_val.flags.append('fuzzy')


 
po_val.save()
