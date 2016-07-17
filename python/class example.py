class Triangle(object):
    number_of_sides=3
    def __init__(self,angle1,angle2,angle3):
        self.angle1=angle1
        self.angle2=angle2
        self.angle3=angle3
    
    def check_angles(self):
        angle = self.angle1 + self.angle2 + self.angle3
        if angle==180:
            return True
        else:
            return False

my_triangle=Triangle(90,30,60)
print(my_triangle.number_of_sides)
print(my_triangle.check_angles())

class Equilateral(Triangle):
    angle=60
    def __init__(self):
        self.angle1=self.angle
        self.angle2=self.angle
        self.angle3=self.angle

class Car(object):
    condition = "new"
    def __init__(self, model, color, mpg):
        self.model = model
        self.color = color
        self.mpg   = mpg
    
    def display_car(self):
        print ("This is a %s %s with %s MPG." %(self.color,self.model,str(self.mpg)))
    
    def drive_car(self):
        self.condition='used'

my_car = Car("DeLorean", "silver", 88)
print(my_car.condition)
my_car.drive_car()
print (my_car.condition)

class ElectricCar(Car):
    def __init__(self, model, color, mpg, battery_type):
        self.model = model
        self.color = color
        self.mpg   = mpg
        self.battery_type=battery_type
    
    def drive_car(self):
        self.condition='like new'

my_car=ElectricCar("DeLorean", "silver", 88, 'molten salt')
print (my_car.condition)
my_car.drive_car()
print (my_car.condition)