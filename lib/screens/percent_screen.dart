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
                        child: Text(AppLocalizations.of(context)!.calPercent_vtv_title,
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
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context)!.calPercent_value,
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setVtvA,
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: 'A  ',
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
                                    flex: 2,
                                    child: Text(AppLocalizations.of(context)!.calPercent_value,
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
                                    flex: 5,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setVtvB,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'B  ',
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
                    StickyHeader( //2. VI
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(AppLocalizations.of(context)!.calPercent_vi_title,
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
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context)!.calPercent_value,
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setViTotal,
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: 'A',
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
                                    flex: 2,
                                    child: Text(AppLocalizations.of(context)!.calPercent_vi_val2,
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
                                    flex: 5,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setViPercent,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'B',
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
                              child: ResultRowPercentWidget(result: percentProvider.getViResult, isPercent: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StickyHeader( //3. VD
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(AppLocalizations.of(context)!.calPercent_vd_title,
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
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context)!.calPercent_value,
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setVdTotal,
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        textAlign: TextAlign.right,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: 'A',

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
                                    flex: 2,
                                    child: Text(AppLocalizations.of(context)!.calPercent_vd_val2,
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
                                    flex: 5,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setVdPercent,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'B',
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
                              child: ResultRowPercentWidget(result: percentProvider.getVdResult, isPercent: false),
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
                        child: Text(AppLocalizations.of(context)!.calPercent_ttv_title,
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
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context)!.calPercent_total ,
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
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
                                    flex: 2,
                                    child: Text(AppLocalizations.of(context)!.calPercent_ttv_val2,
                                      style: _txtStyle.percentCal_plainTextStyle() ,
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 70.0,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setTtvPercent,
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'A  ',
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
                              child: ResultRowPercentWidget(result: percentProvider.getTtvResult, isPercent: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StickyHeader( //5. VTP
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(AppLocalizations.of(context)!.calPercent_vtp_title ,
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
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context)!.calPercent_total ,
                                    style: _txtStyle.percentCal_plainTextStyle(),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        onChanged: percentProvider.setVtpTotal,
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
                                    flex: 2,
                                    child: Text(AppLocalizations.of(context)!.calPercent_value ,
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
                                    flex: 5,
                                    child: SizedBox(
                                        width: 100.0,
                                        child: TextFormField(
                                          onChanged: percentProvider.setVtpValue,
                                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                                          textAlign: TextAlign.right,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            hintText: 'A  ',
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
                              child: ResultRowPercentWidget(result: percentProvider.getVtpPercent, isPercent: true),
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