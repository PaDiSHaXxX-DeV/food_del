class K_model{
  String name;
  String nametwo;
  String img;
  K_model({required this.name,required this.nametwo,required this.img});


  static final List<K_model>k_models=[
    K_model(name: 'Ice Cream Parlor', nametwo: 'Ice Creams & Shakes | \$\$', img:'assets/images/k1.png'),
    K_model(name: 'Macaroni Corner', nametwo: 'Soups & Brouths | ', img:'assets/images/k2.png'),

    K_model(name: 'Cheesy Salad Makers', nametwo: 'Italian & Russian Foods ', img:'assets/images/k3.png'),
    K_model(name: 'Chinese In Restaurant', nametwo: 'Ice Creams & Shakes | \$\$', img:'assets/images/k4.png'),
    K_model(name: 'Ice Cream Parlor', nametwo: 'Chinese In Restaurant | \$\$', img:'assets/images/k5.png'),
    K_model(name: 'Buy 1 get 1 free', nametwo: 'Ice Creams & Shakes | \$\$', img:'assets/images/k6.png'),
    K_model(name: 'Chinese In Restaurant Parlor', nametwo: 'Ice Creams & Shakes | \$\$', img:'assets/images/k7.png'),
    K_model(name: 'Buy 1 burger get free fries', nametwo: 'Ice Creams & Shakes | \$\$', img:'assets/images/k8.png'),

  ];
}