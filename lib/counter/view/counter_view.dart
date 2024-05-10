import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/commons/app_dimes.dart';
import 'package:phundit_app/counter/cubit/counter_cubit.dart';
import 'package:phundit_app/counter/view/counter_text.dart';
import 'package:phundit_app/l10n/l10n.dart';
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const heroTag = 'increment_heroTag';
    const toolTip = 'increment_tooltip';

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: toolTip,
            heroTag: heroTag,
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          SizedBox(height: AppDimes().size8),
          FloatingActionButton(
            tooltip: toolTip,
            heroTag: heroTag,
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
