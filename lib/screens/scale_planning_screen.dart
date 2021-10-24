import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

List<BuyingPlan> list = [
  BuyingPlan('', '', '', FocusNode(), FocusNode(), TextEditingController(), TextEditingController()),
];

class _ScalePlanning extends State<ScalePlanningScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
      body:
      // Scrollbar(
      //   child: SingleChildScrollView(
      //     child:
        Column(
            children: [
              Expanded(child: _buildList(context)),
              _addPlanBtnWidget(),
            ],
          )
        // ),
      // )
    );
  }

  Widget _addPlanBtnWidget(){
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
            setState((){
              list.add(BuyingPlan('', '', '', FocusNode(), FocusNode(), TextEditingController(), TextEditingController() ));
            });
          },
          icon: Icon(Icons.add_circle_outline_outlined, size: 18),
          label: Text("매수"),
        )
        ),
      ],
    );

  }
  Widget _buildList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: list.length,
      padding: const EdgeInsets.only(top: 1.0),
      itemBuilder: (context, index) {
        return PlanListView(index: index, planList: list);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  //TODO 벗어나면 저장안된다고 경고문뜰거라 ㄱㅊ
  @override
  void dispose() {
    for (var element in list) {
      element.myFocusNode1.dispose();
      element.myFocusNode2.dispose();

      element.myController1.dispose();
      element.myController2.dispose();
    }

    super.dispose();
  }

}
