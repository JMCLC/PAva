myfavouriteanimals = ("peguins", "cats", "sugargliders")

myfavouriteanimals[1]

#
#myfavouriteanimals[1] = "otters"

myfavouriteanimals = (bird = "peguins", mammal = "cats", marsupial = "sugargliders")

myfavouriteanimals[1]

myfavouriteanimals.mammal

myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

myphonebook["Jenny"]

myphonebook["Kramer"] = "555-FILK"

myphonebook

pop!(myphonebook, "Kramer")

myphonebook

#Dictionaries can not be indexed by number, only by key
#myphonebook[1]

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

fibonacci = [1, 1, 2, 3, 5, 8, 13]

mixture = [1, 1, 2, 3, "Ted", "Robyn"]  # This is a mixture of strings and numbers

#Arrays can be indexed by number
myfriends[3]

#Exercise 1

a_ray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

push!(a_ray, 11)

pop!(a_ray)

a_ray