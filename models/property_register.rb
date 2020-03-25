require('pg')
class PropertyRegister
    attr_accessor :address, :value, :bedrooms, :year
    attr_reader :id
    def initialize(property_information)

        @address = property_information['address']
        @value = property_information['value']
        @bedrooms = property_information['bedrooms']
        @year = property_information['year']
        @id = property_information['id'].to_i if property_information['id']

    end
#Create function
    def save
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "INSERT INTO property_register (address,
                                               value,
                                            bedrooms,
                                                 year) VALUES
                                                 ($1,$2,$3,$4) RETURNING *"
        values = [@address,@value,@bedrooms,@year]
        db.prepare("save", sql)
        @id = db.exec_prepared("save", values)[0]["id"].to_i
        db.close()
    end
#delete function
    def PropertyRegister.delete_by_id(id_number)
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "DELETE FROM property_register WHERE id = $1"
        values = [id_number]
        db.prepare("delete_by_id", sql)
        db.exec_prepared("delete_by_id", values)
        db.close
    end
#read item with id
    def PropertyRegister.find_by_id(id_number)
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "SELECT * FROM property_register WHERE id = $1"
        values = [id_number]
        db.prepare("find_by_id", sql)
        summary = db.exec_prepared("find_by_id",values)
        db.close
        return summary.map{|properties|PropertyRegister.new(properties)}
    end
#find item with address
    def PropertyRegister.find_by_address(address)
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "SELECT * FROM property_register WHERE address = $1"
        values = [address]
        db.prepare("find_by_address",sql)
        summary = db.exec_prepared("find_by_address",values)
        db.close
        return summary.map{|properties|PropertyRegister.new(properties)}
    end
#delete all items
    def PropertyRegister.delete_all()
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "DELETE FROM property_register"
        db.prepare("delete", sql)
        db.exec_prepared("delete")
        db.close
    end
#read all entries
    def PropertyRegister.read_all()
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "SELECT * FROM property_register"
        db.prepare("read_all", sql)
        summary = db.exec_prepared("read_all")
        db.close
        return summary.map{|properties|PropertyRegister.new(properties)}
    end
#update entry
    def update
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "UPDATE property_register SET (address,value,bedrooms,year) = (
        '#{address}',
        '#{value}',
        '#{bedrooms}',
        '#{year}'
        ) WHERE id = '#{id}'"
        db.prepare("update", sql)
        db.exec_prepared("update")
        db.close
    end

    def PropertyRegister.update_by_id(property)
        db = PG.connect({dbname:'property_register',host:'localhost'})
        sql = "UPDATE property_register SET (address,value,bedrooms,year) = (
            $1,$2,$3,$4) WHERE id = $5"
            values =[property['address'],
                     property['value'],
                     property['bedrooms'],
                     property['year'],
                     property['id']]
        db.prepare("update_by_id", sql)
        db.exec_prepared("update_by_id", values)
        db.close
    end


end
