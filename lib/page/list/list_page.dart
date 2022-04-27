import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/model/photo_model.dart';
import 'package:lampada_frontend/page/list/widget/leader_item_widget.dart';
import 'package:lampada_frontend/page/list/widget/photo_item_widget.dart';
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

enum ListType { leader, voter, photo }

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

  bool isPhoto = false;

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
      case ListType.photo:
        labelHeader = "Fotos do Local";
        colorHeader = AppColors.tertiary0;
        isLeader = false;
        isPhoto = true;
        setState(() {});
        loadPhotosList();
        break;
    }
    super.initState();
  }

  void loadPhotosList() async {
    setState(() {
      isLoading = true;
    });
    ApiService apiService = ApiService();
    try {
      var result = await apiService.get("foto/pega_tudo");

      for (var e in result) {
        // print(e);
        // print(e["nome"]);

        Photo photo = Photo(
          id: e["id"]?.toInt(),
          path: e["caminho"],
          latitude: e["latitude"]?.toDouble(),
          longitude: e["longitude"]?.toDouble(),
          description: e["descricao"],
        );

        // Voter v = Voter(
        //   name: e["nome"],
        //   phone: e["telefone"],
        //   surname: e["apelido"],
        //   id: e["id"].toString(),
        //   address: Address(
        //     cep: e["endereco"]["cep"] ?? '',
        //     address: e["endereco"]["rua"] ??
        //         '' + ' ' + e["endereco"]["numero"] ??
        //         '',
        //     district: e["endereco"]["bairro"] ?? '',
        //     id: e["endereco"]["id"] ?? '',
        //   ),
        //   birthday: e["data_nascimento"].toString(),
        //   leader: Leader(
        //     name: leaderDetails["nome"],
        //     email: leaderDetails["email"],
        //     cpf: leaderDetails["cpf"],
        //     id: leaderDetails["id"].toString(),
        //   ),
        // );
        // voters.add(VoterItemWidget(voter: v));
        photos.add(PhotoItemWidget(photo: photo));
        setState(() {});
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void loadVoterList() async {
    setState(() {
      isLoading = true;
    });
    ApiService apiService = ApiService();
    try {
      var result = await apiService.get("eleitor/pega_tudo/false");

      var data = json.encode(result.toString());
      var parsed = json.decode(data);
      for (var e in result) {
        // print(e);
        // print(e["nome"]);

        var leaderDetails =
            await apiService.get("colaborador/pega_um/${e["colaborador"]}");

        Voter v = Voter(
          name: e["nome"],
          phone: e["telefone"],
          surname: e["apelido"],
          id: e["id"].toString(),
          address: Address(
            cep: e["endereco"]["cep"] ?? '',
            address: e["endereco"]["rua"] ??
                '' + ' ' + e["endereco"]["numero"] ??
                '',
            district: e["endereco"]["bairro"] ?? '',
            id: e["endereco"]["id"] ?? '',
          ),
          birthday: e["data_nascimento"].toString(),
          leader: Leader(
            name: leaderDetails["nome"],
            email: leaderDetails["email"],
            cpf: leaderDetails["cpf"],
            id: leaderDetails["id"].toString(),
          ),
        );
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

  Future<void> exportData() async {
    String type = '';
    switch (widget.type) {
      case ListType.leader:
        type = 'colaborador';
        break;
      case ListType.voter:
        type = 'eleitor';
        break;
    }
    await js.context.callMethod('open', [
      '${ApiService.URL}/$type/exportar',
    ]);
  }

  bool isLeader = true;

  bool isLoading = false;
  List<LeaderItemWidget> leaders = [];
  List<VoterItemWidget> voters = [];
  List<PhotoItemWidget> photos = [];

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
            !isPhoto
                ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: 270,
                        child: ButtonWidget(
                          label: "Exportar",
                          onTap: () async => await exportData(),
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
                  )
                : Container(),
          ],
        ),
        SizedBox(height: 64),
        !isLoading && isLeader && !isPhoto
            ? Container(
                height: Get.size.height * .5,
                child: ListView.builder(
                  itemCount: leaders.length,
                  itemBuilder: (context, index) {
                    return leaders[index];
                  },
                ),
              )
            : !isLoading && !isLeader && !isPhoto
                ? Container(
                    height: Get.size.height * .5,
                    child: ListView.builder(
                      itemCount: voters.length,
                      itemBuilder: (context, index) {
                        return voters[index];
                      },
                    ),
                  )
                : isPhoto
                    ? Container(
                        height: Get.size.height * .5,
                        child: ListView.builder(
                          itemCount: photos.length,
                          itemBuilder: (context, index) {
                            return photos[index];
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
