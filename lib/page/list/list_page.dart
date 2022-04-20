import 'package:flutter/material.dart';
import 'package:lampada_frontend/model/address_model.dart';
import 'package:lampada_frontend/model/leader_model.dart';
import 'package:lampada_frontend/page/list/widget/leader_item_widget.dart';
import 'package:lampada_frontend/service/api_service.dart';
import 'package:lampada_frontend/shared/widget/button_widget.dart';
import 'package:lampada_frontend/shared/widget/input_widget.dart';
import 'package:lampada_frontend/shared/widget/page_header_widget.dart';
import 'package:lampada_frontend/shared/widget/toolbar_widget.dart';

import '../../core/core.dart';

class ListPage extends StatefulWidget {
  final String type;
  const ListPage({Key? key, required this.type}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController filterController = TextEditingController();

  Future<void> loadLeaderLists() async {
    ApiService service = ApiService();
    // var response = await service.get("colaborador/pega_tudo");
    leader.add(Leader(
        name: "Victor Balbino Machado",
        address: Address(
          address: "Av. Paulista, 2253",
          cep: "04460-000",
        ),
        id: "1",
        email: "vbmachado123@gmail.com",
        phone: "(00) 00000-0000"));
  }

  Future<void> loadVoterList() async {}

  List<Leader> leader = [];

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "leader":
        loadLeaderLists();
        break;
      case "voter":
        loadVoterList();
        break;
    }

    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Column(children: [
        // ToolbarWidget(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageHeaderWidget(
                  label: "Colaboradores",
                  color: AppColors.secondary0,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 32),
                      width: 150,
                      child: ButtonWidget(
                        label: 'Exportar',
                        onTap: () => {},
                        enabled: true,
                      ),
                    ),
                    Container(
                      width: 270,
                      child: InputWidget.text(
                        label: "Filtrar",
                        hint: "Nome, CPF",
                        prefixIcon: IconButton(
                          onPressed: () => {
                            print("Clicado"),
                          },
                          icon: Icon(
                            Icons.search,
                            color: AppColors.tertiary0,
                          ),
                        ),
                        controller: filterController,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 64,
            ),
            leader
                .map((e) => {
                      LeaderItemWidget(
                        leader: e,
                      )
                    })
                .toList() as Widget
          ]),
        ),
      ]),
    );
  }
}
