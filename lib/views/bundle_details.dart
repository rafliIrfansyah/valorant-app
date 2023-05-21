import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/api/api_service.dart';
import 'package:valorant_app/data/model/bundles.dart';
import 'package:valorant_app/fetch_state.dart';

class BundleDetails extends StatefulWidget {
  final String bundleId;
  final BundlesPrice price;

  const BundleDetails({super.key, required this.bundleId, required this.price});
  static const routeName = '/bundle_details';

  @override
  BundleDetailsState createState() => BundleDetailsState();
}

class BundleDetailsState extends State<BundleDetails> {
  late FetchState _state;
  late Data _bundles;
  final apiService = ApiService();

  String _currency = '';
  String amount = '';

  @override
  void initState() {
    super.initState();
    _state = FetchState.pending;
    _fetchBundleById();
  }

  void _fetchBundleById() async {
    try {
      final result = await apiService.getBundlesByID(widget.bundleId);
      if (!mounted) return;
      setState(() {
        _state = FetchState.success;
        _bundles = Data.fromJson(result);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _state = FetchState.error;
      });
    }
  }

  void _changeCurrency(String currency) {
    setState(() {
      _currency = currency;
    });
  }

  String _getConvertedAmount() {
    double temp;
    switch (_currency) {
      case 'IDR':
        temp = double.parse(widget.price.priceRP) * 1.0;
        amount = temp.toStringAsFixed(2);
        return amount;
      case 'MYR':
        temp = double.parse(widget.price.priceRP) * 0.00030;
        amount = temp.toStringAsFixed(2);
        return amount;
      case 'USD':
        temp = double.parse(widget.price.priceRP) * 0.000067;
        amount = temp.toStringAsFixed(2);
        return amount;
      default:
        amount = '';
        return amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    if (_state == FetchState.success) {
      return AppBar(
        centerTitle: true,
        title: Text(
          _bundles.displayName!,
          style: const TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
      );
    }
    return AppBar(
      centerTitle: true,
      title: const Text(''),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case FetchState.success:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _bundles.displayIcon!,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Bundle Name',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              _bundles.displayName!,
              style: const TextStyle(
                fontFamily: 'URW DIN W05 Medium',
                fontSize: 16,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Price in Valorant Points',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: primaryColor,
              width: 90,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.price.priceVP,
                    style: const TextStyle(
                      fontFamily: 'URW DIN W05 Medium',
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                  Image.network(
                    "https://media.valorant-api.com/currencies/85ad13f7-3d1b-5128-9eb2-7cd8ee0b5741/displayicon.png",
                    width: 25,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Price in :',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _changeCurrency('IDR'),
                    child: const Text('IDR'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => _changeCurrency('MYR'),
                    child: const Text('MYR'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => _changeCurrency('USD'),
                    child: const Text('USD'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$_currency ${_getConvertedAmount()}',
              style: const TextStyle(
                  fontFamily: 'URW DIN W05 Bold',
                  color: accentColor,
                  fontSize: 20),
            ),
          ],
        );
      case FetchState.pending:
        return const Center(
          child: Image(
            image: AssetImage(
              'assets/images/pending-logo.png',
            ),
            width: 150,
          ),
        );
      case FetchState.error:
        return const Center(
          child: Image(
            image: AssetImage(
              'assets/images/error-logo.png',
            ),
            width: 150,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
