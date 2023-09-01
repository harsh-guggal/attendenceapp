import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

class StudentSearchScreen extends StatefulWidget {
  const StudentSearchScreen({super.key});

  @override
  State<StudentSearchScreen> createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends State<StudentSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        titleSpacing: 0,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          width: size.width,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                },
                child: Container(
                  width: size.width,
                  height: size.height / 15,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: BrandColors.whiteColor,
                    border: Border.all(
                      color: BrandColors.greyColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: TextFormField(
                            autofocus: true,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Work Sans",
                            ),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Search here...',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Work Sans',
                                color: BrandColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: BrandColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: BrandColors.greyColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              // color: BrandColors.lighBlueColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.asset('assets/images/person1.png'),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Harsh Kamboj',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Work Sans",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Class 10th',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Work Sans",
                                          color: BrandColors.greyColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Fees : ₹ 500',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Work Sans",
                                          color: BrandColors.darkBlueColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
