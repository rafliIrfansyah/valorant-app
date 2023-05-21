import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/api/api_service.dart';
import 'package:valorant_app/data/model/bundles.dart';
import 'package:valorant_app/fetch_state.dart';
import 'package:valorant_app/widgets/card_bundles.dart';

class BundlesPage extends StatefulWidget {
  const BundlesPage({Key? key}) : super(key: key);
  static const routeName = '/bundles_page';

  @override
  BundlesPageState createState() => BundlesPageState();
}

class BundlesPageState extends State<BundlesPage> {
  late FetchState _state;
  late List<Data> _bundles;

  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _state = FetchState.pending;
    _bundles = [];
    _fetchAllBundles();
  }

  void _fetchAllBundles() async {
    try {
      final result = await apiService.getBundlesList();
      if (!mounted) return;
      setState(() {
        _state = FetchState.success;
        _bundles = result.map((e) => Data.fromJson(e)).toList();
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _state = FetchState.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_state == FetchState.pending || _state == FetchState.error) {
      return Scaffold(
        backgroundColor: secondaryColor,
        appBar: _buildAppBar(context),
        body: _buildBody(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Complete Your Look!',
        style: TextStyle(
          color: secondaryColor,
          fontFamily: 'Tungsten-Bold',
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case FetchState.success:
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height) *
                3,
          ),
          itemCount: _bundles.length,
          itemBuilder: (_, index) {
            Data bundles = _bundles[index];
            BundlesPrice price = listPrice[index];
            return CardBundles(
              bundles: bundles,
              price: price,
            );
          },
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
            image: AssetImage('assets/images/error-logo.png'),
            width: 150,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
