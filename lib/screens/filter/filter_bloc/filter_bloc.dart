import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  @override
  FilterState get initialState => InitialFilterState();

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
