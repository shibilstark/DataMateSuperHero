import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';
import 'package:super_hero/presentation/home/home.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key, required this.superHero});

  final Datas superHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(superHero.superheroName),
        ),
        body: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(superHero.photo))),
              ),
              Row(
                children: [_DataTileWidget(title: superHero.name)],
              ),
            ],
          ),
        ));
  }
}

class _DataTileWidget extends StatelessWidget {
  const _DataTileWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
            decoration: BoxDecoration(color: Colors.deepPurple[300]),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )),
      ),
    ));
  }
}
