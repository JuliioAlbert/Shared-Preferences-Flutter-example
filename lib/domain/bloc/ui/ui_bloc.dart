import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  final bool isDarkMode;
  UiBloc(this.isDarkMode) : super(UiState(isDarkMode: isDarkMode)) {
    on<OnChangeTheme>(
        (event, emit) => emit(state.copywith(isDarkMode: event.isDarkMode)));
  }
}
