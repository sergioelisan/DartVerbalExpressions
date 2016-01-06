library verbal_expressions.start_of_line_tests;

import 'package:test/test.dart';
import 'package:verbal_expressions/verbal_expressions.dart';

class StartOfLineTests {
  static run(){
    group('Start of line', () {

      VerbalExpressions verbalExpressions;

      setUp(() {
        verbalExpressions = new VerbalExpressions();
      });

      test('Should add "^" in the beginning when is enable', () {
        verbalExpressions.startOfLine(true);
        expect(verbalExpressions.toString(), '^', reason: 'missing start of line regex');
      });

      test('Should not add "^" in the beginning when is not enable', () {
        verbalExpressions.startOfLine(false);
        expect(verbalExpressions.toString(), '', reason: 'missing start of line regex');
      });

      test('Should append in the beginning of the expression when placed in random order', () {
        verbalExpressions
          .add('test')
          .add('ing')
          .startOfLine();

        var matcher = new RegExp(verbalExpressions.toString());
        expect(matcher.hasMatch('testing1234'), isTrue, reason: 'Should match that the text starts with test');
      });

      test('Should match http in start when Then(http).Maybe(wwww)', () {
        verbalExpressions
        .startOfLine()
        .then('http')
        .maybe('www');

        var matcher = new RegExp(verbalExpressions.toString());
        expect(matcher.hasMatch('http'), isTrue, reason: 'Should match http in start');
      });

      test('Should not match www in start when Then(http).Maybe(wwww)', () {
        verbalExpressions
        .startOfLine()
        .then('http')
        .maybe('www');

        var matcher = new RegExp(verbalExpressions.toString());
        expect(matcher.hasMatch('www'), isFalse, reason: 'Should not match www in start');
      });
    });
  }
}

void main() {
  StartOfLineTests.run();
}