User.create(email: "admin@example.com", password: "1", role: "admin")
puts "Admin user created: admin@example.com / password: 1"

User.create(email: "courier@example.com", password: "1", role: "courier")
puts "Courier user created: courier@example.com / password: 1"

User.create(email: "operator@example.com", password: "1", role: "operator")
puts "Operator user created: operator@example.com / password: 1"

User.create(email: "coordinator@example.com", password: "1", role: "coordinator")
puts "Coordinator user created: coordinator@example.com / password: 1"
