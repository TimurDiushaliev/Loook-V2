import 'package:flutter/material.dart';

class InfoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: _height * 0.05, left: _width * 0.05),
          child: Text(
            'Описание:',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          width: _width * 0.9,
          margin: EdgeInsets.only(top: _height * 0.02, left: _width * 0.03),
          child: Text(
            'ажвыпджфпжкутажцукифмкжфмькупижмдуцоазфцушгжакуорпиуфшжгщоатжррмктмдукдюпм\мдкшщмтяваравгшрукшдмркднушапдакушдыпшнукд',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
