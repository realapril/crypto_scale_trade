import 'package:crypto_scale_trade/component/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddPlanBtnWidget extends StatelessWidget {
  const AddPlanBtnWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child:
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue
          ),
          onPressed: () {
            // Respond to button press
          },
          icon: Icon(Icons.add_circle_outline_outlined, size: 18),
          label: Text("매도"),
        ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(child:
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red
          ),
          onPressed: () {
            // Respond to button press
          },
          icon: Icon(Icons.add_circle_outline_outlined, size: 18),
          label: Text("매수"),
        )
        ),
      ],
    );
  }
}