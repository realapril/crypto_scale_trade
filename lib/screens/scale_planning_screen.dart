import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:crypto_scale_trade/provider/plan_listview_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{
  GlobalKey<FormState> _formKey = GlobalKey();
  late PlanListvewProvider planProvider;

  @override
  Widget build(BuildContext context) {
    planProvider = Provider.of<PlanListvewProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
      body:
      // Scrollbar(
      //   child: SingleChildScrollView(
      //     child:
        Column(
            children: [
              TextField(
                // onChanged: ,
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: '코인이름1',
                ),
              ),
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
            planProvider.addPlan(BuyingPlan('', '', '', TextEditingController(), TextEditingController() ));
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
      itemCount: planProvider.plans.length,
      padding: const EdgeInsets.only(top: 1.0),
      itemBuilder: (context, index) {
        return PlanListView(index: index, planList: planProvider.plans);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  //TODO 벗어나면 저장안된다고 경고문뜰거라 ㄱㅊ
  @override
  void dispose() {
    for (var element in planProvider.plans) {

      element.myController1.dispose();
      element.myController2.dispose();
    }
    super.dispose();
  }

}
