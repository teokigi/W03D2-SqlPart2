require_relative('models/property_register.rb')


property01 = PropertyRegister.new({'address' => '123 california road',
                                   'value' => 40000,
                                   'bedrooms' => 5,
                                   'year' => 1990
                                  })
property02 = PropertyRegister.new({'address' => '234 texas road',
                                   'value' => 40000,
                                   'bedrooms' => 5,
                                   'year' => 1990
                                  })
property03 = PropertyRegister.new({'address' => '345 kansas road',
                                   'value' => 20000,
                                   'bedrooms' => 5,
                                   'year' => 1990
                                  })
property04 = PropertyRegister.new({'address' => '456 glasgow road',
                                   'value' => 50000,
                                   'bedrooms' => 4,
                                   'year' => 1990
                                  })
property05 = PropertyRegister.new({'address' => '567 london road',
                                   'value' => 20000,
                                   'bedrooms' => 4,
                                   'year' => 1990
                                  })
property06 = PropertyRegister.new({'address' => '678 graveyard road',
                                   'value' => 50000,
                                   'bedrooms' => 4,
                                   'year' => 2000
                                  })
property07 = PropertyRegister.new({'address' => '789 happy road',
                                   'value' => 60000,
                                   'bedrooms' => 3,
                                   'year' => 2000
                                  })
property08 = PropertyRegister.new({'address' => '890 derpy road',
                                   'value' => 60000,
                                   'bedrooms' => 3,
                                   'year' => 2000
                                  })
property09 = PropertyRegister.new({'address' => '901 updown road',
                                   'value' => 70000,
                                   'bedrooms' => 3,
                                   'year' => 2000
                                  })
property10 = PropertyRegister.new({'address' => '12 lefty road',
                                   'value' => 10000,
                                   'bedrooms' => 2,
                                   'year' => 2000
                                  })
#delete all function
answer = ""
while answer != "exit"
    #clears table
    p "clear table? yes/no?"
    answer = gets.chomp
    if answer == "yes"
        PropertyRegister.delete_all()
        answer = ""
    end
    #call save instance method.
    p "save(create)  entry? yes/no?"
    answer = gets.chomp
    if answer == "yes"
        property01.save()
        property02.save()
        property03.save()
        property04.save()
        property05.save()
        property06.save()
        property07.save()
        property08.save()
        property09.save()
        property10.save()
        answer = ""
    end
    #update entry
    property01.address = "500 Diahrea road"
    property01.value = 100000
    property01.bedrooms = 7
    property01.year = 2010
    p "Update entry? yes/no?"
    answer = gets.chomp
    if answer == "yes"
        property01.update()
        answer = ""
    end
    #read all entry
    p "Would you like to read all entries? yes/no"
    answer = gets.chomp
    if answer == "yes"
        summary = PropertyRegister.read_all()
        for properties in summary
            p "id:#{properties.id}| address: #{properties.address}| bedrooms: #{properties.bedrooms}| year built: #{properties.year}| value: #{properties.value}"
        end
        answer = ""
    end
    #search by id
    p "Would you like to search by id? yes/no"
    answer = gets.chomp
    if answer == "yes"
        p "which property id would you like to read"
        answer = gets.chomp
        summary = PropertyRegister.find_by_id(answer.to_i)
        for properties in summary
            p "id:#{properties.id}| property on: '#{properties.address}', has #{properties.bedrooms} bedrooms, built in #{properties.year}, worth £#{properties.value}"
            p "would you like to edit entry? yes/no"
            if gets.chomp == "yes"
                p "enter address"
                p_address = gets.chomp
                p "enter number of bedrooms"
                p_bedrooms = gets.chomp
                p "enter year property was built in"
                p_year = gets.chomp
                p "enter property value"
                p_value = gets.chomp
                propertyxx = {'address'=> p_address,
                              'bedrooms' => p_bedrooms,
                              'year'=> p_year,
                              'value'=> p_value,
                              'id'=> answer}
                PropertyRegister.update_by_id(propertyxx)
            end
        end
        answer = ""
    end
    #search by address
    p "Would you like to search by address? yes/no"
    answer = gets.chomp
    if answer == "yes"
        p "enter address of property"
        answer = gets.chomp
        summary = PropertyRegister.find_by_address(answer)
        for properties in summary
            p "id:#{properties.id}| address: #{properties.address}| bedrooms: #{properties.bedrooms}| year built: #{properties.year}| value: #{properties.value}"
        end
    end
    #delete by id
    p "delete an item by id? yes/no?"
    answer = gets.chomp
    if answer == "yes"
        p "enter item id"
        answer = gets.chomp
        summary = PropertyRegister.delete_by_id(answer.to_i)
        answer = ""
    end
p "enter 'exit' to quit or hit enter key to repeat"
answer = gets.chomp
end
