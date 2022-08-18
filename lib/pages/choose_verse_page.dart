import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bible_content_bloc.dart';
import '../models/api_service.dart';

class ChooseVersePage extends StatefulWidget {
  const ChooseVersePage({Key? key}) : super(key: key);

  @override
  State<ChooseVersePage> createState() => _ChooseVersePageState();
}

class _ChooseVersePageState extends State<ChooseVersePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: "TELUSURI"),
            Tab(text: "KETIK"),
            Tab(text: "PILIH"),
          ]),
        ),
        body: const TabBarView(
          children: [
            TelusuriTab(),
            Text("View 2"),
            Text("View 3"),
          ],
        ),
      ),
    );
  }
}

class TelusuriTab extends StatefulWidget {
  const TelusuriTab({Key? key}) : super(key: key);

  @override
  State<TelusuriTab> createState() => _TelusuriTabState();
}

class _TelusuriTabState extends State<TelusuriTab> {
  final map = BibleService.getMap();
  List<String> books = [];

  @override
  void initState() {
    super.initState();
    books = map.keys.toList();
  }

  List<int> chapters = List.generate(60, (index) => index + 1);
  List<int> verses = List.generate(31, (index) => index + 1);

  String selectedBook = "Kejadian";
  int selectedChapter = 1;
  int selectedVerse = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              isExpanded: true,
              style: TextStyle(
                  fontSize: 18,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Colors.white
                      : Colors.black),
              value: selectedBook,
              items: books
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) async {
                setState(() {
                  selectedBook = val.toString();
                });
                int newMaxChapters =
                    BibleService.getMaxChapters(val.toString());
                setState(() {
                  chapters =
                      List.generate(newMaxChapters, (index) => index + 1);
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Pasal",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  style: TextStyle(
                      fontSize: 16,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  value: selectedChapter,
                  items: chapters
                      .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                      .toList(),
                  onChanged: (val) async {
                    setState(() {
                      selectedChapter = int.parse(val.toString());
                    });
                    int newMaxVerses = await BibleService.getMaxVerses(
                      selectedBook,
                      int.parse(
                        val.toString(),
                      ),
                    );
                    setState(() {
                      verses =
                          List.generate(newMaxVerses, (index) => index + 1);
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Ayat",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  style: TextStyle(
                      fontSize: 16,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  value: selectedVerse,
                  items: verses
                      .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedVerse = int.parse(val.toString());
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BibleContentBloc>(context).add(
                      ChangePassageEvent(
                          book: selectedBook,
                          chapter: selectedChapter,
                          verse: selectedVerse));
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
