class Res_model {
  String name;
  String last;
  String img;
  Res_model({required this.name, required this.last, required this.img});

  static final List<Res_model> res = [
    Res_model(name: 'Chinese food', last: '12 Restaurants', img: 'assets/images/china.png'),
    Res_model(
        name: 'Pizzeria Restaurant food', last: 'Chinese & Italian', img: 'assets/images/pizera.png'),
    Res_model(name: 'Burger Mania food', last: 'Pizzas & Burgers', img: 'assets/images/burg.png'),
    Res_model(
        name: 'The Italian Restaurant food', last: 'Italian Foods', img: 'assets/images/italiya.png'),
  ];
}
