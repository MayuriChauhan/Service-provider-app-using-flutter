import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:testing_flutter/providers/service_provider.dart';
import 'package:testing_flutter/screens/home_screen/service_overview/service_overview.dart';
import 'package:testing_flutter/screens/review_cart/reviewcart.dart';
import '../my_profile/my_profile.dart';
import '../search/search.dart';
import 'drawer_side.dart';
import 'single_product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ServiceProvider serviceProvider;

  Widget _buildCleaning(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cleaning'),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                    builder: (context)=>Search(
                      search: serviceProvider.getCleaningServiceDataList,
                    ),
                  ),);
                },
                child: Text('View all', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: serviceProvider.getCleaningServiceDataList.map(
                    (cleaningServiceData) {
                      return singleProduct(
                              onTap: () {},
                              heading: cleaningServiceData.heading,
                              img: cleaningServiceData.img,
                              desc: cleaningServiceData.desc,
                              price: cleaningServiceData.price,
                              serviceID: cleaningServiceData.serviceID,
                              details: 'Deep cleaning involves a thorough scrubbing of all surfaces,even hard-to-reach areas. Everything in your house that a stool can reach will be hand-wiped. Aside from the in-depth approach, it promotes general sanitation and livability. The price difference between regular and intensive cleaning is also notable.',
                            );
                    })
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRepair(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Repair'),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>Search(
                    search: serviceProvider.getRepairServiceDataList,
                  ),
                ),);
            },
              child: Text('View all', style: TextStyle(color: Colors.grey)),
          ),
            ],
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: serviceProvider.getRepairServiceDataList.map(
                    (repairServiceData) {
                  return singleProduct(
                    onTap: () {},
                    heading: repairServiceData.heading,
                    img: repairServiceData.img,
                    desc: repairServiceData.desc,
                    price: repairServiceData.price,
                    details: "Repair Services means the restoration of Equipment to its original function on an as-needed basis, as may be required by the Facility in response to the failure or malfunctioning of such equipment. The repair process may also include servicing, reconditioning, modification, and refurbishment.",
                    serviceID: repairServiceData.serviceID,
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildHandyman(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Handyman'),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>Search(
                    search: serviceProvider.getHandymanServiceDataList,
                  ),
                ),);
            },
              child: Text('View all', style: TextStyle(color: Colors.grey)),
          ),
            ],
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: serviceProvider.getHandymanServiceDataList.map(
                    (handymanServiceData) {
                  return singleProduct(
                    onTap: () {},
                    heading: handymanServiceData.heading,
                    img: handymanServiceData.img,
                    desc: handymanServiceData.desc,
                    price: handymanServiceData.price,
                    details: "Handyman services includes small repair and maintenance jobs related to plumbing, electrical or carpentry services. Handyman services includes few other services as well like small repairing, replacement and some time renovation work in your bathroom, kitchen or backyard. Term handyman is comparatively new in India and we rather call electrician, plumber or carpenter when we need their services. But at times, you may have a unique kind of requirements like you want to replace the sink in your kitchen, install an exhaust fan and get the doors of the kitchen cabinets replaced or fixed.",
                    serviceID: handymanServiceData.serviceID,
                  );
                })
                .toList(),
           ),
        ),
      ],
    );
  }

  Widget _buildPestcontrol(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pest Control'),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>Search(
                    search: serviceProvider.getPestControlServiceDataList,
                  ),
                ),);
            },
              child: Text('View all', style: TextStyle(color: Colors.grey)),
          ),
            ],
          ),
        ),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: serviceProvider.getPestControlServiceDataList.map(
                    (pestcontrolServiceData) {
                  return singleProduct(
                    onTap: () {},
                    heading: pestcontrolServiceData.heading,
                    img: pestcontrolServiceData.img,
                    desc: pestcontrolServiceData.desc,
                    price: pestcontrolServiceData.price,
                    details: "We are expert pest control service provider handle all types of pest problems in your residential and workplace areas. Adopting new and innovative treatment for controlling the pest, we assure 100% protection from the harmful pests. We offer a best Pest Control, fast, reliable and on-time service to the customers both for the residential or business areasWith amazing experience in the field and by adopting modern technology and tools, We as Best in Pest Control Companies offers completely satisfied services to the customers, with the help of the highly qualified professional team, your house or business area will become pest free. We find pride in showcasing that we only use eco-friendly and approved chemicals for controlling the pest.",
                    serviceID: pestcontrolServiceData.serviceID,
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPaint(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Home Painting & Water Proofing'),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>Search(
                    search: serviceProvider.getPaintServiceDataList,
                  ),
                ),);
            },
          child: Text('View all', style: TextStyle(color: Colors.grey))
          ),
            ],
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: serviceProvider.getPaintServiceDataList.map(
                    (paintServiceData) {
                  return singleProduct(
                    onTap: () {},
                    heading: paintServiceData.heading,
                    img: paintServiceData.img,
                    desc: paintServiceData.desc,
                    price: paintServiceData.price,
                    details: "FixIT is One stop solution for All types of Painting and Waterproofing ,Wallpapers ,Wall Textures,Wall punning ,Art painting,Wood Polish ,Epoxy Grouting , Epoxy / PU Flooring,Home Cleaning ,False ceiling , Artificial Grass, Wooden Flooring Services. Offering services at very challenging prices at 30% lower than market prices with Highly Experienced and Trained professionals and managers.",
                    serviceID: paintServiceData.serviceID,
                  );
                })
                .toList(),

          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ServiceProvider serviceProvider = Provider.of(context, listen: false);
    serviceProvider.fetchCleaningServiceData();
    serviceProvider.fetchRepairServiceData();
    serviceProvider.fetchHandymanServiceData();
    serviceProvider.fetchPaintServiceData();
    serviceProvider.fetchPestControlServiceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    serviceProvider = Provider.of(context);
    return Scaffold(
      drawer: DrawerSide(),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.haushandyman.ca/wp-content/uploads/2021/11/haus-handyman-burnaby-bc-handyman.jpg'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),


              child: Row(
                children: [
                  Expanded(
                    //flex:2,
                      child: Container(
                        //color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 320, bottom: 10),

                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),

                                  ),
                                  child: Center(
                                    child: Text(
                                      'FixIt',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.purple,
                                              blurRadius: 10,
                                              offset: Offset(3, 3))
                                        ],
                                      ),
                                    ),
                                  ),

                                )),
                          ],
                        ),
                      )),
                ],
              ),

            ),

            _buildCleaning(context),
            _buildRepair(context),
            _buildHandyman(context),
            _buildPestcontrol(context),
            _buildPaint(context),

          ],

        ),
      ),


      appBar: AppBar( //app bar
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home', style: TextStyle(color: Colors.black, fontSize: 17),),
        actions:
        [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffe5d6ed),
            child: IconButton
              (onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (Context) => Search(search: serviceProvider.getAllServiceSearch),
                ),
              );
            },
              icon: Icon(
                  Icons.search,
                  size: 17,
                  color: Colors.black),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).
              push(MaterialPageRoute(
                builder: (context)=>ReviewCart(),
              ),);
            },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffe5d6ed),
            child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black87),
          )
          )
          )
        ],
        backgroundColor: Color(0xFF7B48BB),
      ),
    );
  }
}
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }