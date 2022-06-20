class Option {
  String txt;
  bool isCorrect;

  Option({
    required this.txt,
    required this.isCorrect,
  });
}

class Question {
  String txt;
  List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.txt,
    required this.options,
    this.isLocked = false,
  });
}

final questions = [
  Question(
      txt: 'Which one of the following is non-crystalline or amorphous?',
      options: [
        Option(txt: 'Diamond', isCorrect: false),
        Option(txt: 'Graphite', isCorrect: false),
        Option(txt: 'Glass', isCorrect: true),
        Option(txt: 'Common Salt', isCorrect: false),
      ]),
  Question(
      txt:
          'NaCl typecrystal (with coordination no. 6 : 6) can be converted into CsCl type crystal (with coordination no. 8 : 8) by applying',
      options: [
        Option(txt: 'high temperature', isCorrect: false),
        Option(txt: 'high pressure', isCorrect: true),
        Option(txt: 'high temperature and high pressure', isCorrect: false),
        Option(txt: 'low temperature and low pressure', isCorrect: false),
      ]),
  Question(
      txt:
          'How many chloride ions are surrounding sodium ion in sodium chloride crystal ?',
      options: [
        Option(txt: '4', isCorrect: false),
        Option(txt: '8', isCorrect: false),
        Option(txt: '12', isCorrect: false),
        Option(txt: '6', isCorrect: true),
      ]),
  Question(txt: 'In NaCl structure', options: [
    Option(txt: 'only octahedral sites are occupied', isCorrect: true),
    Option(
        txt: 'all octahedral and tetrahedral sites are occupied',
        isCorrect: false),
    Option(txt: 'only tetrahedral sites are occupied', isCorrect: false),
    Option(
        txt: 'neither octahedral nor tetrahedral sites are occupied',
        isCorrect: false),
  ]),
  Question(txt: 'In Zinc blende structure', options: [
    Option(txt: 'it has fee structure', isCorrect: false),
    Option(txt: 'each S2- ion is surrounded by six Zn2+ ions', isCorrect: true),
    Option(
        txt: 'zinc ions occupy half of the tetrahedral sites',
        isCorrect: false),
    Option(
        txt: 'each Zn2- ion is surrounded by six sulphide ions',
        isCorrect: false),
  ]),
  Question(
      txt: 'A unit cell of BaCl2 (fluorite structure) is made up of',
      options: [
        Option(txt: 'eight Ba² ions and four Cl- ions', isCorrect: false),
        Option(txt: 'four Ba² ions and six Cl- ions', isCorrect: false),
        Option(txt: 'four Ba2- ions and eight Cl- ions', isCorrect: true),
        Option(txt: 'four Ba2+ ions and four Cl- ions', isCorrect: false),
      ]),
  Question(txt: 'Alkali halids do not show Frenkel defect because', options: [
    Option(txt: 'cations and anions have almost equal size', isCorrect: true),
    Option(
        txt: 'there is a large difference in size of cations and anions',
        isCorrect: false),
    Option(
        txt: 'cations and anions have low coordination number',
        isCorrect: false),
    Option(txt: 'anions cannot be accommodated in voids', isCorrect: false),
  ]),
  Question(
      txt: 'The coordination number of Y will be in the XY types of crystal:',
      options: [
        Option(txt: '8', isCorrect: false),
        Option(txt: '12', isCorrect: false),
        Option(txt: '4', isCorrect: false),
        Option(txt: '6', isCorrect: true),
      ]),
  Question(
      txt:
          'Edge length of unit cell of chromium metal is 287 pm with bcc arrangement. The atomic radius is of the order',
      options: [
        Option(txt: '287 pm', isCorrect: false),
        Option(txt: '574 pm', isCorrect: false),
        Option(txt: '124.27 pm', isCorrect: true),
        Option(txt: '143.5 pm', isCorrect: false),
      ]),
  Question(
      txt:
          'The edge length of fee cell is 508 pm. If radius of cation is 110 pm, the radius of anion is',
      options: [
        Option(txt: '110 pm', isCorrect: false),
        Option(txt: '220 pm', isCorrect: false),
        Option(txt: '285 pm', isCorrect: false),
        Option(txt: '144 pm', isCorrect: true),
      ]),
];
