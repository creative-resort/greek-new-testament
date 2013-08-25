# coding: utf-8

import sys
import unicodedata

def n(x):
    return unicodedata.normalize("NFKC", x)


last_bcv = None
token = 1
with open(sys.argv[1]) as f:
    for line in f:
        bcv, pos, ccat, robinson, text, word, norm, lemma = line.strip().decode("utf-8").split()
        if bcv != last_bcv:
            token = 1
            last_bcv = bcv
        else:
            token += 1
        book = int(bcv[:2]) + 39
        chapter = int(bcv[2:4])
        verse = int(bcv[4:6])
        morph_id = "{:02d}{:03d}{:03d}{:03d}".format(book, chapter, verse, token)
        text = text.replace(u"⸂", "").replace(u"⸃", "").replace(u"⸀","")
        if robinson == "A-NUI":
            pos = "NU"
            ccat = "--------"
        print morph_id, pos, ccat, n(text).encode("utf-8"), n(lemma).encode("utf-8")
