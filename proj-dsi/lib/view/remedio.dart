import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:cardiocare/components/buttons/custom_Floating_Action_Buttom.dart';
import 'package:cardiocare/components/cards/card_remedio.dart';
import 'package:cardiocare/components/inputs/custom_text_field_small.dart';
import 'package:cardiocare/control/remedio/listcardremedio.dart';
import 'package:flutter/material.dart';

class remedio extends StatefulWidget {
  remedio({super.key});

  @override
  State<remedio> createState() => _dieta();
}

class _dieta extends State<remedio> {
  final TextEditingController pesquisa = TextEditingController();
  List _filteredList = [];

  setsetstate(cardRemedio i) {
    i.state = () {
      setState(() {
        _loadData();
        });
    };
    return i;
  }

  @override

  
  void initState() {
    super.initState();
    pesquisa.addListener(_filterList);
    _loadData();
  }

  @override
  void dispose() {
    pesquisa.removeListener(_filterList);
    pesquisa.dispose();
    super.dispose();
  }

  void _filterList() {
    setState(() {
      // Filter the list based on the search text
      // Assuming listaCardremedio returns List<cardRemedio>
      _filteredList = _allItems.where((item) {
        return item.name_remedio.toLowerCase().contains(pesquisa.text.toLowerCase());
      }).toList();
    });
  }

  Future<void> _loadData() async {
    // Load data initially
    _allItems = await listaCardremedio();
    _filterList(); // Filter initial data
  }

  List _allItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customFloatingActionbutton(
        icone: Icon(
          Icons.add_rounded,
          size: MediaQuery.of(context).size.width * (48 / 430),
          color: Colors.white,
        ),
        onpress: () {
          Navigator.of(context).pushNamed('criador_de_remedio').then((_) {
            _loadData(); // Reload data after adding new item
          });
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                const Row(children: [backButton()]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: (180 / 430) * MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (59 / 932),
                        bottom:
                            MediaQuery.of(context).size.height * (25 / 932)),
                    alignment: Alignment.center,
                    child: Text(
                      'Remédios',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ])
              ]),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * (22 / 932)),
                child: customTextFieldsmall(
                  pesquisa: true,
                  label: '',
                  hint: 'Pesquisar remédio',
                  controller: pesquisa,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: (374 / 430) * MediaQuery.of(context).size.width,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await _loadData(); // Reload data on refresh
                    },
                    child: ListView.builder(
                      itemCount: _filteredList.length,
                      itemBuilder: (context, index) {
                        final item = _filteredList[index];
                        return setsetstate(item);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
