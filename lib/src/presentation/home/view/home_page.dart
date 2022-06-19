import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../utils/common_widgets.dart';
import '../../../widgets/simmer.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../data/repository/home/home_repository.dart';
import '../../../data/model/doctor_list_model.dart';
import '../home.dart';
import 'doctor_details_page.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var heights = MediaQuery.of(context).size.height;
    var widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        leadingWidth: 45,
        centerTitle: false,
        titleSpacing: 0,
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.indigo,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.indigo.shade900,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textCustom("BIMA DOCTOR",
                fontSize: 25,
                color: Colors.indigo,
                fontWeight: FontWeight.w900),

           Image.asset("assets/images/bima.jpeg", height: 55)
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<HomeRepository>(context),
        )..add(GetDoctorList()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeDataloading) {
              return Center(
                child: simmer(),
              );
            }
            if (state is HomeDataload) {
              return Column(
                children: [


                  Expanded(
                      child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (_, index) {
                          state.list.sort((a, b) => double.parse("${b.rating}")
                              .compareTo(double.parse("${a.rating}")));
                          return doctorListWidgets(state.list[index], context);
                        }),
                  ))
                ],
              );
            }
            if (state is HomeError) {
              return Center(
                child: textCustom("Check Your Connection"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget doctorListWidgets(DoctorList data, context) {
    return Column(
      children: [
        ListTile(
            leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: "${data.profilePic}",
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Image.asset("assets/images/doctorimg.jpeg"),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/doctorimg.jpeg"),
                    ))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textCustom("Dr. ${data.firstName ?? ""} ${data.lastName ?? ""}",
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
                textCustom(
                  "${data.specialization ?? ""}",
                  fontSize: 18,
                  color: Colors.blueAccent.shade100,
                ),
                ReadMoreText(
                  "${data.description ?? ""}",
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  style:
                      GoogleFonts.roboto(fontSize: 14, color: Colors.black87),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      GoogleFonts.roboto(fontSize: 14, color: Colors.pink),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetailPage(doctor: data)));
              },
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 35,
              ),
            )),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
