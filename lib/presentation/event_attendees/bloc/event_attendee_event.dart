part of 'event_attendee_bloc.dart';

abstract class EventAttendeeEvent {
  const EventAttendeeEvent();
}

class EventAttendeeAdded extends EventAttendeeEvent {
  const EventAttendeeAdded();
}

class EventAttendeeChanged extends EventAttendeeEvent {
  final int index;
  final PersonInput attendee;

  const EventAttendeeChanged(this.index, this.attendee);
}

class EventAttendeeDeleted extends EventAttendeeEvent {
  final int index;

  const EventAttendeeDeleted(this.index);
}
