import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  late final String userId;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
    } else {
      // Redireciona para o login se o usuário não estiver autenticado
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  double _calculateTotal(List<Map<String, dynamic>> deliveries) {
    return deliveries.fold(
      0.0,
      (double total, item) => total + (item['value'] as num).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deliveriesRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('deliveries');

    return Scaffold(
      appBar: AppBar(title: const Text('Seus Ganhos')),
      body: StreamBuilder<QuerySnapshot>(
        stream: deliveriesRef.orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar entregas.'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          final deliveries =
              docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return {
                  'value': data['value'] ?? 0.0,
                  'description': data['description'] ?? '',
                  'date': (data['date'] as Timestamp).toDate(),
                };
              }).toList();

          final total = _calculateTotal(deliveries);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: R\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: deliveries.length,
                    itemBuilder: (context, index) {
                      final delivery = deliveries[index];
                      return Card(
                        child: ListTile(
                          title: Text(delivery['description']),
                          subtitle: Text(
                            'Data: ${delivery['date'].day}/${delivery['date'].month}/${delivery['date'].year}',
                          ),
                          trailing: Text(
                            'R\$ ${(delivery['value'] as num).toStringAsFixed(2)}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
