Dispatcher.create(name: 'John Doe', email: 'john@gmail.com', password: 'password')
driver = Driver.create(name: 'Jane Smith', email: 'jane@gmail.com', password: 'password')
driver2 = Driver.create(name: 'Chris Johnson', email: 'chris@gmail.com', password: 'password')
Driver.create(name: 'Paul Dano', email: 'paul@gmail.com', password: 'password')

tow_request1 = TowRequest.create(starting_location: '1420 S Michigan Ave.', final_location: 'South Loop Depot', driver_id: driver.id)
tow_request2 = TowRequest.create(starting_location: '123 Main St.', final_location: 'South Loop Depot', driver_id: driver2.id)
tow_request3 = TowRequest.create(starting_location: '4040 Kingston St.', final_location: 'West Bend Lot', driver_id: driver2.id)

Vehicle.create(make: 'Honda', category: 'Coupe', model: 'Accord', year: 2012, tow_request: tow_request1)
Vehicle.create(make: 'Nissan', category: 'Coupe', model: 'Leaf', year: 2015, tow_request: tow_request2)
Vehicle.create(make: 'Honda', category: 'Coupe', model: 'Accord', year: 2017, tow_request: tow_request3)