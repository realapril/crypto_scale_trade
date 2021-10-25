import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:crypto_scale_trade/provider/plan_listview_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:line_icons/line_icons.dart';


class PlanListView extends StatefulWidget {
  int index=0;
  List<BuyingPlan> planList;

  PlanListView({Key? key, required this.index, required this.planList}) : super(key: key);

  @override
  _PlanListViewState createState() => _PlanListViewState();
}

class _PlanListViewState extends State<PlanListView> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    widget.planList[widget.index].myController1.text = widget.planList[widget.index].buyingPrice;
    widget.planList[widget.index].myController2.text = widget.planList[widget.index].amount;
  }
  int counter =0;
  @override
  Widget build(BuildContext context) {
    PlanListvewProvider planProvider = Provider.of<PlanListvewProvider>(context);
    counter++;
    // bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if(!visible){
        planProvider.updatePlanPrice(widget.index, widget.planList[widget.index].myController1.text);
        planProvider.updatePlanAmount(widget.index, widget.planList[widget.index].myController2.text);
      }
    });
    final Widget secondaryBackground;
    return Dismissible(
      key: Key(counter.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        planProvider.deletePlan(widget.index);
      },
      background: Container (
        color: Colors.red,
        //Use ListTile here because you can quickly set up ends of the Icon
        child: const ListTile (
          leading: Icon (
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
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
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(height: 10),
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
                  child:
                  Text(widget.planList[widget.index].totalValue,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('원'),
              ],
            ),
            // Divider(
            //   color: Colors.black54,
            // )
          ],
        ),
      ),
    );
  }



}