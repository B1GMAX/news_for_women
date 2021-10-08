import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'content.dart';

class Bloc {
  final _controllerNew = BehaviorSubject<List<Content>>();
  final _controllerPopular = BehaviorSubject<List<Content>>();
  final _controllerSubscribe = BehaviorSubject<List<Content>>();

  Stream<List<Content>> get streamNew => _controllerNew.stream;

  Stream<List<Content>> get streamSubscribe => _controllerSubscribe.stream;

  Stream<List<Content>> get streamPopular => _controllerPopular.stream;

  void loadData() {
    _controllerNew.add(_loadNewPseudoData());
    _controllerPopular.add(_loadPopularPseudoData());
    _controllerSubscribe.add(_loadSubscribesPseudoData());
  }

  List<Content> _loadNewPseudoData() {
    final _newNews = <Content>[];
    _newNews
      ..add(Content(
          someText:
              'Одним из самых нелюбимых мной дней является День Земли. Сама идея праздника хороша, но обычно, как только любой особый день приживается , его начинает окружать очень много символизма и предельно мало дела.',
          title: 'День Земли — каждый день!',
          isFavorite: false,
          name: 'Lera Rubkin',
          numberComments: 15,
          date1: '1г',
          date2: '2н',
          numberLikes: 10,
          postDate: '27 июля 2021'))
      ..add(Content(
          someText:
              'Отношения М и Ж... :)... Мужчина и Женщина... Так просто и так сложно...',
          title: 'Я и Он',
          isFavorite: true,
          name: 'Nasty Lorik',
          numberComments: 30,
          date1: '1г 3м',
          date2: '3н',
          numberLikes: 25,
          postDate: '27 июля 2021'))
      ..add(Content(
          someText: 'Детки, они такие смешные... Кому как не мамам знать! ;)',
          title: 'Юмор',
          isFavorite: false,
          name: 'Anna Anna',
          numberComments: 40,
          date1: '1г',
          date2: '2н',
          numberLikes: 60,
          postDate: '27 июля 2021'))
      ..add(Content(
          someText:
              'Первые слова - "мама", "папа" сменяются на первые осмысленные маленькие рассказы. После года режим питания малыша становится четырехразовым как у взрослых: завтрак, обед, полдник, ужин',
          title: 'От 1 года до 3 лет',
          isFavorite: false,
          name: 'Anna Ivanova',
          numberComments: 50,
          date1: '1г',
          date2: '1н',
          numberLikes: 80,
          postDate: '27 июля 2021'))
      ..add(Content(
          image:
              'https://thumbs.dreamstime.com/b/kindergarten-happy-kids-their-teacher-44632181.jpg',
          someText: '',
          title: '',
          isFavorite: false,
          name: 'Dasha Shumko',
          numberComments: 2,
          date1: '1г',
          date2: '2н',
          numberLikes: 35,
          postDate: '27 июля 2021'))
      ..add(Content(
          someText: 'Поразделы: Одежда и обувь, Игрушки',
          title: 'Куплю или обменяю',
          isFavorite: false,
          name: 'Lera Klymenko',
          numberComments: 45,
          date1: '1г',
          date2: '1н',
          numberLikes: 19,
          postDate: '27 июля 2021'));
    return _newNews;
  }

