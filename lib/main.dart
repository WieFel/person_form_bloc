import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_attendees/bloc/event_attendee_bloc.dart';
import 'person_form/person_form.dart';
import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => EventAttendeeBloc(),
        child: const EventAttendeePage(),
      ),
    );
  }
}

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
                    itemBuilder: (context, index) => BlocProvider<PersonFormCubit>(
                      create: (context) => PersonFormCubit(state.attendees[index]),
                      child: PersonForm(
                        onChanged: (newAttendee) => context
                            .read<EventAttendeeBloc>()
                            .add(EventAttendeeChanged(index, newAttendee)),
                      ),
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
