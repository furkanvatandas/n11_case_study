import 'package:meta/meta.dart';

@immutable
abstract class SummaryEvent {
  const SummaryEvent();
}

class FetchSummary extends SummaryEvent {}
