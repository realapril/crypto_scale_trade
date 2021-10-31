import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/component/saved_plan_card.dart';
import 'package:crypto_scale_trade/db/database.dart';
import 'package:crypto_scale_trade/db/s_plan.dart';
import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListScreen createState()=> _SavedListScreen();

}

class _SavedListScreen extends State<SavedListScreen>{
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<ScalePlanDao>(context, listen: false);

    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
        body: StreamBuilder<List<WholeScalePlanData>>(
          stream: dao.watchAllWPlans(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final data = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (_, index) {
                    final item = data[index];

                    return SavedPlanCard(
                      title: item.name,
                      createdAt: item.lastEditedTime,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: data.length);

            }else{
              return Container();
            }
          },
        )
    );
  }

}