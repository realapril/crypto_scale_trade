import 'package:crypto_scale_trade/component/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultRowPercentWidget extends StatelessWidget {
  const ResultRowPercentWidget({Key? key, required this.result, required this.isPercent}) : super(key: key);
  final String result;
  final bool isPercent;

  @override
  Widget build(BuildContext context) {
    TextStyles _txtstyle = TextStyles();

    if(isPercent){
      return Row(
        children: [
          Expanded(
            flex : 2,
            child: Text(AppLocalizations.of(context)!.calPercent_result,
              style: _txtstyle.percentCal_plainTextStyle(),
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
            child: Text(result,
              style: _txtstyle.percentCal_plainTextStyle(),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text('%',
            style: _txtstyle.percentCal_plainTextStyle(),
          ),
        ],
      );
    }else{
      return Row(
        children: [
          Expanded(
            flex : 2,
            child: Text(AppLocalizations.of(context)!.calPercent_result,
              style: _txtstyle.percentCal_plainTextStyle(),
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
            child: Text(result,
              style: _txtstyle.percentCal_plainTextStyle(),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
        ],
      );
    }
  }
}