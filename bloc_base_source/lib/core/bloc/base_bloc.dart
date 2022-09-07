import 'package:bloc_base_source/core/bloc/event.dart';
import 'package:bloc_base_source/core/common/error_type.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import '../common/result.dart';
import '../service/navigation_service.dart';
import 'state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  NavigationService get navigationService => locator<NavigationService>();

  BaseBloc(S state) : super(state) {
    on<E>((event, emit) async {
      if (event is InitialEvent) {
        await onInit(emit);
      } else {
        await handleEvent(event, emit);
      }
    });
  }

  Future<void> handleEvent(E event, Emitter<S> emit);

  Future<void> onInit(Emitter<S> emit) async {}

  Future<void> safeDataCall<T>(
    {
    Future<Result<T>>? callToHost,
    Future<Result<T>>? callToDb,
    Function(T? data)? success,
    Function()? loading,
    Function(String message)? error,
  }) async {
    assert(callToHost != null || callToDb != null,
        "at least callToHost or callToDb must be non-null ");
    Fimber.d("callToHost");
    loading?.call();

    // case 1: Call db before get data from host.
    // case 2: Only call db to get data
    if (callToDb != null) {
      Fimber.d("start call db");
      (await callToDb).when(success: (data) async {
        hideDialogState();
        success?.call(data);
      }, error: (type, message) async {
        if (callToHost == null) {
          hideDialogState();
          error?.call(message);
        }
      });
    }

    // call data from host.
    if (callToHost != null) {
      Fimber.d("start call host");
      (await callToHost).when(success: (data) async {
        hideDialogState();
        success?.call(data);
      }, error: (type, message) async {
        hideDialogState();
        if (type == ErrorType.TOKEN_EXPIRED) {
          error?.call(message);
        } else {
          error?.call(message);
        }
      });
    }
  }

  void hideDialogState() {
    if (state is DialogState) {
      navigationService.pop();
    }
  }
}
