
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phundit_app/commons/color.dart';
import 'package:phundit_app/l10n/l10n.dart';
import 'package:phundit_app/presentation/viewAll/widgets/color_picker.dart';
import 'package:phundit_app/theme/theme_cubit.dart';

Color selectedColor = kPinkColor;
void showMyDialog(BuildContext context) {
  final theme = Theme.of(context).textTheme;
  final l10n = context.l10n;
  final themeColor = <Color>[kPinkColor,Colors.cyan,Colors.orange];
  showDialog(
    context: context,
    builder: (BuildContext context) {

      return AlertDialog(
       titlePadding: EdgeInsets.zero,
       contentPadding: EdgeInsets.zero,
        content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {

          return Container(
            height: MediaQuery.of(context).size.height * 0.25,

          child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/noise_background.png'),
                        fit: BoxFit.cover,

                      ),
                    ),
                    child: Center(
                      child: Text(l10n.chooseTheme,
                        style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                    ),
                  ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration:   const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),


                    image: DecorationImage(
                      image: AssetImage('assets/noise_background.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(kLightGrayColor, BlendMode.darken),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(int i = 0; i < themeColor.length; i++)
                          ColorPicker(onPressed: (){

                            selectedColor = themeColor[i];

                            context.read<ThemeCubit>().changeThemeColor(selectedColor);
                            //Navigator.of(context).pop();
                            },
                            borderColor: selectedColor == themeColor[i]
                                ?kBlackColor
                                :Colors.transparent,
                            color: themeColor[i],containerSize: 55,
                            secondContainerSize: 45,),


                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
          //SizedBox(height: 20,),

          
      

      );
    },
  );
}

