import 'dart:async';

import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/home_components/bienvenido_logo.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PublicidadInicial extends StatelessWidget {
  const PublicidadInicial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int publicidadLenght = 3;
    int initialPageIndex = 0;
    PageController controllerPageView = PageController(
      viewportFraction: 0.85,
      initialPage: 0,
    );

    Size sizeScreen = MediaQuery.of(context).size;

    //PASAR PAGINA
    pasarDePagina() {
      if (context.mounted) {
        if (controllerPageView.positions.isNotEmpty) {
          controllerPageView.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          if (controllerPageView.page! + 1 == publicidadLenght) {
            controllerPageView.animateToPage(initialPageIndex,
                duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          }
        }
      }
    }

    Timer.periodic(const Duration(seconds: 4), (timer) {
      //Este codigo se ejecuta cada 20 segundos
      pasarDePagina();
    });

    //miTimer.cancel();

    return Column(
      children: [
        SizedBox(
          width: sizeScreen.width,
          height: 130,
          child: PageView(controller: controllerPageView, children: [
            BienvenidoLogo(sizeScreen: sizeScreen),
            BienvenidoLogo2(sizeScreen: sizeScreen),
            BienvenidoLogo3(sizeScreen: sizeScreen),
          ]),
        ),
        const SizedBox(height: 5),
        SmoothPageIndicator(
          controller: controllerPageView,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: color400,
            dotColor: color100,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      ],
    );
  }
}
