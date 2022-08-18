part of 'bible_content_bloc.dart';

@immutable
abstract class BibleContentEvent {}

class LoadApiEvent extends BibleContentEvent {}

class ChangePassageEvent extends BibleContentEvent {
  ChangePassageEvent(
      {required this.book, required this.chapter, required this.verse});
  final String book;
  final int chapter;
  final int verse;
}
