part of 'bible_content_bloc.dart';

@immutable
abstract class BibleContentState {}

class BibleContentInitial extends BibleContentState {}

class BibleContentLoaded extends BibleContentState {
  BibleContentLoaded(this.verses);
  final BibleVerses verses;
}

class BibleContentLoading extends BibleContentState {}
