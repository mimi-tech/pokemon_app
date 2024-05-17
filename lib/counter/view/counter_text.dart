import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";
import "package:mimi_pokemon_app/counter/counter/counter_bloc.dart";

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterBloc cubit) => cubit.state);

    return Text(
      NumberFormat().format(count),
      style: theme.textTheme.displayLarge,
    );
  }
}
