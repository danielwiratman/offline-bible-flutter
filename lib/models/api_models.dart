class BibleVerses {
  BibleVerses({
    required this.book,
    required this.chapter,
    required this.verse,
  });
  late final String book;
  late final int chapter;
  late final List<Verse> verse;
  
  BibleVerses.fromJson(Map<String, dynamic> json){
    book = json['book'];
    chapter = json['chapter'];
    verse = List.from(json['verse']).map((e)=>Verse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['book'] = book;
    data['chapter'] = chapter;
    data['verse'] = verse.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Verse {
  Verse({
    required this.number,
    required this.text,
  });
  late final String number;
  late final String text;
  
  Verse.fromJson(Map<String, dynamic> json){
    number = json['number'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['text'] = text;
    return data;
  }
}