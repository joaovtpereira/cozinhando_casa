import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildHome(); //_ faz ficar privado
  }

  Widget _buildHome() {
    return Scaffold(
      body: _buildCard(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 300,
      child: Card(
          margin: EdgeInsets.all(16), // Coloca uma borda de 8 pixels em todos os cantos do card
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildImageCard(),
                  _buildTextCard(),
                ],
              )
            ],
          )
      ),
    );
  }

  Widget _buildTextCard() {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        'Blend maravilhoso',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildImageCard() {
    return Image.network(
      'https://respostas.sebrae.com.br/wp-content/uploads/2020/06/como_fazer_hamburguer_caseiro-806x440.jpg',
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
