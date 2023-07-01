import 'carcenter.dart'; //เรียกใช้ class
void main() {
  Car a = new Car("Toyota","Vlos", 2002, 2036, 501000); //ยี่ห้อที่ 1
  a.addCar(15);
  a.remaiNing();
  a.priceAll();
  a.priceGroup();
  a.perCent();
  a.propertyGroup();
  Car b = new Car("Isuzu", "D-max", 1999, 2036,4156456); //ยี่ห้อที่ 2
  b.addCar(10);
  b.remaiNing();
  b.priceAll();
  b.priceGroup();
  b.perCent();
  b.propertyGroup();
  Car c = new Car("Honda", "City", 2009, 2040, 400000); //ยี่ห้อที่ 3
  c.addCar(9);
  c.remaiNing();
  c.priceAll();
  c.priceGroup();
  c.perCent();
  c.newcarGroup();
  c.propertyGroup();
  //การแสดงแบบ Map โดยใช้ List
  List<Map> Cars = [];
  Cars.add(a.getCar());
  Cars.add(b.getCar());
  Cars.add(c.getCar());
  log(Cars);
}
void log(var Cars) {
  for(var n in Cars) { // loop แสดงค่า a,b,c
    print(n);}
}