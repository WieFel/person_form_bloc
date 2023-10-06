import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../person_form/person_form.dart';

part 'event_attendee_event.dart';

part 'event_attendee_state.dart';

class EventAttendeeBloc extends Bloc<EventAttendeeEvent, EventAttendeeState> {
  EventAttendeeBloc() : super(const EventAttendeeInitial()) {
    on<EventAttendeeAdded>(_onEventAttendeeAdded);
    on<EventAttendeeChanged>(_onEventAttendeeChanged);
    on<EventAttendeeDeleted>(_onEventAttendeeDeleted);
  }

  FutureOr<void> _onEventAttendeeAdded(
    EventAttendeeAdded event,
    Emitter<EventAttendeeState> emit,
  ) async {
    var newAttendees = List.of(state.attendees)..add(const PersonFormState());

    emit(EventAttendeeFilled(
      newAttendees,
      isValid: newAttendees.every((attendee) => attendee.isValid),
    ));
  }

  FutureOr<void> _onEventAttendeeChanged(
    EventAttendeeChanged event,
    Emitter<EventAttendeeState> emit,
  ) async {
    var newAttendees = List.of(state.attendees);
    newAttendees[event.index] = event.attendee;

    emit(EventAttendeeFilled(
      newAttendees,
      isValid: newAttendees.every((attendee) => attendee.isValid),
    ));
  }

  FutureOr<void> _onEventAttendeeDeleted(
    EventAttendeeDeleted event,
    Emitter<EventAttendeeState> emit,
  ) async {
    var newAttendees = List.of(state.attendees)..removeAt(event.index);

    emit(EventAttendeeFilled(
      newAttendees,
      isValid: newAttendees.every((attendee) => attendee.isValid),
    ));
  }
}
