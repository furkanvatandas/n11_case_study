import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:n11casestudy/data/models/summary.dart';
import 'package:n11casestudy/data/repositories/summary_repository.dart';
import 'package:n11casestudy/screens/home/views/summary/summary_bloc/bloc.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryRepository summaryRepository;

  SummaryBloc(this.summaryRepository) : assert(summaryRepository != null);

  @override
  SummaryState get initialState => SummaryInitial();

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is FetchSummary) {
      yield SummaryLoading();
      try {
        Summary summary = await summaryRepository.getAllSummary();
        yield SummaryLoaded(summary: summary);
      } catch (error) {
        yield SummaryError(error.message);
      }
    }
  }
}
