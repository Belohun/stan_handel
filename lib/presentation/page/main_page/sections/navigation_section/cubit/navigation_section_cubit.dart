import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class NavigationSectionState {
  const NavigationSectionState(this.isNavigationMenuOpened);

  final bool isNavigationMenuOpened;
}

@injectable
class NavigationSectionCubit extends Cubit<NavigationSectionState> {
  NavigationSectionCubit() : super(const NavigationSectionState(false));

  void changeNavigationMenuState(bool isOpened) {
    if (state.isNavigationMenuOpened == isOpened) return;
    emit(NavigationSectionState(isOpened));
  }
}
