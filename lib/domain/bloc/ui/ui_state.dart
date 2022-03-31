part of 'ui_bloc.dart';

class UiState extends Equatable {
  final bool isDarkMode;
  final String name;
  final String gender;

  const UiState({
    required this.isDarkMode,
    this.name = "",
    this.gender = "",
  });

  UiState copywith({
    bool? isDarkMode,
    String? name,
    String? gender,
  }) =>
      UiState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        name: name ?? this.name,
      );

  @override
  List<Object> get props => [name, isDarkMode];
}
