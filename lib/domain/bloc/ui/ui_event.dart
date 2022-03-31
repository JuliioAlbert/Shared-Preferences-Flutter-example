part of 'ui_bloc.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object> get props => [];
}

class OnChangeTheme extends UiEvent {
  final bool isDarkMode;

  const OnChangeTheme(this.isDarkMode);
}
