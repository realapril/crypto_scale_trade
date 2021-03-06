import 'package:crypto_scale_trade/component/result_row_percent_cal.dart';
import 'package:crypto_scale_trade/component/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_scale_trade/provider/percent_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PercentScreen extends StatelessWidget{
  const PercentScreen({Key? key}) : super(key: key);

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
                    _renderHeaderWidget(AppLocalizations.of(context)!.calPercent_vtv_title, _txtStyle.percentCal_titleTextStyle()),//1. VTV
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
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
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      textAlign: TextAlign.right,
                                      textInputAction: TextInputAction.go,
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
                                        textInputAction: TextInputAction.go,
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
                    _renderHeaderWidget(AppLocalizations.of(context)!.calPercent_vi_title,_txtStyle.percentCal_titleTextStyle()),//2. VI
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
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
                    _renderHeaderWidget(AppLocalizations.of(context)!.calPercent_vd_title, _txtStyle.percentCal_titleTextStyle()), //3 VD
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
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
                    _renderHeaderWidget(AppLocalizations.of(context)!.calPercent_ttv_title, _txtStyle.percentCal_titleTextStyle()), //4 TTV
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
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
                    _renderHeaderWidget(AppLocalizations.of(context)!.calPercent_vtp_title, _txtStyle.percentCal_titleTextStyle()),//5. VTP
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
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
                    )
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget _renderHeaderWidget(String text, TextStyle style){
    return Container(
      height: 50.0,
      color: Colors.blueGrey[400],
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: style ,
      ),
    );
  }

}