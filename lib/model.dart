class Option {
  String opt;
  bool isCorrect;

  Option({
    required this.opt,
    required this.isCorrect,
  });
}

class Question {
  String txt;
  List<Option> options;
  bool isLocked;

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
        Option(opt: 'Diamond', isCorrect: false),
        Option(opt: 'Graphite', isCorrect: false),
        Option(opt: 'Glass', isCorrect: true),
        Option(opt: 'Common Salt', isCorrect: false),
      ]),
  Question(
      txt:
          'NaCl typecrystal (with coordination no. 6 : 6) can be converted into CsCl type crystal (with coordination no. 8 : 8) by applying',
      options: [
        Option(opt: 'high temperature', isCorrect: false),
        Option(opt: 'high pressure', isCorrect: true),
        Option(opt: 'high temperature and high pressure', isCorrect: false),
        Option(opt: 'low temperature and low pressure', isCorrect: false),
      ]),
  Question(
      txt:
          'How many chloride ions are surrounding sodium ion in sodium chloride crystal ?',
      options: [
        Option(opt: '4', isCorrect: false),
        Option(opt: '8', isCorrect: false),
        Option(opt: '12', isCorrect: false),
        Option(opt: '6', isCorrect: true),
      ]),
  Question(txt: 'In NaCl structure', options: [
    Option(opt: 'only octahedral sites are occupied', isCorrect: true),
    Option(
        opt: 'all octahedral and tetrahedral sites are occupied',
        isCorrect: false),
    Option(opt: 'only tetrahedral sites are occupied', isCorrect: false),
    Option(
        opt: 'neither octahedral nor tetrahedral sites are occupied',
        isCorrect: false),
  ]),
  Question(txt: 'In Zinc blende structure', options: [
    Option(opt: 'it has fee structure', isCorrect: false),
    Option(opt: 'each S2- ion is surrounded by six Zn2+ ions', isCorrect: true),
    Option(
        opt: 'zinc ions occupy half of the tetrahedral sites',
        isCorrect: false),
    Option(
        opt: 'each Zn2- ion is surrounded by six sulphide ions',
        isCorrect: false),
  ]),
  Question(
      txt: 'A unit cell of BaCl2 (fluorite structure) is made up of',
      options: [
        Option(opt: 'eight Ba² ions and four Cl- ions', isCorrect: false),
        Option(opt: 'four Ba² ions and six Cl- ions', isCorrect: false),
        Option(opt: 'four Ba2- ions and eight Cl- ions', isCorrect: true),
        Option(opt: 'four Ba2+ ions and four Cl- ions', isCorrect: false),
      ]),
  Question(txt: 'Alkali halids do not show Frenkel defect because', options: [
    Option(opt: 'cations and anions have almost equal size', isCorrect: true),
    Option(
        opt: 'there is a large difference in size of cations and anions',
        isCorrect: false),
    Option(
        opt: 'cations and anions have low coordination number',
        isCorrect: false),
    Option(opt: 'anions cannot be accommodated in voids', isCorrect: false),
  ]),
  Question(
      txt: 'The coordination number of Y will be in the XY types of crystal:',
      options: [
        Option(opt: '8', isCorrect: false),
        Option(opt: '12', isCorrect: false),
        Option(opt: '4', isCorrect: false),
        Option(opt: '6', isCorrect: true),
      ]),
  Question(
      txt:
          'Edge length of unit cell of chromium metal is 287 pm with bcc arrangement. The atomic radius is of the order',
      options: [
        Option(opt: '287 pm', isCorrect: false),
        Option(opt: '574 pm', isCorrect: false),
        Option(opt: '124.27 pm', isCorrect: true),
        Option(opt: '143.5 pm', isCorrect: false),
      ]),
  Question(
      txt:
          'The edge length of fee cell is 508 pm. If radius of cation is 110 pm, the radius of anion is',
      options: [
        Option(opt: '110 pm', isCorrect: false),
        Option(opt: '220 pm', isCorrect: false),
        Option(opt: '285 pm', isCorrect: false),
        Option(opt: '144 pm', isCorrect: true),
      ]),
];
