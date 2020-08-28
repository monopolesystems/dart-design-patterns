library flyweight;

class TextDisplay {
  String text = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer placerat sapien erat, quis tincidunt purus vulputate eget. In sit amet aliquam sem. Sed massa diam, pulvinar eu nibh at, elementum interdum quam. Nunc semper odio nec augue placerat, vel ultrices massa finibus. Sed posuere elit placerat luctus vulputate. Etiam tempus consectetur imperdiet. In iaculis euismod posuere. Curabitur massa diam, scelerisque a luctus quis, eleifend ac sem. Etiam quis sapien nec odio condimentum rutrum in tristique urna. Cras rutrum elit vestibulum, convallis ex eget, ornare arcu. Duis vel ex ipsum. Phasellus mi tortor, feugiat non urna sed, consequat rutrum est. Duis eget tempus nisi. Morbi iaculis massa sed auctor volutpat. Maecenas et mattis velit, nec scelerisque nunc.

Suspendisse lobortis interdum laoreet. Integer ac enim ultrices, accumsan ligula eu, accumsan odio. Etiam sit amet felis pulvinar, efficitur mauris at, rutrum elit. Praesent vel facilisis dui. Vivamus facilisis laoreet lectus nec pharetra. Duis efficitur id quam eget ultrices. In aliquam pharetra arcu quis tempus. Nulla facilisi. Aliquam vel convallis nisi, ut volutpat nibh. Aliquam eget hendrerit ipsum. Curabitur ut cursus nisl. Nam arcu est, blandit a volutpat eget, consequat at nulla. Proin tempus arcu elit, at tincidunt nulla posuere nec. Maecenas sed ornare eros.

Nulla congue lectus ac felis vehicula tempus in eget sem. Praesent bibendum neque velit, eu pellentesque neque faucibus sed. Donec lobortis erat quis nisi ultricies ultricies non in enim. Etiam tristique non arcu nec interdum. Quisque sed hendrerit nisi, ac mattis diam. Nulla justo risus, commodo vel ante eget, pretium mattis ligula. Proin ac viverra mi, sed tempus tellus. In hac habitasse platea dictumst.

Vestibulum interdum metus lorem, ac dignissim velit hendrerit eu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc vitae nulla interdum, vulputate leo id, tempus mi. Aliquam enim nisl, vehicula vel dui in, malesuada dictum risus. Duis elit nulla, posuere vitae magna nec, ultrices euismod tortor. Fusce posuere, sem in posuere lacinia, sem lectus vulputate enim, sed bibendum felis libero eget tortor. Curabitur ut neque ultrices, lobortis leo a, rhoncus est. Nam a consectetur tortor.

Nullam a varius lorem, id ullamcorper odio. Morbi non eros leo. Vestibulum posuere bibendum leo. Phasellus volutpat erat mauris, vitae tincidunt felis tincidunt id. Sed ipsum eros, iaculis cursus laoreet sed, varius nec sapien. Ut lacinia sit amet lorem nec tincidunt. Sed non metus eget nisl rutrum rhoncus. Nulla tristique blandit tincidunt. Praesent lobortis dui nisi, elementum vehicula risus vehicula sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
  ''';
  void display() {
    print(this.text);
  }
}
