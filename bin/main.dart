import "package:mullvad_api/mullvad.dart" as mullvad;
import 'dart:io';

import 'package:args/command_runner.dart';

Future<void> main(List<String> arguments) async {
  CommandRunner runner = new CommandRunner("mullvad", "Mullvad VPN Check API.")
    ..addCommand(new ConnectedCommand())
    ..addCommand(new CountryCommand())
    ..addCommand(new CityCommand())
    ..addCommand(new IPCommand())
    ..addCommand(new AllCommand())
    ..addCommand(new StatusCommand());
  runner.run(arguments);
}

class CountryCommand extends Command {
  final name = "country";
  final description = "Return exit country";

  CountryCommand() {
    //argParser.addOption("format",
    //    abbr: "f",
    //    help: "Output format",
    //    allowed: ["json", "text"],
    //    defaultsTo: "text");
  }

  void run() {
    mullvad.country().then((value) {
      print(value);
    });
  }
}

class CityCommand extends Command {
  final name = "city";
  final description = "Return exit city";

  void run() {
    mullvad.city().then((value) {
      print(value);
    });
  }
}

class IPCommand extends Command {
  final name = "ip";
  final description = "Return exit IP";

  void run() {
    mullvad.ip().then((value) {
      print(value);
    });
  }
}

class StatusCommand extends Command {
  final name = "status";
  final description = "Return VPN status";

  void run() {
    mullvad.connected().then((value) {
      print(value);
    });
  }
}

class ConnectedCommand extends Command {
  final name = "connected";
  final description = "Return VPN connected status";

  ConnectedCommand();

  void run() {
    mullvad.connected().then((value) {
      print(value);
    });
  }
}

class AllCommand extends Command {
  final name = "all";
  final description = "Return All VPN status information";

  AllCommand();

  void run() {
    mullvad.status().then((value) {
      print("Connected:  ${value.connected}");
      print("IP:         ${value.ip}");
      print("City:       ${value.city}");
      print("Country:    ${value.country}");
    });
  }
}
