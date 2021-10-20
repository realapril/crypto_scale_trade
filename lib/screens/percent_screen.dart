import 'package:crypto_scale_trade/component/result_row_percent_cal.dart';
import 'package:crypto_scale_trade/component/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:crypto_scale_trade/provider/percent_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PercentScreen extends StatefulWidget{
  @override
  _PercentScreen createState()=> _PercentScreen();
}

class _PercentScreen extends State<PercentScreen>{

  @override
  Widget build(BuildContext context) {
    PercentProvider percentProvider= Provider.of<PercentProvider>(context);
    TextStyles _txtStyle = TextStyles();
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.percent)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StickyHeader( //1. VTV
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('A가 B가 되면 몇퍼센트 증가/감소?',
                          style: _txtStyle.percentCal_titleTextStyle() ,
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('val A',
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setVtvA,
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
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
                                  Expanded(
                                    flex: 1,
                                    child: Text('B값',
                                      style: _txtStyle.percentCal_plainTextStyle(),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 85.0,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setVtvB,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
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
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: ResultRowPercentWidget(result: percentProvider.getVtvPercent, isPercent: true),
                            ),
                          ],
                        ),
                      ),
                    ),

                    StickyHeader( //4. TTV
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('전체의 A퍼센트는 얼마?',
                          style: _txtStyle.percentCal_titleTextStyle() ,
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('전체',
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setTtvTotal,
                                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
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
                                  Expanded(
                                    flex: 1,
                                    child: Text('퍼센트',
                                      style: _txtStyle.percentCal_titleTextStyle() ,
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 70.0,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setTtvPercent,
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'A',
                                          ),
                                        )
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('%',
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: ResultRowPercentWidget(result: percentProvider.getTtvAnswer, isPercent: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

}