import 'package:flutter/material.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:lottie/lottie.dart';

class BienvenidoLogo extends StatelessWidget {
  const BienvenidoLogo({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: color950)),
      //elevation: 1,
      color: mainColor600,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Textos
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: greyColor),
                ),
                Text(
                  'Descrubre lo que tenemos\npara Ti.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: greyColor),
                ),
              ],
            ),
            const VerticalDivider(
                color: Colors.white60, thickness: 3, indent: 30, endIndent: 30),

            //lottie assets
            LottieBuilder.asset(
              'assets/lottie/constructors.json',
              width: 100,
              height: 100,
              repeat: false,
            ),

            //Logo Bianca
            /*Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  minRadius: 35,
                  maxRadius: 35,
                  backgroundColor: Color300,
                  //backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/bianca-lois-app.appspot.com/o/logo%2FLOGO.png?alt=media&token=59e5054b-bfc0-49fd-a692-a4b451660718'),
                ),
                /*Image.network(
                  '',
                  width: 120,
                  height: 120,
                ),*/
              ],
            )*/
          ],
        ),
      ),
    );
  }
}

class BienvenidoLogo2 extends StatelessWidget {
  const BienvenidoLogo2({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 1,
      elevation: 2,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: color950)),
      color: color800,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Textos
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consigueló',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: greyColor),
                ),
                Text(
                  'Consigue tu licencia y\ncertificado ITSE fácil.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: greyColor),
                ),
              ],
            ),
            const VerticalDivider(
                color: Colors.white60, thickness: 3, indent: 30, endIndent: 30),

            //lottie assets
            LottieBuilder.asset('assets/lottie/medals.json',
                width: 80, height: 80, repeat: false),

            //Logo Bianca
            /*Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  minRadius: 35,
                  maxRadius: 35,
                  backgroundColor: Color300,
                  //backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/bianca-lois-app.appspot.com/o/logo%2FLOGO.png?alt=media&token=59e5054b-bfc0-49fd-a692-a4b451660718'),
                ),
                /*Image.network(
                  '',
                  width: 120,
                  height: 120,
                ),*/
              ],
            )*/
          ],
        ),
      ),
    );
  }
}

class BienvenidoLogo3 extends StatelessWidget {
  const BienvenidoLogo3({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //color: Colors.indigoAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(color800, BlendMode.color),
          child: Image.network(
            'https://i.pinimg.com/564x/73/77/c1/7377c1357f86c613bdde553bb3368733.jpg',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
