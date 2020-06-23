import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  @override
  PhotosState get initialState => PhotosInitial();

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
