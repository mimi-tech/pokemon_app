import "package:flutter/material.dart";
import "package:mimi_pokemon_app/commons/app_dimes.dart";

class SideModelBG extends StatelessWidget {
  const SideModelBG({super.key, this.snapshot});
  final AsyncSnapshot<List<Color>>? snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimes().size24),
          bottomRight: Radius.circular(AppDimes().size25),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: snapshot?.data ?? [],
        ),
      ),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * AppDimes().size03,
    );
  }
}
