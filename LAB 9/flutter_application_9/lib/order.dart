import 'package:flutter/material.dart';
import 'confirm.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _customerNameController = TextEditingController();
  String? _promoCodeErrorText;
  final List<String> _pizzaSizes = ['Small', 'Medium', 'Large', 'Party Size'];
  String _selectedPizzaSize = 'Medium';

  @override
  void dispose() {
    _customerNameController.dispose();
    super.dispose();
  }

  void _onPromoCodeChanged(String value) {
    final hasWhitespace = RegExp(r'\s').hasMatch(value);
    setState(() {
      _promoCodeErrorText = hasWhitespace ? 'Don\'t use blank spaces' : null;
    });
  }

  Future<void> _submitOrder() async {
    final String customerName = _customerNameController.text.trim();
    final bool? isConfirmed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(
          customerName: customerName,
          pizzaSize: _selectedPizzaSize,
        ),
      ),
    );

    if (!mounted) {
      return;
    }

    if (isConfirmed == true) {
      debugPrint('Order confirmed successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order confirmed successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMT Cuisine Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Customer Name'),
            const SizedBox(height: 8),
            TextField(
              controller: _customerNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter customer name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Promo Code'),
            const SizedBox(height: 8),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              onChanged: _onPromoCodeChanged,
              validator: (_) => _promoCodeErrorText,
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                border: const OutlineInputBorder(),
                errorText: _promoCodeErrorText,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Pizza Size'),
            DropdownButton<String>(
              value: _selectedPizzaSize,
              isExpanded: true,
              items: _pizzaSizes
                  .map(
                    (size) => DropdownMenuItem<String>(
                      value: size,
                      child: Text(size),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedPizzaSize = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Text('Selected size: $_selectedPizzaSize'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitOrder,
                child: const Text('Submit Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}