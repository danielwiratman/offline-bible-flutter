import 'dart:convert';
import 'package:flutter/services.dart';

import 'api_models.dart';

class BibleService {
  static Map<String, int> getMap() => {
        "Kejadian": 50,
        "Keluaran": 40,
        "Imamat": 27,
        "Bilangan": 36,
        "Ulangan": 34,
        "Yosua": 24,
        "Hakim Hakim": 21,
        "Rut": 4,
        "1 Samuel": 31,
        "2 Samuel": 24,
        "1 Raja Raja": 22,
        "2 Raja Raja": 25,
        "1 Tawarikh": 29,
        "2 Tawarikh": 36,
        "Ezra": 10,
        "Nehemia": 13,
        "Ester": 10,
        "Ayub": 42,
        "Mazmur": 150,
        "Amsal": 31,
        "Pengkhotbah": 12,
        "Kidung Agung": 8,
        "Yesaya": 66,
        "Yeremia": 52,
        "Ratapan": 5,
        "Yehezkiel": 48,
        "Daniel": 12,
        "Hosea": 14,
        "Yoel": 3,
        "Amos": 9,
        "Obaja": 1,
        "Yunus": 4,
        "Mikha": 7,
        "Nahum": 3,
        "Habakuk": 3,
        "Zafanya": 3,
        "Hagai": 2,
        "Zakharia": 14,
        "Maleakhi": 4,
        "Matius": 28,
        "Markus": 16,
        "Lukas": 24,
        "Yohanes": 21,
        "Kisah Para Rasul": 28,
        "Roma": 16,
        "1 Korintus": 16,
        "2 Korintus": 13,
        "Galatia": 6,
        "Efesus": 6,
        "Filipi": 4,
        "Kolose": 4,
        "1 Tesalonika": 5,
        "2 Tesalonika": 3,
        "1 Timotius": 6,
        "2 Timotius": 4,
        "Titus": 3,
        "Filemon": 1,
        "Ibrani": 13,
        "Yakobus": 5,
        "1 Petrus": 5,
        "2 Petrus": 3,
        "1 Yohanes": 5,
        "2 Yohanes": 1,
        "3 Yohanes": 1,
        "Yudas": 1,
        "Wahyu": 22
      };

  static Future<BibleVerses> getBibleVerses(String book, int chapter) async {
    final data =
        await rootBundle.loadString('assets/bible_assets/$book/$chapter.json');
    final bibleVerses = BibleVerses.fromJson(json.decode(data));
    return bibleVerses;
  }

  static int getMaxChapters(String book) {
    final map = getMap();
    if (map[book] == null) {
      return 10000;
    } else {
      return map[book]!;
    }
  }

  static Future<int> getMaxVerses(String book, int chapter) async {
    final data =
        await rootBundle.loadString('assets/bible_assets/$book/$chapter.json');
    final bibleVerses = BibleVerses.fromJson(json.decode(data));
    return bibleVerses.verse.length;
  }
}
