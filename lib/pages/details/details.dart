import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../models/receita.dart';

class Details extends StatelessWidget {

  final Receita receita;

  Details({Key key, @required this.receita}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildDetails();
  }

  Widget _buildDetails() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildImageDetails(receita.foto),
          _buildTitleDetails(receita.titulo),
          _buildRowDescriptionDetails('${receita.porcoes} porções', receita.tempoPreparo),
          _buildSubTitleDetails('Ingredientes'),
          _buildTextDetails(receita.ingredientes),
          _buildSubTitleDetails('Modo de preparo'),
          _buildTextDetails(receita.modoPreparo),
        ],
      ),
      appBar: _buildAppBar(),
    );
  }
  
  Widget _buildImageDetails(image) {
    return Image.asset(image);
  }

  Widget _buildTitleDetails(titulo) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildRowDescriptionDetails(rendimento, time_cooking) {
    return Row(
      children: <Widget>[
        _buildColumnDescriptionDetails(Icons.restaurant, rendimento),
        _buildColumnDescriptionDetails(Icons.timer, time_cooking)
      ],
    );
  }

  //expanded é como se fosse o grid, ele vai repartir em tamanhos iguais
  Widget _buildColumnDescriptionDetails(icon, text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.deepOrange,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitleDetails(subtitle) {
    return Center(
      child: Text(
        subtitle,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildTextDetails(text) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(text),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: null,
    );
  }

}