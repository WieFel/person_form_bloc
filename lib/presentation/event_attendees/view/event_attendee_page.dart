import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../person_form/person_form.dart';
import '../bloc/event_attendee_bloc.dart';

class EventAttendeePage extends StatelessWidget {
  const EventAttendeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Event attendees'),
      ),
      body: SafeArea(
        child: BlocBuilder<EventAttendeeBloc, EventAttendeeState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.attendees.length,
                    itemBuilder: (context, index) => PersonForm(
                      person: state.attendees[index],
                      onChanged: (newAttendee) {
                        context
                            .read<EventAttendeeBloc>()
                            .add(EventAttendeeChanged(index, newAttendee));
                      },
                      onDelete: () {
                        context.read<EventAttendeeBloc>().add(EventAttendeeDeleted(index));
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: state.isValid ? () => print('SAVED!') : null,
                  child: const Text('Save'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<EventAttendeeBloc>().add(const EventAttendeeAdded());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
