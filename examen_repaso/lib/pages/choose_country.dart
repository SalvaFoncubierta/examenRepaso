import 'package:examen_repaso/models/flagModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Choose_Country extends StatelessWidget {
  const Choose_Country({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlagModel>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: provider.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            provider.flags2 = snapshot.data as List;
            return ListView.separated(
              itemCount: provider.countriesList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(provider.flags2[index]),
                title: Text(provider.countriesList[index]),
              ),
              separatorBuilder:
                  (_, __) => // Separador, la barra espaciadora es porque no se va a utilizar ese argumento
                      const Divider(),
            );
          } else if(snapshot.hasError){
            return Center(child: Text("Ha ocurrido un error"),);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}