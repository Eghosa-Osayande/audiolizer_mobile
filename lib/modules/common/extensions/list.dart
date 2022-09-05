extension ListExtension on List {
  List<T> seperate<T>(T seperator) {
    List<T> t = [];
    List.generate(length, (index) {
      t.addAll(List.from([
        this[index]
      ].followedBy([
        seperator
      ])));
    });
    return t.sublist(0, 2 * length );
  }
}
