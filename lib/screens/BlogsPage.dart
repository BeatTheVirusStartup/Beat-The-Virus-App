import 'package:beat_the_virus/widgets/BlogsGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/BlogsProvider.dart';

class BlogsPage extends StatefulWidget {
  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Blogs>(context).fetchAndSetBlogs().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : BlogsGrid();
  }
}

// List<String> titleLS = [
//     'Meditation: A way to reduce your stress and make you healthy',
//     'Naturopathy',
//     'Food Supplements: A necessity for good health',
//     'Herbs in Germany that you can use for immunity boosting',
//     'Acupressure',

//   ];

//   List<String> contentLS = [
//     'Meditation is a practice where an individual uses a technique such as mindfulness or focusing the mind on a particular object, thought, or activity to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.',
//     'Naturopathy is an art and science of healthy living and a drugless system of healing based on well-founded philosophy. Naturopathy is ‘holistic’ in its own approach by taking human body as a w0hole, as it treats the root cause of the disease and not just symptoms.',
//     'A natural antioxidant source, Oregano Oil contains phytochemicals which support the body’s natural resistance. Gaia Herbs supercritical CO2 extract of Oregano volatile oils contains phenols, including Carvacrol and Thymol.',
//     'In scientific words “immune system is a network of biological processes that protects an organism from disease. It detects and responds to a wide variety of pathogens, from viruses to parasites.” ',
//     'Acupressure is an alternative medicine technique often used for treatment of body pain , disease, pain in the joints or bones, treatment for stress etc.. It is based on the concepts of life energies which flows through ‘Meridians’  (energy network of body) in the body .',
//   ];
