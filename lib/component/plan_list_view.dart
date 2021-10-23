import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    widget.planList[widget.index].myController3.text = widget.planList[widget.index].totalValue;
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
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
                    //onChanged: ,
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
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    focusNode: widget.planList[widget.index].myFocusNode3,
                    controller: widget.planList[widget.index].myController3,
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
          ],
        ),
      );
  }
}