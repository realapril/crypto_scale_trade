import 'package:crypto_scale_trade/component/bottom_nav.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/db/database.dart';
import 'package:crypto_scale_trade/db/s_plan.dart';
import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:crypto_scale_trade/provider/plan_listview_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:provider/provider.dart';


class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{
  late PlanListvewProvider planProvider;
  final ScrollController _scrollController = ScrollController();

  GlobalKey<FormState> formKey = GlobalKey();
  String? title;

  @override
  void initState() {
    super.initState();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    planProvider = Provider.of<PlanListvewProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.scale),
          actions: <Widget>[
            IconButton(
            iconSize: 30.0,
            icon: const Icon(Icons.save_alt_rounded),
            tooltip: 'Save data',
            onPressed: () async {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  if(title!=null){
                    final dao = Provider.of<ScalePlanDao>(context, listen: false);
                    await dao.insertWPlan(
                      WholeScalePlanCompanion(
                        name : Value(title!),
                      ),
                    );
                    planProvider.resetPlan();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('저장완료')));
                  }
                  //TODO 페이지 이동
                }
              },
            ),
            const SizedBox(
              width: 10,
            ),

          ]
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
          child: Column(
              children: [
                _WPlanTitleWidget(),
                Expanded(child: _buildList(context)),
                _addPlanBtnWidget(),
              ],
            ),
        )
    );
  }

  Widget _WPlanTitleWidget(){
    return Container(
      color: Colors.grey[300],
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            onSaved: (val) {
              title = val;
            },
            decoration: const InputDecoration(
              isDense: true,
              hintText: '코인이름',
            ),
          ),
        ),
      ),
    );
  }

  Widget _addPlanBtnWidget(){
    return Row(
      children: [
        SizedBox(
          width: 5.0,
        ),
        Expanded(child:
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue
          ),
          onPressed: () {
            planProvider.addPlan(ScalePlanItem_md( ScalePlan_md('', '', '', false), TextEditingController(), TextEditingController()));
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
            planProvider.addPlan( ScalePlanItem_md( ScalePlan_md('', '', '', true), TextEditingController(), TextEditingController()) );
            _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
            },
          icon: Icon(Icons.add_circle_outline_outlined, size: 18),
          label: Text("매수"),
        )
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );

  }

  Widget _buildList(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
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

  @override
  void dispose() {
    //planProvider.dispose();
    // for (var element in planProvider.plans) {
    //   element.myController1.dispose();
    //   element.myController2.dispose();
    // }
    print("dispose");
    super.dispose();
  }

}
