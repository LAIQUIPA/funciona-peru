class TitulosAnexo4 {
  final String descripcion;
  final List<PreguntasAnexo4> preguntasAnexo4;

  TitulosAnexo4(this.preguntasAnexo4, {required this.descripcion});
}

class PreguntasAnexo4 {
  final String titulo;
  final String pregunta;
  String? funciones;
  PreguntasAnexo4({
    required this.titulo,
    required this.pregunta,
    this.funciones,
  });

  static List<PreguntasAnexo4> preguntasForm1 = [
    PreguntasAnexo4(
        titulo: 'LA EDIFICACION',
        pregunta:
            'No se encuentra en proceso de construcción según lo establecido en el artículo único de la Norma G.040 Definiciones del Reglamento Nacional de Edificaciones'),
    PreguntasAnexo4(
        titulo: 'LA EDIFICACION',
        pregunta:
            'Cuenta con servicios de agua, electricidad, y los que resulten esenciales para el desarrollo de sus actividades, debidamente instalados e implementados'),
    PreguntasAnexo4(
        titulo: 'LA EDIFICACION',
        pregunta:
            'Cuenta con mobiliario básico e instalado para el desarrollo de la actividad.'),
    PreguntasAnexo4(
        titulo: 'LA EDIFICACION',
        pregunta:
            'Tiene los equipos o artefactos debidamente instalados o ubicados, respectivamente, en los lugares de uso habitual o permanente.'),
  ];

