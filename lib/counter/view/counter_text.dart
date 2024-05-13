import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";
import "package:phundit_app/counter/cubit/counter_cubit.dart";

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);

    return Text(
      NumberFormat().format(count),
      style: theme.textTheme.displayLarge,
    );
  }
}