  List<Content> _loadPopularPseudoData() {
    final _popularNews = <Content>[];
    _popularNews
      ..add(Content(
          title: 'Выбираем имя',
          someText:
              'У каждого имени существует свое значение! Влияет ли имя человека на его характер и судьбу? Основные принципы выбора имени для ребенка, влияние месяца рождения на выбор имени, взаимосвязь характера человека и месяца его рождения.',
          isFavorite: false,
          name: 'Lara Ivanova',
          numberLikes: 30,
          numberComments: 25,
          date1: '1г 1м',
          date2: '1н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Культура',
          someText: 'Фильмы, музыка, книги... Культурные мамы Украины! ;)',
          isFavorite: false,
          name: 'Olga Sh',
          numberLikes: 15,
          numberComments: 20,
          date1: '1г 3м',
          date2: '3н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Здоровье ребенка',
          someText:
              'Здоровье ребенка... Что может быть важней? Здоровье детей в школе и детском саду. Укрепление здоровья ребенка. Физическое и психическое здоровье детей. Здоровое питание ребенка, детский массаж. Детские болезни - лечение.',
          isFavorite: true,
          name: 'Oksana Ivanova',
          numberLikes: 47,
          numberComments: 24,
          date1: '1г 3м',
          date2: '3н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: '',
          image:
              'https://tootris.com/edu/wp-content/uploads/2020/04/difference-between-kinder.png',
          someText: '',
          isFavorite: true,
          name: 'Sveta Brudko',
          numberLikes: 31,
          numberComments: 2,
          date1: '1г 7м',
          date2: '1н',
          postDate: '27 июля 2021'))
      ..add(Content(
          someText:
              'Одним из самых нелюбимых мной дней является День Земли. Сама идея праздника хороша, но обычно, как только любой особый день приживается , его начинает окружать очень много символизма и предельно мало дела.',
          title: 'День Земли — каждый день!',
          isFavorite: false,
          name: 'Lera Rubkin',
          numberComments: 15,
          date1: '1г',
          date2: '2н',
          numberLikes: 10,
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Учимся читать, считать, писать',
          someText:
              'С какого возраста начинать обучать ребенка буквам и цифрам? По каким методикам обучать чтению, счету и письму? Когда ваш ребенок впервые прочел или написал первое слово? Какие возникают трудности в период обучения и методы их преодоления.',
          isFavorite: false,
          name: 'Tamar Rojnik',
          numberLikes: 21,
          numberComments: 7,
          date1: '1г',
          date2: '2н',
          postDate: '27 июля 2021'));
    return _popularNews;
  }

  List<Content> _loadSubscribesPseudoData() {
    final _subscribes = <Content>[];

    _subscribes
      ..add(Content(
          title: 'Дошколята (от 3-х до 6 лет)',
          someText:
              'Кризис трех лет" - формируется характер и собственное восприятие мира ребенка. Эгоизм, агрессивность, непослушание, капризность и упрямство, начинает развиваться чувства страха. Начинается этап подготовки ребенка к школе.',
          isFavorite: true,
          name: 'Larisa Kroft',
          numberLikes: 21,
          numberComments: 12,
          date1: '1г 2м',
          date2: '2н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Дети и гаджеты: как найти баланс',
          someText:
              'С одной стороны, проводить много времени у экрана детям вредно: некоторые эксперты считают, что могут пострадать зрение, осанка, способность общаться в реальном мире. С другой — ни одно из этих утверждений пока не нашло подтверждения в крупных исследованиях',
          isFavorite: false,
          name: 'Lena K',
          numberLikes: 50,
          numberComments: 60,
          date1: '1г 7м',
          date2: '2н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Для родителей)',
          someText:
              'Для родителей стоит послушать лекции Яковлева Сергея (Сатья дас), в свободной форме рассказывает о том, какие типичные ошибки делают родители.',
          isFavorite: false,
          name: 'Sveta Ivanova',
          numberLikes: 12,
          numberComments: 11,
          date1: '1г 2м',
          date2: '2н',
          postDate: '27 июля 2021'))
      ..add(Content(
          title: 'Культура',
          someText: 'Фильмы, музыка, книги... Культурные мамы Украины! ;)',
          isFavorite: false,
          name: 'Olga Sh',
          numberLikes: 15,
          numberComments: 20,
          date1: '1г 3м',
          date2: '3н',
          postDate: '27 июля 2021'))
      ..add(Content(
          someText: 'Детки, они такие смешные... Кому как не мамам знать! ;)',
          title: 'Юмор',
          isFavorite: false,
          name: 'Anna Anna',
          numberComments: 40,
          date1: '1г',
          date2: '2н',
          numberLikes: 60,
          postDate: '27 июля 2021'))
      ..add(Content(
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkQ7BgpLFf7J1Vhs1seN2S2ZulUW5JvpBQTuz4f5K9znV8V_LX88Yk9X1LzKDZDihR488&usqp=CAU',
          someText: '',
          title: '',
          isFavorite: false,
          name: 'Dasha Shumko',
          numberComments: 2,
          date1: '1г',
          date2: '2н',
          numberLikes: 35,
          postDate: '27 июля 2021'));
    return _subscribes;
  }

  void dispose() {
    _controllerNew.close();
    _controllerPopular.close();
    _controllerSubscribe.close();
  }
}
