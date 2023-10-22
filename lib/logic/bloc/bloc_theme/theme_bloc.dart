import 'package:bloc/bloc.dart';
import 'package:first_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int index = 0;
  List<ThemeData> themes = CustomThemes.themes;
  ThemeBloc() : super(ThemeInitial()) {
    on<SwitchThemeEvent>(
      (event, emit) {
        ++index;
        
        if (index >= themes.length) {
          index = 0;  
        }
        emit(ThemeSuccessState(themeData: themes[index]));
      },
    );
  }
}
