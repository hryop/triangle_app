import 'package:flutter_test/flutter_test.dart';

var segitigaSamaKaki = "Segitiga Sama Kaki";
var segitigaSamaSisi = "Segitiga Sama Sisi";
var segitigaSembarang = "Segitiga Sembarang";

void main() {
  group('detect the triangle', () {
    test('Should throw Error when there is side less than 1', () {
      expect(() => detectTriangle(-1, 2, 2), throwsA(isA<Exception>()));
      expect(() => detectTriangle(-1, -2, 2), throwsA(isA<Exception>()));
      expect(() => detectTriangle(3, 2, -2), throwsA(isA<Exception>()));
    });

    test('Should return "Segitiga Sama Sisi" when all sides are equals', () {
      expect(detectTriangle(3, 3, 3), segitigaSamaSisi);
      expect(detectTriangle(1, 2, 2), isNot(segitigaSamaSisi));
    });

    test('Should return "Segitiga Sama Kaki" when 2 sides are equals', () {
      expect(detectTriangle(3, 3, 5), segitigaSamaKaki);
      expect(detectTriangle(10, 2, 9), isNot(segitigaSamaKaki));
    });

    test(
      'Should return "Segitiga Sembarang" when all sides are not equals',
      () {
        expect(detectTriangle(3, 7, 9), segitigaSembarang);
        expect(detectTriangle(2, 2, 1), isNot(segitigaSembarang));
      },
    );
  });
}

String detectTriangle(int sideA, int sideB, int sideC) {
  var sides = [sideA, sideB, sideC];

  var match = 0;
  for (var side in sides) {
    if (side < 1) throw Exception();

    if (side == sideA) match++;
    if (side == sideB) match++;
    if (side == sideC) match++;
  }

  if (sides[0] + sides[1] <= sides[2] ||
      sides[1] + sides[2] <= sides[0] ||
      sides[0] + sides[2] <= sides[1]) {
    throw Exception('This is Inequal Triangle');
  }

  if (sides.every((element) => element == sideA)) return segitigaSamaSisi;

  if (match == sides.length) return segitigaSembarang;

  return segitigaSamaKaki;
}
