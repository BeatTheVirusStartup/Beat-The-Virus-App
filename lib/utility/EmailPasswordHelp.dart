import 'package:flutter/material.dart';

import 'Size_Config.dart';

void emailPasswordHelp(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Email Example (Use Google Account only)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 testing@gmail.com',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: SizeConfig.safeBlockHorizontal * 4))
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Password Requirements -: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 Include lowercase characters',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 Include uppercase characters',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 Include numerals',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 Include symbols',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4))
                      ])),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Okay')),
                )
              ],
            ),
          ),
        );
      });
}
