# coding: utf-8

import sys
import unicodedata
import xml.parsers.expat


def n(x):
    return unicodedata.normalize("NFKC", x)


class ElementHandler(object):

    def __init__(self, p, name, attr):
        self.p = p
        p.StartElementHandler = self.start_element
        p.EndElementHandler = self.end_element
        p.CharacterDataHandler = self.char_data
        self.start(name, attr)

    def start_element(self, name, attr):
        cls = self.handlers.get(name)
        if cls:
            state = self.p.StartElementHandler, self.p.EndElementHandler, self.p.CharacterDataHandler
            handler = cls(self.p, name, attr)
            handler.parent = self
            handler.return_state = state
        else:
            raise Exception("%s got unknown element %s" % (self.__class__.__name__, name))

    def end_element(self, name):
        self.end(name)
        self.p.StartElementHandler, self.p.EndElementHandler, self.p.CharacterDataHandler = self.return_state
        self.p.StartElementHandler = self.parent.start_element
        self.p.EndElementHandler = self.parent.end_element
        self.p.CharacterDataHandler = self.parent.char_data

    def char_data(self, data):
        pass

    def start(self, name, attr):
        pass

    def end(self, name):
        pass

    handlers = {}


def person(attr):
    if "Person" not in attr:
        if attr["UnicodeLemma"] == u"σύ":
            return "2"
        elif attr["UnicodeLemma"] == u"ἐγώ":
            return "1"
    return dict(First="1", Second="2", Third="3", blank="-")[attr.get("Person", "blank")]


def tvm(attr):
    tense = dict(Present="P", Aorist="A", Future="F", Perfect="X", Imperfect="I", Pluperfect="Y", blank="-")[attr.get("Tense", "blank")]
    voice = dict(Active="A", Middle="M", Passive="P", blank="-")[attr.get("Voice", "blank")]
    mood = dict(Indicative="I", Subjunctive="S", Imperative="D", Optative="O", Infinitive="N", Participle="P", blank="-")[attr.get("Mood", "blank")]
    return tense + voice + mood


def number(attr):
    return dict(Singular="S", Plural="P", blank="-")[attr.get("Number", "blank")]


def pn(attr):
    return "{}{}".format(person(attr), number(attr))


def degree(attr):
    return dict(Comparative="C", Superlative="S", blank="-")[attr.get("Degree", "blank")]


def case(attr):
    return dict(Nominative="N", Accusative="A", Genitive="G", Dative="D", Vocative="V", blank="-")[attr.get("Case", "blank")]


def cng(attr):
    gender = dict(Masculine="M", Feminine="F", Neuter="N", blank="-")[attr.get("Gender", "blank")]
    return case(attr) + number(attr) + gender


def ccat(attr):
    return "{}{}{}{}".format(person(attr), tvm(attr), cng(attr), degree(attr))


class Node(ElementHandler):

    def start(self, name, attr):
        if attr["nodeId"].endswith("0010"):  # leaf nodes
            for key in attr.keys():
                if key not in [
                    "Start", "End",
                    "nodeId", "morphId",
                    "Cat",
                    "Type",
                    "Case", "Number", "Gender",
                    "Tense", "Voice", "Mood",
                    "Person",
                    "Degree",
                    "Unicode", "UnicodeLemma",
                ]:
                    raise Exception, key

            analysis = attr["Cat"]
            if attr["Cat"] in ["noun"]:
                analysis = "N- ----{}-".format(cng(attr))
                assert attr.get("Type") in ["Common", "Proper", None], attr.get("Type")
            elif attr["Cat"] in ["det"]:
                analysis = "RA ----{}-".format(cng(attr))
                assert attr.get("Type") is None, attr.get("Type")
            elif attr["Cat"] in ["adj"]:
                analysis = "A- ----{}{}".format(cng(attr), degree(attr))
                assert attr.get("Type") is None, attr.get("Type")
            elif attr["Cat"] in ["pron"]:
                pos = dict(Personal="RP", Relative="RR", Demonstrative="RD", Interrogative="RI", Indefinite="RI")[attr.get("Type", "Relative")]
                analysis = "{} ----{}-".format(pos, cng(attr))
            elif attr["Cat"] in ["verb"]:
                analysis = "V- {}".format(ccat(attr))
                assert attr.get("Type") is None, attr.get("Type")
            elif attr["Cat"] in ["prep"]:
                analysis = "P- --------"
                assert attr.get("Type") in [None], attr.get("Type")
            elif attr["Cat"] in ["intj"]:
                analysis = "I- --------"
                assert attr.get("Type") in [None], attr.get("Type")
            elif attr["Cat"] in ["ptcl"]:
                analysis = "X- --------"
                assert attr.get("Type") in ["Conditional", None], attr.get("Type")
            elif attr["Cat"] in ["conj"]:
                analysis = "C- --------"
                assert attr.get("Type") in ["Adverbial", "Logical", None], attr.get("Type")
            elif attr["Cat"] in ["adv"]:
                analysis = "D- --------"
                assert attr.get("Type") in ["Indefinite", "Negative", None], attr.get("Type")
            elif attr["Cat"] == "num":
                analysis = "NU ----{}-".format(cng(attr))
                assert attr.get("Type") is None, attr.get("Type")
            else:
                raise Exception, attr["Cat"]

            print attr["morphId"], analysis, n(attr["Unicode"]).encode("utf-8"), n(attr["UnicodeLemma"]).encode("utf-8")


Node.handlers = dict(Node=Node)


class Tree(ElementHandler):

    handlers = dict(Node=Node)


class Trees(ElementHandler):

    handlers = dict(Tree=Tree)


class Sentence(ElementHandler):

    handlers = dict(Trees=Trees)


class Sentences(ElementHandler):

    handlers = dict(Sentence=Sentence)


class Root(ElementHandler):
    def __init__(self, f):
        self.p = p = xml.parsers.expat.ParserCreate()
        p.StartElementHandler = self.start_element
        p.EndElementHandler = self.end_element
        p.CharacterDataHandler = self.char_data
        p.Parse(f.read())

    handlers = dict(Sentences=Sentences)


with open(sys.argv[1]) as f:
    Root(f)
