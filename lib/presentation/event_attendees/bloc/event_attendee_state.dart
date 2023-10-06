part of 'event_attendee_bloc.dart';

abstract class EventAttendeeState {
  final List<PersonInput> attendees;
  final bool isValid;

  const EventAttendeeState(this.attendees, {this.isValid = false});
}

class EventAttendeeInitial extends EventAttendeeState {
  const EventAttendeeInitial() : super(const []);
}

class EventAttendeeFilled extends EventAttendeeState {
  const EventAttendeeFilled(
    List<PersonInput> attendees, {
    bool isValid = false,
  }) : super(attendees, isValid: isValid);
}
