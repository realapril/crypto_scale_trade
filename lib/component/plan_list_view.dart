import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:crypto_scale_trade/provider/plan_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanListView extends StatefulWidget {
  int index=0;
  List<BuyingPlan> planList;

  PlanListView({Key? key, required this.index, required this.planList}) : super(key: key);

  @override
  _PlanListViewState createState() => _PlanListViewState();
}

class _PlanListViewState extends State<PlanListView> {
  @override
  void initState() {
    super.initState();
    widget.planList[widget.index].myController1.text = widget.planList[widget.index].buyingPrice;
    widget.planList[widget.index].myController2.text = widget.planList[widget.index].amount;
  }

  @override
  Widget build(BuildContext context) {
    ScalePlanProvider planProvider= Provider.of<ScalePlanProvider>(context);

    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('평단')
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: planProvider.setBuyingPrice,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: widget.planList[widget.index].myFocusNode1,
                    controller: widget.planList[widget.index].myController1,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      isDense: true,
                    ),
                  ),
                ),
                Text('원'),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('수량')
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: planProvider.setAmount,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: widget.planList[widget.index].myFocusNode2,
                    controller: widget.planList[widget.index].myController2,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      isDense: true,
                    ),
                  ),
                ),
                Text('개')
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('투자금액')
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(planProvider.getTotalValue,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ), //AppLocalizations.of(context)!.calPercent_result
                  //style: _txtstyle.percentCal_plainTextStyle(),

                  //child: TextField(
                  //   keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  //   focusNode: widget.planList[widget.index].myFocusNode3,
                  //   controller: widget.planList[widget.index].myController3,
                  //   textInputAction: TextInputAction.go,
                  //   textAlign: TextAlign.right,
                  //   decoration: const InputDecoration(
                  //     isDense: true,
                  //   ),
                  //),
                ),
                Text('원'),
              ],
            ),
          ],
        ),
      );
  }
}