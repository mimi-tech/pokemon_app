import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_bloc.dart";
import "package:mimi_pokemon_app/counter/bloc/counter_event.dart";
import "package:mimi_pokemon_app/counter/components/counter_text.dart";
import "package:mimi_pokemon_app/l10n/l10n.dart";

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEvent.increment),
            child: const Icon(Icons.add),
          ),
          SizedBox(width: AppDimes().size16),
          ElevatedButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEvent.decrement),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
