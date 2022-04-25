import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/page/list/widget/leader_item_widget.dart';
import 'package:lampada_frontend/service/api_service.dart';
import 'package:lampada_frontend/shared/widget/button_widget.dart';
import 'package:lampada_frontend/shared/widget/input_widget.dart';
import 'package:lampada_frontend/shared/widget/page_header_widget.dart';
import 'package:http/http.dart' as http;

import '../../core/core.dart';
import '../../model/address_model.dart';
import '../../model/leader_model.dart';
import '../../model/voter_model.dart';
import 'widget/voter_item_widget.dart';

enum ListType { leader, voter }

class ListPage extends StatefulWidget {
  final ListType type;
  const ListPage({Key? key, required this.type}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController filterController = TextEditingController();
  late String labelHeader;
  late Color colorHeader;

  @override
  void initState() {
    switch (widget.type) {
      case ListType.leader:
        labelHeader = "Líderes";
        colorHeader = AppColors.primary0;
        isLeader = true;
        setState(() {});
        loadLeaderLists();
        break;
      case ListType.voter:
        labelHeader = "Eleitores";
        colorHeader = AppColors.secondary0;
        isLeader = false;
        setState(() {});
        loadVoterList();
        break;
    }
    super.initState();
  }

  void loadVoterList() async {
    setState(() {
      isLoading = true;
    });
    ApiService apiService = ApiService();
    try {
      var result = await apiService.get("eleitor/pega_tudo/true");

      var data = json.encode(result.toString());
      var parsed = json.decode(data);
      for (var e in result) {
        // print(e);
        // print(e["nome"]);

        Voter v = Voter(
          name: e["nome"],
          phone: e["telefone"],
          surname: e["apelido"],
          id: e["id"].toString(),
          address: Address(
            cep: e["cep"] ?? '',
            address: e["enderedo"]["rua"] ?? '',
            id: e["enderedo"]["id"] ?? '',
          ),
        );

        // Leader l = Leader(
        //   id: e['id'].toString(),
        //   name: e['nome'],
        //   email: e['email'],
        //   authorized: e['autorizado'],
        //   cpf: e['cpf'],
        //   address: Address(
        //     address:
        //         "${e['endereco']['rua']}, ${e['endereco']['numero']} - ${e['endereco']['cep']}",
        //   ),
        // );
        voters.add(VoterItemWidget(voter: v));
        setState(() {});
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  bool isLeader = true;

  bool isLoading = false;
  List<LeaderItemWidget> leaders = [];
  List<VoterItemWidget> voters = [];

  void loadLeaderLists() async {
    setState(() {
      isLoading = true;
    });
    ApiService apiService = ApiService();
    try {
      var result = await apiService.get("colaborador/pega_tudo");

      var data = json.encode(result.toString());
      var parsed = json.decode(data);
      for (var e in result) {
        // print(e);
        // print(e["nome"]);

        Leader l = Leader(
          id: e['id'].toString(),
          name: e['nome'],
          email: e['email'],
          authorized: e['autorizado'],
          cpf: e['cpf'],
          address: Address(
            address:
                "${e['endereco']['rua']}, ${e['endereco']['numero']} - ${e['endereco']['cep']}",
          ),
        );

        leaders.add(LeaderItemWidget(leader: l));
        setState(() {});
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageHeaderWidget(
              label: labelHeader,
              color: colorHeader,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 270,
                  child: ButtonWidget(
                    label: "Exportar",
                    onTap: () => {},
                    enabled: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 270,
                  child: InputWidget.iconButton(
                      prefixIcon: null,
                      label: "Filtrar",
                      hint: "Nome, CPF",
                      suffixIcon: IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.search,
                            color: AppColors.secondary0,
                          )),
                      controller: filterController),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 64),
        !isLoading && isLeader
            ? Container(
                height: Get.size.height * .5,
                child: ListView.builder(
                  itemCount: leaders.length,
                  itemBuilder: (context, index) {
                    return leaders[index];
                  },
                ),
              )
            : !isLoading && !isLeader
                ? Container(
                    height: Get.size.height * .5,
                    child: ListView.builder(
                      itemCount: voters.length,
                      itemBuilder: (context, index) {
                        return voters[index];
                      },
                    ),
                  )
                : Center(
                    child: Column(children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary0,
                        ),
                      ),
                      Text(
                        "Carregando...",
                        style: AppTextStyles.h6_bold,
                      ),
                    ]),
                  ),
      ]),
    );
  }
}
