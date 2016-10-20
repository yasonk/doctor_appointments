orthodontist = Specialty.create!(name: 'Orthopedist')
opthamologist = Specialty.create!(name: 'Opthamologist')
cardiologist = Specialty.create!(name: 'Cardiologist')

orthodontist.ailments.create!(name: 'broken bones')
opthamologist.ailments.create!(name: 'eye trouble')
cardiologist.ailments.create!(name: 'heart disease')
