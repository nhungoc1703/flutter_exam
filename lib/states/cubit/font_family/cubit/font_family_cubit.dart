import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'font_family_state.dart';

class FontFamilyCubit extends Cubit<FontFamilyState> {
  FontFamilyCubit() : super(FontFamilyInitial());

  void getFonts() {
    List<String> fonts = [
      'Charis',
      'Arvo',
      'Gentinum',
      'Inter',
      'Prata',
      'Roboto'
    ];
    emit(FontFamilyLoaded(fontList: fonts));
  }
}
