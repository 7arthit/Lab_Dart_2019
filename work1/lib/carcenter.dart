class Car {
  //Property
  String car = ''; //ยี่ห้อ
  String model = ''; //รุ่น
  String quality = ""; //คุณภาพ
  String property = ''; //คุณสมบัติ
  int yearmade = 0; //ปีที่ผลิต
  int yearexpired = 0; //ปีที่หมดอายุการใช้งาน
  int carall = 0; //จำนวนรถทั้งหมด แต่ละยี่ห้อ
  int remainer = 0; //อายุการใช้งาน
  int percents = 0; //เปอร์เซนของรถแต่ละยี่ห้อ
  int newcar = 0; //รถที่สั่งซื้อเพิ่ม
  double price = 0; //ราคาของรถ
  double priceall = 0; //ราคารวม รถแต่ละยี่ห้อ
  Map carmap = {}; // ตัวแปรแสดงผล Map

  // Constructor 1 ยี่ห้อรถ รุ่น ปีที่ผลิต ปีที่หมดอายุการใช้งาน ราคา
  Car(String cn, String mn, int ym, int yp, double pp) {
    this.car = cn;
    this.model = mn;
    this.yearmade = ym;
    this.yearexpired = yp;
    this.price = pp;
  }

  // Constructor 2 ยี่ห้อรถ รุ่น ปีที่ผลิต ปีที่หมดอายุการใช้งาน
  Car.withoutPrice(String cn, String mn, int ym, int yp) {
    this.car = cn;
    this.model = mn;
    this.yearmade = ym;
    this.yearexpired = yp;
  }

  // Constructor 3 ยี่ห้อรถ รุ่น ปีที่ผลิต ปีที่หมดอายุการใช้งาน ราคา
  Car.withoutput(
      this.car, this.model, this.yearmade, this.yearexpired, this.price);

  //Output แสดงผล
  String tostring() {
    return "Car>> ${this.car} : ${this.model} : ${this.yearmade} : ${this.yearexpired} : ${this.carall} : ${this.percents}: ${this.price} : ${this.quality} : ${this.property} : ${this.priceall}  : ${this.remainer} : ${this.newcar}  \n";
  }

  //Operational Functions 1 (*) ราคารวมของรถแต่ละยี่ห้อ
  void priceAll() {
    priceall = carall * price;
  }

  //Operational Functions 2 (+) รถแต่ละยี่ห้อมีทั้งหมดกี่คัน (สามมรถเพิ่มจำนวนได้)
  void addCar(int num) {
    carall += num;
  }

  //Operational Functions 3 (-) เหลืออายุการใช้งานกี่ปี?
  void remaiNing() {
    remainer = yearexpired - yearmade;
  }

  //Operational Functions 4 (/) เปอร์เซนต์ ของรถแต่ละรี่ห้อ
  void perCent() {
    percents = ((carall * 100) ~/ 100);
  }

  //ใช้ Map แสดงค่า คล้าย Json Object
  Map getCar() {
    carmap = {
      "car": this.car,
      "model": this.model,
      "yearMade": this.yearmade,
      "yearexpired": this.yearexpired,
      "carall": this.carall,
      "percents": this.percents,
      "price": this.price,
      "quality": this.quality,
      "property": this.property,
      "priceall": this.priceall,
      "remainer": this.remainer,
      "newcar": this.newcar
    };
    return carmap;
  }

  //Conditions Functions 1 (If-Else) คุณภาพของรถ
  String priceGroup() {
    if (price < 500000) {
      quality = "medium"; // น้อยกว่า 500,000 คุณภาพกลางๆ
    } else {
      quality = 'high'; // มากกว่า 500,000 คุณภาพค่อนข้างสูง
    }
    return quality;
  }

  //Conditions Functions 2 (While) ซื้อรถเพิ่ม
  int newcarGroup() {
    if (carall > 15) {
      //ถ้ามากกว่า 15 คัน ยังไม่สั่งเพิ่ม
      newcar = 0;
    } else {
      //ถ้ารถที่เหลืออยู่ เหลือน้อยกว่า 15 คัน สั่งรถมาเพิ่ม
      while (newcar < 15) {
        newcar++;
      }
    }
    return newcar;
  }

  //Conditions Functions 3 (Switch) คุณสมบัติของรถ
  String propertyGroup() {
    property = quality;
    switch (property) {
      case "high":
        {
          property = "with gps and car camera";
        } //มี GPS และกล้องติดรถยนต์
        break;

      case "medium":
        {
          property = "no gps and dash cam";
        } //ไม่มี GPS และกล้องติดรถยนต์
        break;
    }
    return property;
  }
}