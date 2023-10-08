// BEGIN: yz8a7b3fj2p1
import 'package:client_control/models/client.dart';
import 'package:client_control/models/clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client_control/models/types.dart';
import 'package:client_control/models/client_type.dart';

void main() {
  group('Clients Test', () {
    final john = Client(
      name: 'John Doe',
      email: 'johndoe@example.com',
      type: ClientType(name: 'Gold', icon: Icons.star),
    );

    test('Clients model should add new client', () {
      var clients = Clients(clients: []);
      clients.add(john);
      clients.add(john);
      expect(clients.clients, [john, john]);
    });

    test('Clients model should remove old client', () {
      var clients = Clients(clients: [john, john, john]);
      clients.remove(0);
      clients.remove(1);
      expect(clients.clients, [john]);
    });
  });

  group('Types Test', () {
    final gold = ClientType(name: 'Gold', icon: Icons.star);

    test('Types Model should add new type', () {
      var types = Types(types: []);
      types.add(gold);
      types.add(gold);
      expect(types.types, [gold, gold]);
    });

    test('Types Model should remove old type', () {
      var types = Types(types: [gold, gold, gold]);
      types.remove(0);
      types.remove(1);
      expect(types.types, [gold]);
    });
  });
}
// END: yz8a7b3fj2p1