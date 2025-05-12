import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'squad_state.dart';

class SquadCubit extends Cubit<SquadState> {
  SquadCubit() : super(SquadInitial());
}
