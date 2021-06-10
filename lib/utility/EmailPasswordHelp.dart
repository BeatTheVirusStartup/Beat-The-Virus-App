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
                            text:
                                'For Email please use your Existing Gmail ID Only',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text:
                                'Please create New Password as per below parameters -: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4)),
                        TextSpan(
                            text: '\n \u2022 Exactly 8 characters long',
                            style: TextStyle(
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
