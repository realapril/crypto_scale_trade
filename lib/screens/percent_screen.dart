import 'package:flutter/material.dart';
import 'package:crypto_scale_trade/provider/percent_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PercentScreen extends StatefulWidget{
  @override
  _PercentScreen createState()=> _PercentScreen();
}

class _PercentScreen extends State<PercentScreen>{

  @override
  Widget build(BuildContext context) {
    PercentProvider percentProvider= Provider.of<PercentProvider>(context);

    TextStyle titleTextStyle = GoogleFonts.lato(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
    );

    TextStyle planTextStyle = GoogleFonts.lato(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.percent)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StickyHeader( //4. TTV
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('전체의 A퍼센트는 얼마?',
                          style: titleTextStyle,
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('전체',
                                  style: planTextStyle,
                                ),
                                const SizedBox(
                                  width: 85.0,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setTtvTotal,
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                          isDense: true,
                                        ),
                                      )
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text('퍼센트',
                                    style: planTextStyle,),
                                  const SizedBox(
                                    width: 70.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setTtvPercent,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              isDense: true,
                                            ),
                                        )
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('%',
                                    style: planTextStyle,),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Text('결과',
                                    style: planTextStyle,),
                                  const SizedBox(
                                    width: 84.0,
                                  ),
                                  Expanded(
                                    child: Text(percentProvider.getTtvAnswer,
                                      style: planTextStyle,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Row(
                //   children: [
                //     Text('증가 퍼센트'),
                //     TextField(),
                //     Text('%'),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Text('결과'),
                //     TextField(),
                //     Text('%'),
                //   ],
                // ),


              ]
          ),
        ),
      ),
    );
  }

}