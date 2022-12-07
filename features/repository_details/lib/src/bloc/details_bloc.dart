import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final String errorMessage = 'something went wrong';

  DetailsBloc() : super(DetailsState()) {
    on<GetDetails>(_getDetails);
  }
  void _getDetails(GetDetails event, Emitter<DetailsState> emit) {
    try {
      emit(
        DetailsLoaded(user: event.user),
      );
    } catch (e) {
      Error(
        errormessage: errorMessage,
      );
    }
  }
}