  static List<PreguntasAnexo4> preguntasForm2 = [
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'Los medios de evacuación (pasadizos, escaleras, accesos y salidas) del establecimiento presentan un ancho mínimo de 1.20 m y/o que permitan la evacuación de las personas de manera segura. RNE A.010.'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'Los medios de evacuación (pasadizos, escaleras, accesos y salidas) se encuentran libres de obstáculos. RNE A.130 Art 13; A.010 Art 25'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'El establecimiento cuenta con señalización de seguridad (direccionales de salida, salida, zona segura en caso de sismo, riesgo eléctrico, extintores, otros). RNE A.130, Art. 39; NTP 399.010 -1'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'Cuenta con luces de emergencia operativas. RNE- A-130 Art. 40'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'Las puertas que se utilizan como medios de evacuación abren en el sentido del flujo de los evacuantes o permanecen abiertas en horario de atención, sin obstruir la libre circulación y evacuación. RNE A130 Art. 5 y 6'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'En caso de contar con un ambiente con aforo mayor a 100 personas, en cualquier caso, la puerta de salida cuenta con barra antipánico. RNE A130 Art. 8'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE EVACUACIÓN,\nSEÑALIZACIÓN Y OTROS',
        pregunta:
            'No cuenta con material combustible o inflamable debajo de las escaleras que sirvan como medios de evacuación (cartones, muebles, plásticos otros similares). RNE A.010 Art. 26, b16'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'INSTALACIONES ELÉCTRICAS',
        pregunta:
            'El gabinete es de material metálico o de resina termoplástica y se encuentran en buen estado de conservación. CNE-U 020.024, 020.026 b'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'INSTALACIONES ELÉCTRICAS',
        pregunta:
            'Cuenta con interruptores termomagnéticos y corresponden a la capacidad de corriente de los conductores eléctricos que protege. No utiliza llaves tipo cuchilla. CNE-U 080.010, 080.100, 080.400'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'INSTALACIONES ELÉCTRICAS',
        pregunta:
            'Cuenta con un circuito eléctrico por cada interruptor termomagnético. El tablero tiene un interruptor general en su interior o adyacente al mismo. CNE-U 080.010, 080.100, 080.400'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'INSTALACIONES ELÉCTRICAS',
        pregunta:
            'No utiliza conductores flexibles (tipo mellizo) en instalaciones permanentes de alumbrado y/o tomacorriente. CNE-U 030.010.3'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'INSTALACIONES ELÉCTRICAS',
        pregunta:
            'Los circuitos de tomacorrientes no están sobrecargados con extensiones o adaptadores. CNE-U 080.100 a'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Cuenta con extintores operativos y en cantidad adecuada de acuerdo al riesgo existente en el establecimiento. NTP 350.043:2011'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Los extintores cuentan con tarjeta de control y mantenimiento actualizada, a una altura no mayor de 1.50m, numerados, ubicados en los lugares accesibles. Los extintores tienen constancia de operatividad y mantenimiento. RNE A 130 ART 163, 165; NTP 350.043-1'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Los extintores ubicados a la intemperie están colocados dentro de gabinetes o cobertores. RNE A 130 ART 163, 165; NTP 350.043-1'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Cuenta con plan de seguridad para hacer frente a los riesgos de incendio y otros vinculados a la actividad, para establecimientos de dos a más pisos. DS N° 002-2018 PCM.'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Los cilindros (balones) de Gas Licuado de Petróleo (GLP) tipo 10 (menos a 25kg) que cuentan con mangueras del tipo flexible, se encuentran en buen estado de conservación (sin rajaduras, libres de grasa, limpias, con sujeción firme con abrazaderas. DS N° 027-94 EM'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Las instalaciones de GLP que utilizan cilindros tipo 45 (mayores a 25Kg), tienen tuberías de cobre o fierro galvanizado. DS N° 027-94 EM.'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Los cilindros de GLP están alejados de interruptores a una distancia mayor a 0.30m, y mayor a 0.50m de tomacorrientes, se ubican en lugares ventilados y alejados de cualquier fuente de calor. DS N° 027-94 EM'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'MEDIOS DE PROTECCIÓN\nCONTRA INCENDIOS',
        pregunta:
            'Los cilindros de GLP no se encuentran ubicados en nivel de semisótano, sótanos, cajas de escalera, pasillos, pasadizos de uso común y vía pública. DS N° 027-94 EM.'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'COMERCIO',
        pregunta:
            'Cuenta con un sistema de detección y alarma de incendios centralizado operativo. Se encuentran exceptuados: Restaurantes con área construida menor a 300 m2, mercado minorista sin techo común (puestos independientes) solo pulsador de alarma, tienda de área techada menor a 250m2. RNE A.130 Art 89'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'COMERCIO',
        pregunta:
            'Cuenta con extintores operativos en cantidad adecuada de acetato de potasio para ambientes que cuentan con freidora, producen humos y vapores de grasa. NTP 350.043:2011; RNE A-130 Art. 165'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'ENCUENTRO',
        pregunta:
            'Cuenta con un sistema de detección y alarma de incendios centralizado operativo. Están exceptuados los locales menores a 100m2 de área techada. RNE A.130 Art 53'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'ENCUENTRO',
        pregunta:
            'Cuenta con extintores operativos en cantidad adecuada de acetato de potasio (Tipo K) para ambientes que cuentan con freidora, producen humos y vapores de grasa. NTP 350.043:2011; RNE A-130 Art. 165'),
    //OFICINAS ADMINISTRATIVAS
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'OFICINAS ADMINISTRATIVAS',
        pregunta:
            'Cuenta con un sistema de detección y alarma de incendios centralizado operativo. (Están exceptuados los locales menores a 280 m2 de planta techada por piso y hasta 4 pisos, requiriendo en este caso sólo pulsador de alarma). RNE A.130 Art 99'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'OFICINAS ADMINISTRATIVAS',
        pregunta:
            'Para edificaciones con conformidad de obra de una antigüedad no mayor a (5) años\n\nCuenta con sistema de detección y alarma de incendios centralizado operativo, con red húmeda de agua contra incendios y gabinetes de mangueras y con sistema automático de rociadores para oficinas de más de cinco (5) niveles. RNE A-130 Art. 99'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'OFICINAS ADMINISTRATIVAS',
        pregunta:
            'Para edificaciones con conformidad de obra de una antigüedad no mayor a (5) años\n\nCuenta con dos escaleras de evacuación a prueba de fuego y humo y se encuentran operativas. RNE A-130 Art. 26'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'OFICINAS ADMINISTRATIVAS',
        pregunta:
            'Para edificaciones con conformidad de obra de una antigüedad no mayor a (5) años\n\nCuenta con una escalera de evacuación a prueba de fuego y humo y se encuentra operativa, ya que el edificio tiene una altura no mayor a (30) treinta metros, la planta completa de piso no supera el área máxima de 650m2, la carga máxima de evacuantes por planta (piso) no supera las 100 personas, toda la edificación cuenta con un sistema de detección y alarma de incendios centralizado y cumple también con las demás exigencias establecidas en el RNE. RNE A-130 Art. 28 b)'),
    //SALUD
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'SALUD',
        pregunta:
            'En caso de contar con un sistema de detección y alarma de incendio centralizado, este se encuentra operativo; esto es obligatorio para centros de salud de dos o más pisos. RNE A.130 Art 53'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'SALUD',
        pregunta:
            'En caso de contar con escalera de evacuación presurizada, ésta se encuentra operativa y cuenta con constancia de operatividad y mantenimiento. RNE- A 010.-Art26-b'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'SALUD',
        pregunta:
            'En caso de contar con un sistema de protección contra incendios a base de agua, (gabinetes contra incendio y/o rociadores), estos se encuentran operativos y cuenta con constancia de operatividad y mantenimiento. Para centros de salud de tres o más niveles es obligatorio. RNE A-130 Art.100, 159, 160, 105, 153.'),
    //HOSPEDAJE
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'HOSPEDAJE',
        pregunta:
            'Cuenta con extintores operativos en cantidad adecuada, de acetato de potasio (Tipo K) para ambientes que cuentan con freidora, producen humos y vapores de grasa. NTP 350.043:2011; RNE A-130 Art. 165'),
    PreguntasAnexo4(
        funciones: 'PARA LA FUNCION:',
        titulo: 'HOSPEDAJE',
        pregunta:
            'Cuenta con un sistema de detección y alarma de incendios centralizado y se encuentra operativo. RNE A.130 Art 71.'),
  ];

  static List<PreguntasAnexo4> preguntasForm3 = [
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'TODOS',
        pregunta:
            'La cimentación o parte de ella no se encuentra expuesta, inestable en peligro de colapso como consecuencia de filtraciones de agua, erosión, socavamiento, otros. RNE E.050.'),
    //CONCRETO
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de concreto',
        pregunta:
            'Las estructuras de concreto no presentan i) fisuras, grietas, rajaduras, deflexiones, pandeos, muros inclinados, varillas de acero expuestas a la intemperie sin recubrimiento en: columnas, vigas, losas de techos, etc., ii) deterioro por humedad producido por: filtraciones, de tanques y cisternas de almacenamiento de agua, de líquidos, tuberías rotas, lluvias, etc., otras fallas estructurales. RNE E.060'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de concreto',
        pregunta:
            'Las estructuras de la edificación (losas y vigas de techos, azoteas o losas en niveles intermedios), no presentan fisuras, grietas, rajaduras, pandeos, deflexiones, humedad, otros; como consecuencia de sobrecargas existentes producidas por: tanque elevado, equipos, antenas, panel publicitario, otros. RNE E.060, E.020'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de concreto',
        pregunta:
            'Los muros de contención en sótanos, en cercos y otros, no presentan fisuras, grietas, rajaduras, deflexiones, pandeos, inclinaciones, varillas de acero expuestas a la intemperie sin recubrimiento, deterioro por humedad producido por filtraciones de tanques y cisternas de almacenamiento de agua, de líquidos, tuberías rotas, lluvias, etc. y otros. RNE E.060'),
    //LADRILLO
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de\nalbañilería (ladrillo)',
        pregunta:
            'La edificación de albañilería cuenta con elementos de concreto armado de confinamiento, amarre y/o arriostramiento tales como: cimientos, columnas, vigas, losas. RNE E.070'),
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de\nalbañilería (ladrillo)',
        pregunta:
            'Los muros de albañilería no presentan daños: humedad, rajaduras, grietas, inclinaciones, otros. RNE E.070'),
    //ADOBE
    PreguntasAnexo4(
        funciones: 'PARA TODAS LAS FUNCIONES',
        titulo: 'Estructuras de adobe',
        pregunta:
            'Los muros de adobe no presentan fallas ni daños ocasionados por el deterioro y/o humedad (fisuras, grietas, inclinaciones). No es utilizado como muro de contención de suelos, materiales u otros que hagan que pierda su estabilidad. Sobre los muros de adobe no existen construcciones de albañilería o concreto. Los muros de adobe están protegidos de la lluvia en zonas lluviosas. RNE E.080, E.020'),
    //BAMBU
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Estructuras de\nmadera/bambú', pregunta: 'Las estructuras de madera, bambú, no presentan rajaduras, deflexiones, pandeos, deterioro por apolillamiento, humedad, otros. RNE E.010'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Estructuras de\nmadera/bambú', pregunta: 'Las estructuras (postes, columnas, vigas, viguetas, techos entablados, tijerales o cerchas, etc.), no presentan rajaduras, pandeos, deflexiones, como consecuencia de sobrecargas existentes producidas por: tanque elevado, equipos, antenas, panel publicitario, como consecuencia de otros usos que impliquen cargas mayores a la que puede soportar la estructura. RNE E.010, E.020'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Estructuras de\nmadera/bambú', pregunta: 'La estructura de madera se encuentra alejada o aislada de fuentes de calor que podrían dañarla, o en caso de encontrarse próxima a fuentes de calor, se encuentra protegida con material incombustible y/o tratada con sustancias retardantes o ignifugas. RNE E.010 Numeral 11.3.8'),
    //ACERO
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Estructuras de acero', pregunta: 'Las edificaciones o techos de estructura de acero no presentan deformaciones o pandeos excesivos y visibles que perjudiquen su estabilidad. Los apoyos, uniones y anclajes son seguros (tienen pernos y soldaduras en buen estado de conservación). RNE E.090.'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Estructuras de acero', pregunta: 'No presentan deterioro por oxido y/o corrosión y se encuentra protegida contra este. RNE E.090'),
  ];

  static List<PreguntasAnexo4> preguntasForm4 = [
    //OTROS RIESGOS 
    //TODAS LAS FUNCIONES
    //ELECTROCUCION
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'El tablero eléctrico de material metálico está conectado a tierra. CNE-U 060.402.1 h'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'El tablero cuenta con placa de protección (mandil). CNE-U 020.202.1'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Las aberturas no usadas en los tableros eléctricos (espacios de reserva) se encuentran cerradas con tapas. CNE-U 070.3026 '),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Todos los circuitos eléctricos tienen protección de interruptores diferenciales. CNE-U 020.132 (RM No.175-2008-MEM)'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Cuenta con certificado de medición de resistencia del pozo de tierra, firmado por un ingeniero electricista o mecánico electricista colegiado y habilitado, siendo la medida menor o igual a 25 ohmios. Dicho certificado debe tener un periodo de vigencia anual. CNE-U 060.712'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Si cuenta con equipos y/o artefactos eléctricos, (hornos microondas, congeladoras, refrigeradoras, lavadoras, calentadores y similares) los enchufes tienen espiga de puesta a tierra y los tomacorrientes cuentan con conexión al sistema de puesta a tierra. CNE-U 060 512.c'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Las carcasas de los motores eléctricos estacionarios, grupos electrógenos y equipos de aire acondicionado están conectados al sistema de puesta a tierra. CNE-U 060.400, 060.402 '),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Las estructuras metálicas de techos, anuncios publicitarios, canaletas y otros, que tienen instalado equipamiento eléctrico y se encuentran al alcance de una persona parada sobre el piso, deben estar conectados al sistema de puesta a tierra. CNE-U 060.002, 060.400'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Los conductores eléctricos utilizados se encuentran protegidos con tubos o canaletas de PVC. CNEU 070.212'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de Electrocución', pregunta: 'Las cajas de paso de conductores eléctricos deben tener tapa. CNE-U 070.3002, 070.3004'),
    //Riesgo de caidas
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de caidas', pregunta: 'Las rampas tienen una pendiente no mayor al 12% permitiendo la evacuación, tienen pisos antideslizantes y tienen barandas. RNE A.130, Art. 16'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de caidas', pregunta: 'Las aberturas al exterior ubicadas a una altura mayor a 1.00 m sobre el suelo, en tragaluces, escaleras y azotea cuentan con protección al vacío de altura mínima de 1.00m, para evitar caídas. RNE NTE 060 Art. 11; RNE A.010 Art. 33'),
    //Riesgo de colapso en estructuras de soporte y otros
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Las estructuras que soportan las antenas y/o paneles publicitarios son seguras, estables, tienen anclajes y se encuentran en buen estado de conservación, no presentan óxido o corrosión, inclinaciones que podrían desestabilizarlas y ocasionar su colapso. RNE E.090, GE.040 Art. 11 y 12'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Las estructuras metálicas de soporte de productos de almacenamiento (racks) están fijas, asegurando su estabilidad, se encuentran en buen estado de conservación, no presentan óxido o corrosión, inclinaciones que podrían desestabilizarlas y ocasionar su colapso. RNE E.090, GE.040 Art. 11 y 12 '),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Las estructuras de soporte de equipos de aire acondicionado, condensadores y otros, apoyados en la pared y/o techo, están adecuadamente fijadas y en buen estado de conservación, no presentan óxido ni corrosión. Los equipos instalados sobre estas estructuras se encuentran debidamente asegurados. RNE 0.90, GE.040 Art. 11 y 12'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'En caso de contar con sistema el sistema de extracción de monóxido de carbono en sótano, éste se encuentra operativo y cuenta con constancia de operatividad y mantenimiento. RNE A010 Articulo 69'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Los juegos infantiles de carpintería metálica, de madera o plástico, son estables, seguros, están bien instalados y en buen estado de conservación. RNE E.090, E.010, GE.040 Art. 11 y 12 '),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Las puertas, ventanas, mamparas, techos; enchapes de muros con espejos, ubicados en áreas donde existe el riesgo de impacto accidental o de exposición de las personas ante roturas, que son de vidrio, son de vidrio templado o laminado. En caso de ser de vidrios primarios, tienen láminas de seguridad en todo el paño de vidrio u otro sistema de protección en caso de rotura. RNE E.040 Art. 23 y GE.040 Art. 11 y 12.'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'El(los) tablero(s) eléctrico(s) cuenta(n) con identificación. CNE-U 020.100.1, 020.100.3.1'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Tiene directorio de los circuitos, indicando de manera visible y clara la instalación que controla. CNE-U 020.100.1, 020.100.3.1'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Existe espacio libre no menor a un metro frente a los tableros eléctricos. CNE-U 020.308'),
    PreguntasAnexo4(funciones: 'PARA TODAS LAS FUNCIONES', titulo: 'Riesgo de colapso\nen estructuras de\nsoporte y otros', pregunta: 'Existe iluminación general y de emergencia en la zona de ubicación de los tableros eléctricos. CNEU 020.314'),
  ];

  static List<PreguntasAnexo4> preguntasForm5 = [];
}
