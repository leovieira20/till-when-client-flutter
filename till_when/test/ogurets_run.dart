import 'package:ogurets/ogurets.dart';

import 'domain/models/queue_tests.dart' as queue_tests;
import 'features/queue/step_definitions/QueueSteps.dart' as queue_steps;

// THIS FILE IS GENERATED - it will be overwritten on each run.
// If you wish to use one, please just make a copy and use that.
// Your friendly Ogurets team - Irina Southwell & Richard Vowles
//  (and we hope supporting cast)
// if you have an issue please raise it on
// https://github.com/dart-ogurets/Ogurets (for core)
// https://github.com/dart-ogurets/OguretsFlutter (for ogurets_flutter)
// https://github.com/dart-ogurets/OguretsIntellij (for the Jetbrains IntelliJ plugin)
void main(args) async {
  var def = new OguretsOpts()
    ..feature('test/features/queue/queue.feature')
    ..debug()
    ..step(queue_tests.WorkableItemMock)..step(queue_steps.WorkableItemMock)..step(queue_steps.QueueSteps)
  ;

  await def.run();
}