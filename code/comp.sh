#!/bin/bash


echo; echo; echo "Matthew"; echo; python sblgnt.py ../../sblgnt/61-Mt-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/01-matthew.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Mark"; echo; python sblgnt.py ../../sblgnt/62-Mk-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/02-mark.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Luke"; echo; python sblgnt.py ../../sblgnt/63-Lk-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/03-luke.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "John"; echo; python sblgnt.py ../../sblgnt/64-Jn-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/04-john.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Acts"; echo; python sblgnt.py ../../sblgnt/65-Ac-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/05-acts.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Romans"; echo; python sblgnt.py ../../sblgnt/66-Ro-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/06-romans.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "1 Corinthians"; echo; python sblgnt.py ../../sblgnt/67-1Co-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/07-1corinthians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "2 Corinthians"; echo; python sblgnt.py ../../sblgnt/68-2Co-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/08-2corinthians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Galatians"; echo; python sblgnt.py ../../sblgnt/69-Ga-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/09-galatians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Ephesians"; echo; python sblgnt.py ../../sblgnt/70-Eph-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/10-ephesians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Philippians"; echo; python sblgnt.py ../../sblgnt/71-Php-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/11-philippians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Colossians"; echo; python sblgnt.py ../../sblgnt/72-Col-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/12-colossians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "1 Thessalonians"; echo; python sblgnt.py ../../sblgnt/73-1Th-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/13-1thessalonians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "2 Thessalonians"; echo; python sblgnt.py ../../sblgnt/74-2Th-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/14-2thessalonians.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "1 Timothy"; echo; python sblgnt.py ../../sblgnt/75-1Ti-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/15-1timothy.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "2 Timothy"; python sblgnt.py ../../sblgnt/76-2Ti-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/16-2timothy.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Titus"; echo; python sblgnt.py ../../sblgnt/77-Tit-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/17-titus.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Philemon"; echo; python sblgnt.py ../../sblgnt/78-Phm-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/18-philemon.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Hebrews"; echo; python sblgnt.py ../../sblgnt/79-Heb-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/19-hebrews.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "James"; echo; python sblgnt.py ../../sblgnt/80-Jas-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/20-james.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "1 Peter"; echo; python sblgnt.py ../../sblgnt/81-1Pe-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/21-1peter.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "2 Peter"; echo; python sblgnt.py ../../sblgnt/82-2Pe-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/22-2peter.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "1 John"; echo; python sblgnt.py ../../sblgnt/83-1Jn-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/23-1john.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "2 John"; echo; python sblgnt.py ../../sblgnt/84-2Jn-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/24-2john.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "3 John"; echo; python sblgnt.py ../../sblgnt/85-3Jn-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/25-3john.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Jude"; echo; python sblgnt.py ../../sblgnt/86-Jud-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/26-jude.xml | sort > comp2 && diff comp1 comp2
echo; echo; echo "Revelation"; echo; python sblgnt.py ../../sblgnt/87-Re-morphgnt.txt > comp1 && python parse_xml.py ../syntax-trees/sblgnt/xml/27-revelation.xml | sort > comp2 && diff comp1 comp2
