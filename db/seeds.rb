User.create(email: "admin@example.com", password: "1", role: "admin")
puts "Admin user created: admin@example.com / password: 1"

User.create(email: "courier@example.com", password: "1", role: "courier")
puts "Courier user created: courier@example.com / password: 1"

User.create(email: "operator@example.com", password: "1", role: "operator")
puts "Operator user created: operator@example.com / password: 1"

User.create(email: "coordinator@example.com", password: "1", role: "coordinator")
puts "Coordinator user created: coordinator@example.com / password: 1"

requests_data = [
  { name: "Ivan Petrov", email: "ivan@example.com", phone: "0881234567", address_line_1: "ul. Vitosha 15", city: "Sofia", pick_up_at: Date.tomorrow, status: "pending" },
  { name: "Maria Georgieva", email: "maria@example.com", phone: "0889876543", address_line_1: "bul. Tsar Osvoboditel 22", city: "Sofia", pick_up_at: Date.tomorrow, status: "pickup_confirmed" },
  { name: "Dimitar Ivanov", email: "dimitar@example.com", phone: "0878112233", address_line_1: "ul. Shipka 8", city: "Plovdiv", pick_up_at: 2.days.from_now, status: "picked_up" },
  { name: "Elena Todorova", email: "elena@example.com", phone: "0887445566", address_line_1: "ul. Aleksandrovska 45", city: "Burgas", pick_up_at: 2.days.from_now, status: "in_progress" },
  { name: "Georgi Nikolov", email: "georgi@example.com", phone: "0899334455", address_line_1: "bul. Slivnitsa 100", city: "Varna", pick_up_at: 2.days.from_now, status: "ready_for_delivery" },
  { name: "Stefka Dimitrova", email: "stefka@example.com", phone: "0988778899", address_line_1: "ul. Han Krum 3", city: "Stara Zagora", pick_up_at: 2.days.from_now, status: "delivery_confirmed" },
  { name: "Nikolay Stoyanov", email: "nikolay@example.com", phone: "0871122334", address_line_1: "ul. Rakovski 67", city: "Sofia", pick_up_at: Date.tomorrow, status: "delivered" },
  { name: "Tsvetana Mladenova", email: "tsvetana@example.com", phone: "0883344556", address_line_1: "bul. Bulgaria 12", city: "Plovdiv", pick_up_at: 2.days.from_now, status: "cancelled" },
]

requests_data.each do |data|
  req = Request.create!(data)
end
puts "Requests created"
