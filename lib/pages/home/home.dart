import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/receita.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _buildHome(); //_ faz ficar privado
  }

  Widget _buildHome() {
    return Scaffold(
      body: _buildListCard(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildListCard() {
    return FutureBuilder(
      future: DefaultAssetBundle
        .of(context)
        .loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> receitas = json.decode(snapshot.data.toString());
        
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Receita receita = Receita.fromJson(receitas[index]);

              return _buildCard(receita.titulo, receita.foto);
            },
            itemCount: receitas == null ? 0 : receitas.length ,
        );
      },
    );
  }

  Widget _buildCard(titulo, foto) {
    return SizedBox(
      height: 300,
      child: Card(
          margin: EdgeInsets.all(16), // Coloca uma borda de 16 pixels em todos os cantos do card
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildImageCard(foto),
                  _buildGradienteCard(),
                  _buildTextCard(titulo),
                ],
              )
            ],
          )
      ),
    );
  }

  Widget _buildTextCard(titulo) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGradienteCard() {
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter, //gradiente vai começar no topo do nosso elemento
          end: FractionalOffset.bottomCenter, //gradiente vai terminar no fundo do nosso elemento
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ],
        )
      ),
    );
  }

  Widget _buildImageCard(foto) {
    return Image.asset(
      foto,
      fit: BoxFit.fill,
      height: 268,
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text('Cozinhando em casa'),
      ),
    );
  }
}
